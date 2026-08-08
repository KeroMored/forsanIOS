#!/bin/bash

# Script to help export certificates for CodeMagic
# مساعد لتصدير الـ certificates لـ CodeMagic

echo "==================================="
echo "تصدير Certificates لـ CodeMagic"
echo "==================================="
echo ""

# Check if certificate file exists
if [ ! -f "distribution_certificate.p12" ]; then
    echo "⚠️  ملف distribution_certificate.p12 مش موجود"
    echo ""
    echo "خطوات تصدير الـ certificate:"
    echo "1. افتح Keychain Access"
    echo "2. اختار My Certificates من القائمة"
    echo "3. دور على 'Apple Distribution'"
    echo "4. كليك يمين → Export"
    echo "5. احفظه باسم distribution_certificate.p12 في نفس المجلد"
    echo ""
    exit 1
fi

echo "✅ وجدت ملف distribution_certificate.p12"
echo ""

# Encode certificate to base64
echo "🔄 تشفير الـ certificate بـ base64..."
CERT_BASE64=$(base64 -i distribution_certificate.p12)
echo "$CERT_BASE64" > certificate_base64.txt
echo "✅ تم الحفظ في: certificate_base64.txt"
echo ""

# Check for provisioning profile
PROFILE_FILE=$(ls *.mobileprovision 2>/dev/null | head -1)

if [ -z "$PROFILE_FILE" ]; then
    echo "⚠️  ملف .mobileprovision مش موجود"
    echo ""
    echo "خطوات تصدير الـ provisioning profile:"
    echo "1. روح Apple Developer Portal"
    echo "2. Certificates, Identifiers & Profiles → Profiles"
    echo "3. حمّل الـ App Store profile"
    echo "4. احفظه في نفس المجلد"
    echo ""
else
    echo "✅ وجدت ملف: $PROFILE_FILE"
    echo ""
    echo "🔄 تشفير الـ provisioning profile بـ base64..."
    PROFILE_BASE64=$(base64 -i "$PROFILE_FILE")
    echo "$PROFILE_BASE64" > profile_base64.txt
    echo "✅ تم الحفظ في: profile_base64.txt"
    echo ""
fi

echo "==================================="
echo "✅ تم الانتهاء!"
echo "==================================="
echo ""
echo "الخطوات التالية:"
echo "1. روح CodeMagic → App settings → Environment variables"
echo "2. أضف المتغيرات التالية:"
echo ""
echo "   Variable name: CM_CERTIFICATE"
echo "   Value: [انسخ محتوى ملف certificate_base64.txt]"
echo "   Group: code_signing"
echo "   Secure: Yes"
echo ""
echo "   Variable name: CM_CERTIFICATE_PASSWORD"
echo "   Value: [كلمة سر ملف .p12]"
echo "   Group: code_signing"
echo "   Secure: Yes"
echo ""

if [ -f "profile_base64.txt" ]; then
    echo "   Variable name: CM_PROVISIONING_PROFILE"
    echo "   Value: [انسخ محتوى ملف profile_base64.txt]"
    echo "   Group: code_signing"
    echo "   Secure: Yes"
    echo ""
fi

echo "3. احفظ التغييرات في CodeMagic"
echo "4. شغل build جديد"
echo ""
