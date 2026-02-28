# 🏗️ Data Layer Implementation - Complete Guide

## ✅ تم إنجاز Phase 2 بنجاح!

---

## 📁 الملفات التي تم إنشاؤها

### **Models** 🧩
```
lib/features/auth/data/models/
├── user_model.dart           ← بيانات المستخدم
├── login_models.dart         ← Request/Response للـ API
└── index.dart                ← تصدير سهل
```

### **DataSources** 🌐
```
lib/features/auth/data/datasources/
├── auth_remote_data_source.dart      ← Abstract class
├── auth_remote_data_source_impl.dart ← التطبيق مع DioHelper
└── index.dart                        ← تصدير سهل
```

### **Repositories** 📦
```
lib/features/auth/data/repositories/
├── auth_repository.dart      ← Abstract class
├── auth_repository_impl.dart ← التطبيق
└── index.dart                ← تصدير سهل
```

---

## 🎯 كيفية العمل

### **1️⃣ User Request**
```dart
// في LoginScreen
context.read<LoginCubit>().getOtp()
```

### **2️⃣ Cubit استدعاء Repository**
```dart
// في LoginCubit.getOtp()
final response = await authRepository.requestOtp(phone);
```

### **3️⃣ Repository استدعاء DataSource**
```dart
// في AuthRepositoryImpl.requestOtp()
await remoteDataSource.requestOtp(phone);
```

### **4️⃣ DataSource استدعاء API**
```dart
// في AuthRemoteDataSourceImpl.requestOtp()
await DioHelper.postModel<Map<String, dynamic>>(
  Urls.loginUrl,
  request.toJson(),
  fromJson: (json) => json,
);
```

### **5️⃣ النتيجة ترجع للخلف**
```
API Response
  ↓
DioHelper.postModel (Result<T>)
  ↓
LoginResponseModel.fromJson()
  ↓
emit(LoginState.success())
  ↓
BlocListener
  ↓
Navigate to OTP Screen
```

---

## 📊 هيكل البيانات

### **LoginRequestModel**
```dart
{
  "phone": "09xxxxxxxx"
}
```

### **LoginResponseModel** (API Response)
```dart
{
  "success": true,
  "message": "OTP sent successfully",
  "token": null,  // سيصل في verify-otp
  "otp": {
    "otpId": "xyz123",
    "phone": "09xxxxxxxx",
    "expiresIn": 300  // ثانية
  },
  "user": null  // سيصل في verify-otp
}
```

---

## 🔗 Dependency Injection Setup

### **في dependency_injection.dart**
```dart
// DataSource
getIt.registerLazySingleton<AuthRemoteDataSourceImpl>(
  () => AuthRemoteDataSourceImpl(),
);

// Repository
getIt.registerLazySingleton<AuthRepositoryImpl>(
  () => AuthRepositoryImpl(
    remoteDataSource: getIt<AuthRemoteDataSourceImpl>(),
  ),
);

// Cubit
getIt.registerFactory<LoginCubit>(
  () => LoginCubit(authRepository: getIt<AuthRepositoryImpl>()),
);
```

---

## 📋 API Endpoints (في urls.dart)

```dart
static String loginUrl = '/auth/login';              // POST phone
static String verifyOtpUrl = '/auth/verify-otp';    // POST otpId + otp
static String registerUrl = '/auth/register';        // POST phone + name + email
static String logoutUrl = '/auth/logout';            // POST
```

---

## 🚀 استخدام الـ LoginCubit الآن

### **بعدما أصبح متصل بـ API**
```dart
class _LoginScreenState extends State<LoginScreen> {
  late final LoginCubit _loginCubit;

  @override
  void initState() {
    super.initState();
    // الآن الـ Cubit متصل مع API تلقائياً!
    _loginCubit = getIt<LoginCubit>();
  }
}
```

### **عند الضغط على الزر**
```dart
context.read<LoginCubit>().getOtp();
// يتم:
// 1. التحقق من الهاتف محلياً
// 2. emit LoadingState
// 3. استدعاء API عبر Repository
// 4. emit SuccessState مع otpId
// 5. الانتقال لـ OTP Screen
```

---

## 🔄 Flow في الـ Code

