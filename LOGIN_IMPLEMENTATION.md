# 🔐 Login Feature - Implementation Guide

## 📍 ملفات تم إنشاؤها/تحديثها

### 1. **LoginCubit** ✨
📄 `lib/features/auth/bloc/login_cubit.dart`
- إدارة حالة تسجيل الدخول
- التحقق من صحة رقم الهاتف
- معالجة الأخطاء والنجاح

```dart
// الحصول على الـ Cubit من GetIt
final loginCubit = getIt<LoginCubit>();

// استخدام المتغيرات
loginCubit.phoneController;   // للتحكم برقم الهاتف
loginCubit.loginFormKey;      // للتحقق من النموذج

// استدعاء الدوال
await loginCubit.getOtp();    // طلب OTP
```

### 2. **تقسيم Widgets** 🎨
```
lib/features/auth/presentation/widgets/
├── login_image.dart   → الصورة التوضيحية
├── login_form.dart    → حقل الهاتف
└── login_button.dart  → زر GET OTP
```

### 3. **Dependency Injection** 🔗
```dart
// في lib/global/utils/di/dependency_injection.dart
getIt.registerFactory<LoginCubit>(() => LoginCubit());
```

---

## 🎯 كيفية الاستخدام

### في LoginScreen:

```dart
class _LoginScreenState extends State<LoginScreen> {
  late final LoginCubit _loginCubit;

  @override
  void initState() {
    super.initState();
    _loginCubit = getIt<LoginCubit>();  // الحصول على Cubit من GetIt
  }

  @override
  void dispose() {
    _loginCubit.close();  // تنظيف الموارد
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _loginCubit,
      child: Scaffold(
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is ErrorState) {
              // عرض رسالة خطأ
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is SuccessState) {
              // الانتقال للشاشة التالية
              context.go(RouterPath.submitOtpScreen);
            }
          },
          child: Column(
            children: [
              LoginImage(),
              LoginForm(
                phoneController: _loginCubit.phoneController,
                formKey: _loginCubit.loginFormKey,
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return LoginButton(
                    isLoading: state is LoadingState,
                    onPressed: () => context.read<LoginCubit>().getOtp(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 🔄 تدفق الحالات

```
Initial → User Enters Phone → Click Button
    ↓
Loading (عرض spinner في الزر)
    ↓
├─→ Success (الانتقال لـ OTP Screen)
└─→ Error (عرض رسالة في SnackBar)
```

---

## ✅ القوائم المدققة

- ✅ نقل `phoneController` من `_LoginScreenState` إلى `LoginCubit`
- ✅ نقل `loginFormKey` من `_LoginScreenState` إلى `LoginCubit`
- ✅ التحقق من الهاتف يتم في `LoginCubit` وليس في الـ UI
- ✅ عرض رسائل الخطأ عبر `BlocListener`
- ✅ الزر يتعطل أثناء التحميل
- ✅ فصل الـ widgets إلى ملفات منفصلة
- ✅ تسجيل `LoginCubit` في `GetIt`

---

## 🚀 الخطوات التالية

1. **ربط API**: استبدل `TODO` في `getOtp()` بـ كول API حقيقي
2. **Repository Pattern**: أنشئ `AuthRepository` للتعامل مع requests
3. **Error Handling**: أضف معالجة أفضل للأخطاء (network errors, etc)
4. **Validation**: أضف التحقق من المدخلات بشكل أكثر تعقيداً

---

**جاهز للعمل! هندسياً، البنية الآن احترافية وجاهزة للتطوير المستقبلي 🎉**
