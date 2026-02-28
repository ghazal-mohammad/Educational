# 📂 Project Structure - Clean Architecture

## الهيكل الكامل للمشروع

```
lib/
├── features/                          # ميزات التطبيق
│   ├── auth/                          # ميزة المصادقة
│   │   ├── bloc/                      # 🧠 المنطق البرمجي
│   │   │   ├── login_cubit.dart       # إدارة حالة تسجيل الدخول
│   │   │   ├── login_state.dart       # (part of login_cubit.dart)
│   │   │   └── index.dart             # تصدير barrel
│   │   │
│   │   ├── data/                      # 📊 طبقة البيانات (قريباً)
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   │
│   │   ├── presentation/              # 🎨 الواجهة
│   │   │   ├── screens/
│   │   │   │   └── login_screen.dart  # الشاشة الرئيسية (Dumb UI)
│   │   │   │
│   │   │   └── widgets/               # إعادة استخدام الـ widgets
│   │   │       ├── login_image.dart   # الصورة
│   │   │       ├── login_form.dart    # النموذج
│   │   │       ├── login_button.dart  # الزر
│   │   │       └── index.dart         # تصدير barrel
│   │   │
│   │   ├── index.dart                 # تصدير كامل الـ feature
│   │   │
│   │   ├── explore/                   # ميزة أخرى
│   │   ├── home/                      # ميزة أخرى
│   │   ├── library/                   # ميزة أخرى
│   │   ├── main/                      # ميزة أخرى
│   │   └── profile/                   # ميزة أخرى
│   │
│   └── ...
│
├── global/                            # 🌐 الموارد المشتركة
│   ├── bloc/                          # Blocs عالمية
│   │   ├── theme_bloc/
│   │   └── localization_bloc/
│   │
│   ├── core/                          # أساسيات التطبيق
│   │   └── app_state.dart
│   │
│   ├── design/                        # 🎨 التصميم والألوان
│   │   ├── color_app.dart             # الألوان
│   │   └── common_sizes.dart          # المسافات والأحجام
│   │
│   ├── components/                    # 🧩 مكونات عامة
│   │   ├── empty_list_widget.dart
│   │   └── error_widget_screen.dart
│   │
│   ├── networking/                    # 🌐 الشبكة
│   │   ├── dio_helper.dart
│   │   └── result_freezed.dart
│   │
│   └── utils/                         # 🔧 الأدوات
│       ├── consts/
│       │   ├── assets.dart            # مسارات الموارد
│       │   └── urls.dart              # عناوين API
│       │
│       ├── di/
│       │   └── dependency_injection.dart  # 🔗 حقن التبعيات
│       │
│       ├── enums/
│       ├── functions/
│       ├── helper/
│       ├── reuses_widgets/
│       └── router/
│
├── main.dart                          # نقطة البداية

```

## 🎯 معنى كل مجلد

| المجلد | الغرض | الملاحظات |
|-------|-------|----------|
| `bloc/` | إدارة الحالة المحلية | منطق بسيط خاص بـ feature |
| `data/` | طبقة البيانات | repositories, datasources, models |
| `presentation/` | الواجهة | screens, widgets, pages |
| `global/` | موارد مشتركة | themes, colors, constants |
| `utils/` | أدوات مساعدة | helpers, routers, DI |

## 📦 نمط الـ Barrel Files (`index.dart`)

```dart
// lib/features/auth/bloc/index.dart
export 'login_cubit.dart';

// بهذا نستطيع العمل:
// import 'package:lms/features/auth/bloc/index.dart';
// بدلاً من:
// import 'package:lms/features/auth/bloc/login_cubit.dart';
```

## 🔗 نمط Dependency Injection

```dart
// في lib/global/utils/di/dependency_injection.dart
final getIt = GetIt.instance;

void dependencyInjectionSetup() {
  // تسجيل الـ cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit());
  
  // تسجيل الـ repositories
  // getIt.registerLazySingleton<AuthRepository>(...);
  
  // تسجيل الـ data sources
  // getIt.registerLazySingleton<AuthDataSource>(...);
}
```

## ✨ مميزات البنية

### 1. **Single Responsibility Principle**
- كل ملف مسؤول عن شيء واحد فقط
- `login_image.dart` فقط للصورة
- `login_form.dart` فقط للنموذج
- `login_cubit.dart` فقط للمنطق

### 2. **Scalability**
- إضافة feature جديد = مجلد جديد
- لا حاجة لتعديل الكود الموجود

### 3. **Testability**
- يمكن اختبار المنطق بعيداً عن الـ UI
- Widgets يمكن اختبارها بسهولة

### 4. **Maintainability**
- الكود منظم وسهل الفهم
- سهل العثور على الملفات

---

**هذا هو نمط Clean Architecture! 🏗️**