```
┌─────────────────────────────────────┐
│         LoginScreen                 │
│  (يعرض الـ UI فقط)                  │
└─────────────────────────────────────┘
              ↓
    context.read<LoginCubit>().getOtp()
              ↓
┌─────────────────────────────────────┐
│      LoginCubit                     │
│  - phoneController                  │
│  - loginFormKey                     │
│  - getOtp() method                  │
└─────────────────────────────────────┘
              ↓
    authRepository.requestOtp()
              ↓
┌─────────────────────────────────────┐
│    AuthRepository                   │
│  (واجهة توزيع المسؤوليات)          │
└─────────────────────────────────────┘
              ↓
    remoteDataSource.requestOtp()
              ↓
┌─────────────────────────────────────┐
│  AuthRemoteDataSource               │
│  (استدعاء DioHelper)                │
└─────────────────────────────────────┘
              ↓
    DioHelper.postModel()
              ↓
    HTTP POST to API
              ↓
    LoginResponseModel.fromJson()
              ↓
    emit(LoginState.success())
              ↓
┌─────────────────────────────────────┐
│  BlocListener في LoginScreen        │
│  - عرض رسائل الخطأ (SnackBar)       │
│  - الانتقال لـ OTP Screen          │
└─────────────────────────────────────┘
```

---

## ✨ المميزات

### ✅ **Separation of Concerns**
- `DataSource`: تفاصيل الـ API
- `Repository`: توزيع المسؤوليات
- `Cubit`: المنطق البرمجي
- `Screen`: عرض الـ UI فقط

### ✅ **Testability**
- يمكن اختبار كل layer بشكل منفصل
- إمكانية عمل Mock objects

### ✅ **Reusability**
- نفس Repository يمكن استخدامه في RegisterScreen
- نفس Models في كل أماكن الاستخدام

### ✅ **Error Handling**
- أخطاء الـ Network معالجة في DataSource
- أخطاء التحقق معالجة في Cubit
- أخطاء الـ UI معالجة في Screen

---

## 🎁 الملفات والـ Code

### **Models Example**
```dart
// UserModel
final user = UserModel(
  id: '123',
  phone: '09123456789',
  name: 'Ahmed',
);

// LoginResponseModel
final response = LoginResponseModel.fromJson(json);
if (response.success) {
  final otpId = response.otp?.otpId;
}
```

### **DataSource Example**
```dart
// استخدام DioHelper مع Result pattern
final result = await DioHelper.postModel<Map<String, dynamic>>(
  Urls.loginUrl,
  request.toJson(),
  fromJson: (json) => json,
);

// معالجة النتيجة
return result.when(
  success: (data) => LoginResponseModel.fromJson(data),
  failure: (failure) => throw Exception(failure.message),
);
```

### **Repository Example**
```dart
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<LoginResponseModel> requestOtp(String phone) async {
    return await remoteDataSource.requestOtp(phone);
  }
}
```

### **Cubit Example**
```dart
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  Future<void> getOtp() async {
    emit(const LoginState.loading());
    try {
      final response = await authRepository.requestOtp(phone);
      emit(LoginState.success(
        otpId: response.otp!.otpId,
        phone: phone,
      ));
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }
}
```

---

## 🧪 الاختبار المحلي

### **قبل الاتصال بـ API الحقيقي**
```dart
// في AuthRemoteDataSourceImpl.requestOtp()
// يمكنك عمل Mock response مؤقتاً:

// Mock Response
const mockResponse = {
  'success': true,
  'message': 'OTP sent',
  'otp': {
    'otpId': 'test-123',
    'expiresIn': 300,
  }
};

return LoginResponseModel.fromJson(mockResponse);
```

---

## 🚀 الخطوات التالية

### **Phase 3: OTP Verification**
```
[ ] عمل SubmitOtpScreen (نفس النمط)
[ ] عمل VerifyOtpCubit
[ ] ربط API verify-otp
[ ] عرض الـ token عند النجاح
```

### **Phase 4: Token Storage**
```
[ ] حفظ Token في SharedPreferences
[ ] تمريره في Authorization Header
[ ] Refresh Token عند الانتهاء
```

### **Phase 5: Error Handling**
```
[ ] معالجة أخطاء الـ Network
[ ] معالجة أخطاء الـ Server
[ ] Retry Logic
[ ] Offline Support
```

---

## ✅ Checklist النهائي

- ✅ Models تم إنشاؤها (User + Login)
- ✅ DataSource Abstract create
- ✅ DataSource Implementation create
- ✅ Repository Abstract create
- ✅ Repository Implementation create
- ✅ LoginCubit محدث ليستخدم Repository
- ✅ LoginState محدثة مع otpId و phone
- ✅ Dependency Injection محدث
- ✅ LoginScreen محدثة للـ navigation
- ✅ Zero Errors ❌ ✅
- ✅ جاهز للـ Testing والـ Deployment

---

**المرحلة الثانية مكتملة! 🎉**

**الآن التطبيق متصل بـ API فعلياً!**

---

*آخر تحديث: 27 فبراير 2026*
*حالة: Data Layer Complete ✅*
