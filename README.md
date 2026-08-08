# مؤسسة فرسان التعافي (Forsan Eltaafyوظبط)

تطبيق Flutter للدعم والمساندة - جاهز للنشر على App Store 🚀

## 📱 معلومات التطبيق

- **الاسم**: مؤسسة فرسان التعافي
- **Bundle ID**: `com.mored.forsaneltaafyوظبط`
- **Team ID**: `84M47YB8XR`
- **الإصدار**: 1.0.0 (Build 11)
- **Min iOS**: 13.0
- **المنصات**: iPhone + iPad
- **GitHub**: https://github.com/KeroMored/forsanIOS

## ⚠️ مهم: للبناء على CodeMagic

إذا كنت تستخدم **CodeMagic CI/CD**، **يجب** قراءة هذا الدليل أولاً:

### 📖 [CODEMAGIC_SETUP_GUIDE.md](CODEMAGIC_SETUP_GUIDE.md) ← ابدأ من هنا!

هذا الدليل الشامل يحل جميع مشاكل Code Signing ويشرح:
- ✅ كيفية إنشاء Certificates & Provisioning Profiles في Apple Developer
- ✅ كيفية رفعها على CodeMagic
- ✅ كيفية ربط App Store Connect API
- ✅ حل مشكلة "No valid code signing certificates were found"

**بدون هذه الخطوات، البيلد على CodeMagic سيفشل!**

## 🚀 البدء السريع

### المتطلبات
- Flutter SDK (3.11.0 أو أحدث)
- Xcode 14+ (للـ iOS)
- CocoaPods (للـ iOS)
- Android Studio (للـ Android)

### التثبيت

```bash
# استنساخ المشروع
git clone [repository-url]
cd forsan-elatafe-for-ios-main

# الحصول على Dependencies
flutter pub get

# تشغيل التطبيق
flutter run
```

## 📦 الحزم المستخدمة

- `shared_preferences`: ^2.2.2
- `flutter_screenutil`: ^5.9.3
- `url_launcher`: ^6.2.6
- `font_awesome_flutter`: ^11.0.0 (محدث!)
- `flutter_phone_direct_caller`: ^2.1.0
- `youtube_player_flutter`: ^9.1.3
- `connectivity_plus`: ^6.0.3
- `dio`: ^5.9.2
- `flutter_bloc`: ^9.1.1
- `intl`: ^0.19.0
- `permission_handler`: ^11.0.1
- `equatable`: ^2.0.5

## 📱 الرفع على App Store

تم تجهيز المشروع بالكامل للرفع على App Store. راجع الملفات التالية:

### 🌟 أدلة CodeMagic (مستحسن)
1. **[CODEMAGIC_SETUP_GUIDE.md](CODEMAGIC_SETUP_GUIDE.md)** - دليل CodeMagic الشامل (ابدأ هنا!)
2. **[codemagic.yaml](codemagic.yaml)** - ملف إعداد CI/CD
3. **[export_certificates.sh](export_certificates.sh)** - مساعد تصدير Certificates

### 📖 أدلة الرفع التقليدية
4. **[START_HERE.md](START_HERE.md)** - دليل البدء العام
5. **[IOS_DEPLOYMENT_QUICK_START.md](IOS_DEPLOYMENT_QUICK_START.md)** - دليل البدء السريع (محلي)
6. **[APP_STORE_DEPLOYMENT.md](APP_STORE_DEPLOYMENT.md)** - دليل مفصل خطوة بخطوة
7. **[APP_STORE_CHECKLIST.md](APP_STORE_CHECKLIST.md)** - قائمة التحقق الكاملة
8. **[SCREENSHOTS_GUIDE.md](SCREENSHOTS_GUIDE.md)** - دليل إنشاء Screenshots
9. **[APP_STORE_ASSETS_REQUIREMENTS.md](APP_STORE_ASSETS_REQUIREMENTS.md)** - متطلبات الأصول
10. **[PRIVACY_POLICY_TEMPLATE.md](PRIVACY_POLICY_TEMPLATE.md)** - نموذج سياسة الخصوصية

### ⚡ رفع سريع (CodeMagic - مستحسن)

```bash
# 1. اتبع دليل CODEMAGIC_SETUP_GUIDE.md لإعداد Certificates
# 2. ادفع الكود إلى GitHub (تم بالفعل ✅)
# 3. اربط المشروع في CodeMagic Dashboard
# 4. شغل Build
```

