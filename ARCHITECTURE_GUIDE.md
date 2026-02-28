# 📐 Clean Architecture Implementation - Login Feature

## 🎯 نظرة عامة
تم تطبيق معايير **Clean Architecture** على ميزة تسجيل الدخول (Login) وفقاً لمعايير شركة Widespheres. تم فصل المنطق البرمجي عن واجهة المستخدم بشكل كامل.

---

## 📁 هيكل الملفات

### 1️⃣ **Logic Layer (مجلد الـ Bloc)**
```
lib/features/auth/bloc/
├── login_cubit.dart         ← الملف الرئيسي (يحتوي على المنطق والـ States)
├── login_state.dart         ← (part of login_cubit.dart)
└── index.dart               ← تصدير سهل (barrel file)
```

#### 📄 **login_cubit.dart**
- **TextEditingController**: لإدارة نص رقم الهاتف
- **GlobalKey<FormState>**: للتحقق من صحة النموذج
- **Methods**:
  - `getOtp()`: التحقق من الرقم وطلب OTP
  - `_validatePhoneNumber()`: التحقق من صيغة الرقم (09XXXXXXXX)
  - `clearError()`: مسح رسالة الخطأ

#### 🔔 **States** (في login_state.dart):
- `InitialState`: الحالة الأولية
- `LoadingState`: أثناء الطلب
- `SuccessState`: النجاح
- `ErrorState`: الخطأ مع رسالة

---

### 2️⃣ **Presentation Layer (مجلد الـ Widgets)**
```
lib/features/auth/presentation/
├── screens/
│   └── login_screen.dart    ← الشاشة الرئيسية (Dumb UI)
├── widgets/
│   ├── login_image.dart     ← الصورة التوضيحية فقط
│   ├── login_form.dart      ← حقل الهاتف والنصوص
│   ├── login_button.dart    ← زر "GET OTP"
│   └── index.dart           ← تصدير سهل
└── index.dart               ← تصدير الـ screens و widgets
```

#### 🎨 **login_image.dart**
- عرض صورة `login_illustration.svg`
- بحجم ثابت (206w x 206h)
- Stateless widget بسيط جداً

#### 📝 **login_form.dart**
- حقل إدخال رقم الهاتف
- نصوص الترحيب والتعليمات
- يستقبل `phoneController` و `formKey` من الـ parent

#### 🔘 **login_button.dart**
- زر "GET OTP" بتصميم custom
- دعم حالة `isLoading` (يظهر spinner بدلاً من النص)
- يتعطل الزر عند التحميل

#### 📱 **login_screen.dart**
- **Dumb UI**: لا تحتوي على أي منطق برمجي
- تستخدم `BlocProvider.value` لتوفير `LoginCubit`
- تستخدم `BlocListener` للتعامل مع الأخطاء والنجاح
- تستخدم `BlocBuilder` لإعادة بناء الزر عند تغيير الحالة

---

### 3️⃣ **Dependency Injection (DI)**
```
lib/global/utils/di/
└── dependency_injection.dart
```

#### 🔗 **الإعدادات**:
```dart
/// تسجيل LoginCubit باستخدام registerFactory
/// هذا يعني: نسخة جديدة في كل مرة يتم الدخول للشاشة
getIt.registerFactory<LoginCubit>(() => LoginCubit());
```

---

## 🚀 كيفية الاستخدام

### 1️⃣ في الشاشة:
```dart
final loginCubit = getIt<LoginCubit>();  // الحصول على نسخة من الـ Cubit
```

### 2️⃣ عند الضغط على الزر:
```dart
context.read<LoginCubit>().getOtp();  // استدعاء الدالة
```

### 3️⃣ الاستماع للحالات:
```dart
BlocListener<LoginCubit, LoginState>(
  listener: (context, state) {
    if (state is ErrorState) {
      // عرض رسالة خطأ
    } else if (state is SuccessState) {
      // الانتقال للشاشة التالية
    }
  },
  ...
)
```

---

## ✅ الفوائد

| الفائدة | الشرح |
|--------|-------|
| **Single Responsibility** | كل ملف له مسؤولية واحدة فقط |
| **Dumb UI** | الواجهات لا تعرف كيفية العمل، فقط تطلب من الـ Cubit |
| **قابل للاختبار** | يمكن اختبار المنطق بعيداً عن الـ UI |
| **قابل للتوسع** | سهل إضافة ميزات جديدة دون تعديل الملفات الموجودة |
| **سهل الصيانة** | الكود منظم ومقسم بشكل واضح |

---

## 📋 Checklist التطبيق

- ✅ إنشاء `LoginCubit` مع `phoneController` و `loginFormKey`
- ✅ إنشاء `LoginState` مع جميع الحالات
- ✅ تسجيل `LoginCubit` في `GetIt` باستخدام `registerFactory`
- ✅ تقسيم `login_screen.dart` إلى widgets صغيرة:
  - ✅ `login_image.dart`
  - ✅ `login_form.dart`
  - ✅ `login_button.dart`
- ✅ تحديث `login_screen.dart` ليستخدم `BlocProvider` و `BlocListener`
- ✅ إضافة معالجة الأخطاء والنجاح
- ✅ تحديث `urls.dart` مع تعليقات واضحة

---

## 🔄 الخطوات التالية

### Phase 2: إنشاء Data Layer
- [ ] إنشاء **AuthRepository**
- [ ] إنشاء **LoginDataSource** (Remote)
- [ ] ربط `Login API` بـ `LoginCubit`

### Phase 3: إنشاء Models & Entities
- [ ] إنشاء `User` model
- [ ] إنشاء `OtpRequest` entity
- [ ] إنشاء `OtpResponse` entity

### Phase 4: إضافة الـ Testing
- [ ] Unit tests لـ `LoginCubit`
- [ ] Widget tests لـ `LoginScreen`
- [ ] Integration tests

---

**تم التطبيق وفقاً لمعايير Clean Architecture والمتطلبات الاحترافية! 🎉**
