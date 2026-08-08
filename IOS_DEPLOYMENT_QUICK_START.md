# 🚀 دليل الرفع السريع على App Store

## 📱 معلومات التطبيق
```
📱 الاسم: مؤسسة فرسان التعافي (Forsan Eltaafyوظبط)
🔖 Bundle ID: com.mored.forsaneltaafy
📦 Version: 1.0.0 (Build 11)
💻 Min iOS: 13.0
```

## الخطوات السريعة

### 1️⃣ تجهيز البيئة (5 دقائق)

```bash
# تأكد من تثبيت Flutter و Xcode
flutter doctor

# نظف المشروع واحصل على Dependencies
flutter clean
flutter pub get
```

### 2️⃣ تحديث Apple Developer Portal (10 دقائق)

1. اذهب إلى: https://developer.apple.com/account
2. **Identifiers** → إنشاء App ID جديد:
   - Bundle ID: `com.mored.forsaneltaafy`
3. **Certificates** → تأكد من وجود Distribution Certificate
4. **Profiles** → إنشاء App Store Distribution Profile

### 3️⃣ تحديث ملفات المشروع (5 دقائق)

افتح وعدّل الملفات التالية:

**A. `ios/fastlane/Appfile`**
```ruby
app_identifier("com.mored.forsaneltaafy")
apple_id("your_email@example.com")  # ← غيّر هذا
itc_team_id("YOUR_TEAM_ID")         # ← غيّر هذا
team_id("YOUR_TEAM_ID")             # ← غيّر هذا
```

**B. `ios/ExportOptions.plist`**
```xml
<key>teamID</key>
<string>YOUR_TEAM_ID</string>  <!-- ← غيّر هذا -->
```

### 4️⃣ بناء التطبيق (10 دقائق)

```bash
# شغّل السكريبت الجاهز
./build_ios.sh
```

أو يدوياً:
```bash
flutter clean
flutter pub get
cd ios && pod install && cd ..
flutter build ios --release --no-codesign
```

### 5️⃣ التوقيع والأرشفة في Xcode (10 دقائق)

```bash
# افتح Workspace
open ios/Runner.xcworkspace
```

في Xcode:
1. اختر Runner من القائمة اليسرى
2. **Signing & Capabilities**:
   - اختر Team الخاص بك
   - Bundle Identifier سيكون: `com.mored.forsaneltaafy`
   - فعّل "Automatically manage signing"
3. اختر **Any iOS Device (arm64)** من قائمة الأجهزة
4. **Product** → **Archive**

### 6️⃣ رفع على App Store Connect (5 دقائق)

بعد انتهاء الأرشفة:
1. سيفتح نافذة **Organizer**
2. اختر **Distribute App**
3. اختر **App Store Connect**
4. اختر **Upload**
5. اتبع الخطوات واضغط **Upload**

### 7️⃣ إعداد App Store Connect (30 دقيقة)

اذهب إلى: https://appstoreconnect.apple.com

#### A. إنشاء التطبيق
1. **My Apps** → **+** → **New App**
2. املأ البيانات:
   - Platform: iOS
   - Name: مؤسسة فرسان التعافي
   - Primary Language: Arabic
   - Bundle ID: اختر `com.mored.forsaneltaafy`
   - SKU: `forsaneltaafyوظبط`

#### B. ملء المعلومات الأساسية

**App Information**:
- Name: فرسان التعافي
- Subtitle: (وصف قصير - 30 حرف)
- Category: (اختر الفئة المناسبة)
- Privacy Policy URL: (يجب توفير رابط)
- Support URL: (رابط الدعم)

**Pricing and Availability**:
- Price: Free (أو اختر سعر)
- Availability: (اختر الدول)

#### C. إعداد الإصدار

في تبويب **App Store**:

1. **What's New in This Version**: (اكتب ما الجديد)
2. **Promotional Text**: (نص ترويجي - اختياري)
3. **Description**: (وصف كامل للتطبيق)
4. **Keywords**: (كلمات مفتاحية - 100 حرف)
5. **Screenshots**: (ارفع 3-10 صور لكل حجم)
6. **App Icon**: (1024x1024 - موجود بالفعل في المشروع)