### ⚡ رفع سريع (محلي)

```bash
# 1. بناء التطبيق
./build_ios.sh

# 2. فتح Xcode
open ios/Runner.xcworkspace

# 3. في Xcode: Product → Archive → Distribute
```

### ✅ ما تم إعداده بالكامل

- [x] Bundle ID: `com.mored.forsaneltaafyوظبط`
- [x] Team ID: `84M47YB8XR`
- [x] اسم التطبيق: مؤسسة فرسان التعافي
- [x] أيقونات iPad كاملة (76x76, 152x152, 167x167)
- [x] أذونات الخصوصية (Info.plist)
- [x] ملف Podfile
- [x] ملفات Fastlane
- [x] ملف codemagic.yaml
- [x] سكريبت البناء (build_ios.sh)
- [x] ExportOptions.plist
- [x] الكود على GitHub

### ⚠️ ما يجب فعله للنشر

- [ ] قراءة [CODEMAGIC_SETUP_GUIDE.md](CODEMAGIC_SETUP_GUIDE.md)
- [ ] إنشاء Certificates & Provisioning Profiles
- [ ] رفعها على CodeMagic
- [ ] ربط App Store Connect API
- [ ] إنشاء App في App Store Connect
- [ ] إنشاء Screenshots (3-10 صور)
- [ ] كتابة الوصف والكلمات المفتاحية
- [ ] إعداد Privacy Policy URL
- [ ] تشغيل Build على CodeMagic

## 🏗️ بنية المشروع

```
lib/
├── main.dart
├── core/
│   ├── config/
│   ├── constants/
│   └── utils/
├── features/
│   └── [feature modules]
├── shared/
│   ├── widgets/
│   └── models/
└── ...

ios/
├── Runner.xcworkspace    ← افتح هذا في Xcode
├── Podfile              ← تم إنشاؤه
├── ExportOptions.plist  ← تم إنشاؤه
└── fastlane/           ← تم إعداده
    ├── Fastfile
    └── Appfile

assets/
├── image/
├── montaga/
└── wehda/
```

## 🔧 الأوامر المفيدة

```bash
# تنظيف المشروع
flutter clean

# الحصول على Dependencies
flutter pub get

# تشغيل التطبيق
flutter run

# بناء للـ Release (iOS)
flutter build ios --release

# بناء للـ Release (Android)
flutter build apk --release

# تحليل الكود
flutter analyze

# تشغيل الاختبارات
flutter test
```

## 🍎 iOS Development

```bash
# تثبيت Pods
cd ios && pod install && cd ..

# تحديث Pods
cd ios && pod update && cd ..

# فتح Xcode
open ios/Runner.xcworkspace
```

## 🤖 Android Development

```bash
# بناء APK
flutter build apk

# بناء App Bundle
flutter build appbundle

# فتح Android Studio
open -a /Applications/Android\ Studio.app android/
```

## 📸 Screenshots

لإنشاء Screenshots للـ App Store، راجع: [SCREENSHOTS_GUIDE.md](SCREENSHOTS_GUIDE.md)

الأحجام المطلوبة:
- iPhone 6.7": 1290 x 2796 px
- iPhone 6.5": 1242 x 2688 px

## 🔐 الأذونات

التطبيق يطلب الأذونات التالية:
- **Photos**: للوصول إلى معرض الصور
- **Camera**: لالتقاط الصور
- **Microphone**: لتسجيل الصوت
- **Location**: لخدمات الموقع
- **Phone**: لإجراء المكالمات

## 📞 الدعم

للمساعدة في الرفع على App Store:
- راجع [IOS_DEPLOYMENT_QUICK_START.md](IOS_DEPLOYMENT_QUICK_START.md)
- اقرأ [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)

## 📄 الترخيص

[أضف معلومات الترخيص هنا]

## 👥 المساهمون

[أضف معلومات المساهمين هنا]

---

**جاهز للرفع على App Store!** 🎉

**الخطوة التالية**:
- **للبناء على CodeMagic**: [CODEMAGIC_SETUP_GUIDE.md](CODEMAGIC_SETUP_GUIDE.md)
- **للبناء المحلي**: [START_HERE.md](START_HERE.md) أو [IOS_DEPLOYMENT_QUICK_START.md](IOS_DEPLOYMENT_QUICK_START.md)
