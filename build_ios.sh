#!/bin/bash

# Script to build and prepare iOS app for App Store submission
# Bundle ID: com.mored.forsaneltaafy

echo "🚀 Starting iOS build process for Forsan Eltaafyوظبط..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Clean
echo -e "${YELLOW}📦 Cleaning project...${NC}"
flutter clean
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Flutter clean failed${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Clean completed${NC}"

# Step 2: Get dependencies
echo -e "${YELLOW}📥 Getting Flutter dependencies...${NC}"
flutter pub get
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Flutter pub get failed${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Dependencies downloaded${NC}"

# Step 3: Install pods
echo -e "${YELLOW}🍎 Installing CocoaPods...${NC}"
cd ios
pod install
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Pod install failed${NC}"
    echo -e "${YELLOW}Trying to update CocoaPods...${NC}"
    pod repo update
    pod install
    if [ $? -ne 0 ]; then
        echo -e "${RED}❌ Pod install still failed. Please check your CocoaPods installation.${NC}"
        exit 1
    fi
fi
cd ..
echo -e "${GREEN}✅ Pods installed${NC}"

# Step 4: Build iOS release
echo -e "${YELLOW}🔨 Building iOS release...${NC}"
flutter build ios --release --no-codesign
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Build failed${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Build completed${NC}"

echo ""
echo -e "${GREEN}✨ Build process completed successfully!${NC}"
echo ""
echo "Next steps:"
echo "1. Open Xcode workspace: open ios/Runner.xcworkspace"
echo "2. Select 'Any iOS Device (arm64)' from device selector"
echo "3. Go to Product > Archive"
echo "4. After archiving, select 'Distribute App'"
echo "5. Choose 'App Store Connect'"
echo "6. Follow the wizard to upload"
echo ""
echo "Bundle ID: com.mored.forsaneltaafy"
echo "Version: 1.0.0 (11)"
echo ""
echo "📖 For detailed instructions, see: APP_STORE_DEPLOYMENT.md"
