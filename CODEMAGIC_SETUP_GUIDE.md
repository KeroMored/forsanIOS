# دليل إعداد CodeMagic للنشر على App Store

## المشكلة الحالية
CodeMagic مش لاقي certificates و provisioning profiles للـ code signing.

---

## الحل الكامل (خطوة بخطوة)

### الخطوة 1: إنشاء App ID في Apple Developer

1. روح على [Apple Developer Portal](https://developer.apple.com/account/)
2. سجل دخول بحسابك
3. اختار **Certificates, Identifiers & Profiles**
4. من القائمة الجانبية، اختار **Identifiers**
5. اضغط على زر **+** (Plus)
6. اختار **App IDs** → اضغط **Continue**
7. اختار **App** → اضغط **Continue**
8. املأ البيانات:
   - **Description**: مؤسسة فرسان التعافي
   - **Bundle ID**: اختار **Explicit** وحط `com.mored.forsaneltaafy`
9. فعّل الـ Capabilities المطلوبة:
   - ✅ Push Notifications (لو محتاجها)
   - ✅ Associated Domains (لو محتاجها)
   - ✅ Any other capabilities your app needs
10. اضغط **Continue** → **Register**

---

### الخطوة 2: إنشاء Distribution Certificate

#### أ. إنشاء Certificate Signing Request (CSR) على الماك:

1. افتح **Keychain Access** (من Applications → Utilities)
2. من القائمة، اختار **Keychain Access** → **Certificate Assistant** → **Request a Certificate from a Certificate Authority**
3. املأ:
   - **User Email Address**: بريدك الإلكتروني
   - **Common Name**: اسمك أو اسم الشركة
   - **CA Email Address**: اتركه فاضي
   - اختار **Saved to disk**
4. احفظ الملف (CertificateSigningRequest.certSigningRequest)

#### ب. إنشاء Certificate في Apple Developer:

1. ارجع لـ [Apple Developer Portal](https://developer.apple.com/account/)
2. **Certificates, Identifiers & Profiles** → **Certificates**
3. اضغط **+** (Plus)
4. اختار **Apple Distribution** (للنشر على App Store)
5. اضغط **Continue**
6. ارفع ملف CSR اللي عملته
7. اضغط **Continue**
8. حمّل الـ certificate (ملف .cer)
9. دبل كليك على الملف عشان يتنصب في Keychain Access

#### ج. تصدير Certificate كـ .p12:

1. افتح **Keychain Access**
2. من القائمة الجانبية، اختار **My Certificates**
3. دور على Certificate بإسم "Apple Distribution: ..."
4. كليك يمين على الـ certificate → **Export "Apple Distribution: ..."**
5. اختار **Personal Information Exchange (.p12)**
6. احفظه باسم مثلاً `distribution_certificate.p12`
7. **مهم جداً:** حط password قوي واحفظه (هتحتاجه في CodeMagic)

---

### الخطوة 3: إنشاء Provisioning Profile

1. ارجع لـ **Apple Developer Portal**
2. **Certificates, Identifiers & Profiles** → **Profiles**
3. اضغط **+** (Plus)
4. اختار **App Store** (تحت Distribution)
5. اضغط **Continue**
6. اختار الـ App ID: `com.mored.forsaneltaafy`
7. اضغط **Continue**
8. اختار الـ Distribution Certificate اللي عملته في الخطوة 2
9. اضغط **Continue**
10. حط اسم للـ profile مثلاً: `Forsan Eltafy App Store`
11. اضغط **Generate**
12. حمّل الـ provisioning profile (ملف .mobileprovision)

---

### الخطوة 4: إضافة Certificates في CodeMagic

#### الطريقة الأولى: عن طريق UI (الأسهل)

1. روح على [CodeMagic Dashboard](https://codemagic.io/apps)
2. اختار مشروعك (forsanIOS)
3. من القائمة الجانبية، اختار **App settings**
4. اختار **Code signing identities**
5. اختار **iOS code signing**
6. اضغط على **Add key**

#### رفع Distribution Certificate:
1. في قسم **Distribution certificate**:
   - ارفع ملف `.p12` (distribution_certificate.p12)
   - حط الـ password اللي عملته
   - حدد **Certificate type**: Apple Distribution

#### رفع Provisioning Profile:
1. في قسم **Provisioning profiles**:
   - ارفع ملف `.mobileprovision`
   - تأكد إن الـ Bundle ID صحيح: `com.mored.forsaneltaafy`

#### إعداد App Store Connect Integration:
1. روح **Team integrations** (في نفس الصفحة أو من القائمة)
2. اضغط **Connect** جنب **App Store Connect**
3. اتبع الخطوات:
   - روح [App Store Connect](https://appstoreconnect.apple.com/)
   - Users and Access → Keys → App Store Connect API
   - Generate API Key:
     - Name: CodeMagic
     - Access: **Admin** or **App Manager**
   - حمّل الـ API Key (ملف .p8)
   - احفظ الـ **Issuer ID** و **Key ID**
4. ارجع لـ CodeMagic وحط:
   - Issuer ID
   - Key ID
   - ارفع ملف .p8

---

#### الطريقة الثانية: استخدام codemagic.yaml (متقدم)

لو عايز تستخدم `codemagic.yaml` بدل الـ UI:

1. ملف `codemagic.yaml` موجود بالفعل في المشروع
2. لازم تعمل environment variables في CodeMagic:
   - `CM_CERTIFICATE`: محتوى ملف .p12 مشفر بـ base64
   - `CM_CERTIFICATE_PASSWORD`: كلمة سر الـ certificate
   - `CM_PROVISIONING_PROFILE`: محتوى ملف .mobileprovision مشفر بـ base64

**لتشفير الملفات بـ base64:**
```bash
# For certificate
base64 -i distribution_certificate.p12 | pbcopy

# For provisioning profile
base64 -i YourProfile.mobileprovision | pbcopy
```

ثم حط القيم في **App settings** → **Environment variables**

---

### الخطوة 5: تحديث Workflow في CodeMagic

#### لو بتستخدم Workflow Editor (UI):

1. روح **App settings** → **Workflow settings**
2. تأكد من:
   - **Build type**: iOS App
   - **Build mode**: Release
   - **Code signing mode**: Automatic
   - **Distribution type**: App Store
   - **Bundle identifier**: `com.mored.forsaneltaafy`

#### في قسم Build:
- **Flutter version**: Stable
- **Xcode version**: Latest
- **CocoaPods version**: Default

#### في قسم Publishing:
- فعّل **App Store Connect**
- اختار **Submit to TestFlight**: Yes
- **Skip waiting for processing**: No (عشان تتأكد إن التطبيق اتعالج صح)

---

### الخطوة 6: إنشاء App في App Store Connect

قبل ما تعمل build، لازم التطبيق يكون موجود في App Store Connect:

1. روح [App Store Connect](https://appstoreconnect.apple.com/)
2. اضغط **My Apps** → **+** → **New App**
3. املأ:
   - **Platforms**: iOS
   - **Name**: مؤسسة فرسان التعافي
   - **Primary Language**: Arabic
   - **Bundle ID**: اختار `com.mored.forsaneltaafy`
   - **SKU**: أي رقم فريد (مثلاً: FORSAN2026)
   - **User Access**: Full Access
4. اضغط **Create**

---

### الخطوة 7: إضافة App Store Information

في App Store Connect، املأ:

#### App Information:
- **Privacy Policy URL**: (لازم تحط رابط)
- **Category**: Medical أو Health & Fitness
- **Content Rights**: (اختار المناسب)

#### Pricing and Availability:
- **Price**: Free (أو حدد سعر)
- **Availability**: All countries أو اختار دول معينة

#### App Privacy:
- روح **App Privacy** → **Get Started**
- حدد البيانات اللي بتجمعها (Camera, Photos, Location, etc.)

---

### الخطوة 8: تشغيل Build في CodeMagic

1. روح CodeMagic Dashboard
2. اختار مشروعك
3. اضغط **Start new build**
4. اختار الـ branch: `main`
5. اختار الـ workflow الصحيح
6. اضغط **Start build**

---

## مشاكل شائعة وحلولها

### مشكلة: "No valid code signing certificates were found"
**الحل**: تأكد إنك رفعت certificate و provisioning profile صحيحين في CodeMagic

### مشكلة: "Provisioning profile doesn't match bundle identifier"
**الحل**: تأكد إن Bundle ID في:
- `ios/Runner.xcodeproj/project.pbxproj` ← `com.mored.forsaneltaafy`
- Provisioning profile في Apple Developer
- CodeMagic settings
كلهم نفس الشيء بالضبط

### مشكلة: "Team ID not found"
**الحل**: تأكد إن Team ID (`84M47YB8XR`) موجود في:
- `ios/fastlane/Appfile`
- `ios/ExportOptions.plist`

### مشكلة: "Failed to upload to App Store Connect"
**الحل**: تأكد من:
- App Store Connect API key موجود ومضبوط
- التطبيق موجود في App Store Connect
- Bundle ID و Version Number صحيحين

---

## ملفات مهمة للمراجعة

قبل كل build، تأكد من:

1. ✅ **Bundle ID** في `ios/Runner.xcodeproj/project.pbxproj` = `com.mored.forsaneltaafy`
2. ✅ **Team ID** في `ios/fastlane/Appfile` = `84M47YB8XR`
3. ✅ **Version & Build Number** في `pubspec.yaml` محدثين
4. ✅ **App Icons** كلها موجودة (76, 152, 167, etc.)
5. ✅ **Display Name** في `ios/Runner/Info.plist` = `مؤسسة فرسان التعافي`

---

## الخطوة التالية

بعد ما تعمل الخطوات فوق:

1. ارفع الكود الجديد (فيه ملف codemagic.yaml) على GitHub
2. شغل build جديد في CodeMagic
3. استنى لحد ما الـ build ينجح
4. التطبيق هيتحمل تلقائياً على TestFlight
5. روح App Store Connect عشان تكمل باقي المعلومات وتعمل submit للمراجعة

---

## ملاحظات مهمة

- ⚠️ **MinimumOSVersion**: حالياً 13.0، لكن Apple هتطلب 15.0 في ربيع 2027
- 📱 **Devices**: التطبيق مضبوط لـ iPhone و iPad فقط (مفيش Mac support)
- 🔒 **Privacy**: متنساش تملأ Privacy Policy في App Store Connect
- 📸 **Screenshots**: محتاج screenshots للـ iPhone و iPad (شوف ملف SCREENSHOTS_GUIDE.md)

---

## روابط مفيدة

- [Apple Developer Portal](https://developer.apple.com/account/)
- [App Store Connect](https://appstoreconnect.apple.com/)
- [CodeMagic Dashboard](https://codemagic.io/apps)
- [CodeMagic iOS Code Signing Guide](https://docs.codemagic.io/yaml-code-signing/signing-ios/)
- [Flutter iOS Deployment](https://docs.flutter.dev/deployment/ios)

---

## الدعم

لو واجهتك أي مشكلة، شيك على:
1. CodeMagic build logs (فيها تفاصيل الأخطاء)
2. Apple Developer Portal (تأكد من صلاحية الـ certificates)
3. App Store Connect (تأكد من معلومات التطبيق)