#### D. ربط البناء

1. انتظر معالجة Build (10-20 دقيقة)
2. في قسم **Build**، اضغط **+**
3. اختر Build الذي رفعته
4. احفظ

### 8️⃣ الإرسال للمراجعة

1. راجع جميع المعلومات
2. أجب على أسئلة **Export Compliance**: اختر "No" للتشفير إذا لم تستخدمه
3. املأ **App Privacy**: حدد البيانات التي يجمعها التطبيق
4. أضف ملاحظات للمراجع (اختياري)
5. اضغط **Submit for Review**

## ✅ Checklist سريع

- [ ] حساب Apple Developer نشط ($99/سنة)
- [ ] App ID تم إنشاؤه
- [ ] Distribution Certificate موجود
- [ ] Provisioning Profile تم إنشاؤه
- [ ] Team ID تم تحديثه في الملفات
- [ ] Build تم بنجاح
- [ ] Archive تم في Xcode
- [ ] Upload تم بنجاح
- [ ] App تم إنشاؤه في App Store Connect
- [ ] Screenshots تم رفعها (3-10 صور)
- [ ] Privacy Policy URL تم إضافته
- [ ] App Icon تم إضافته (1024x1024)
- [ ] Description تم كتابته
- [ ] Build تم ربطه
- [ ] تم الإرسال للمراجعة

## 📁 الملفات المهمة

```
├── ios/
│   ├── Runner.xcworkspace          ← افتح هذا في Xcode
│   ├── Podfile                     ← ✅ تم إنشاؤه
│   ├── ExportOptions.plist         ← ✅ تم إنشاؤه (حدّث Team ID)
│   └── fastlane/
│       ├── Fastfile                ← ✅ تم إنشاؤه
│       └── Appfile                 ← ✅ تم إنشاؤه (حدّث IDs)
├── build_ios.sh                    ← ✅ سكريبت البناء
├── APP_STORE_DEPLOYMENT.md         ← 📖 دليل مفصل
├── APP_STORE_CHECKLIST.md          ← ✅ قائمة تحقق كاملة
└── SCREENSHOTS_GUIDE.md            ← 📸 دليل Screenshots
```

## ⚡ أوامر سريعة

```bash
# بناء سريع
./build_ios.sh

# فتح Xcode
open ios/Runner.xcworkspace

# تحديث Pods
cd ios && pod install && cd ..

# بناء بدون توقيع
flutter build ios --release --no-codesign

# رفع باستخدام Fastlane (بعد تحديث IDs)
cd ios && fastlane beta
```

## 🚨 مشاكل شائعة وحلولها

### خطأ: "No provisioning profiles found"
**الحل**:
```
1. افتح Xcode
2. اذهب إلى Preferences → Accounts
3. اختر Apple ID → Download Manual Profiles
4. حاول مرة أخرى
```

### خطأ: "Code signing is required"
**الحل**:
```
في Xcode:
1. اختر Runner → Signing & Capabilities
2. فعّل "Automatically manage signing"
3. اختر Team الصحيح
```

### خطأ: "CocoaPods not installed"
**الحل**:
```bash
sudo gem install cocoapods
pod setup
```

### خطأ: Build failed
**الحل**:
```bash
flutter clean
flutter pub get
cd ios
pod deintegrate
pod install
cd ..
flutter build ios --release
```

## 📞 دعم إضافي

- **Apple Developer Support**: https://developer.apple.com/support/
- **Flutter iOS Deployment**: https://docs.flutter.dev/deployment/ios
- **App Store Guidelines**: https://developer.apple.com/app-store/review/guidelines/

## ⏱️ الوقت المتوقع

| المرحلة | الوقت |
|---------|-------|
| تجهيز Apple Developer Portal | 10 دقيقة |
| بناء التطبيق | 10 دقيقة |
| الأرشفة والرفع | 15 دقيقة |
| إعداد App Store Connect | 30 دقيقة |
| مراجعة Apple | 24-48 ساعة |

**المجموع**: حوالي ساعة للرفع + يومين للمراجعة

---

**🎉 بالتوفيق في رفع التطبيق!**
