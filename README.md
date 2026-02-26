# 📦 mcp-react-native-sdk

React Native wrapper for **Salesforce Marketing Cloud Personalization (MCP) SDK** supporting **Android (Kotlin)** and **iOS (Swift)** platforms.

---

## 🚀 Installation

### ⚙️ Android Setup

In your `package.json`:

#### For Local Development

```json
"dependencies": {
  "mcp-react-native-sdk": "file:Path/to/your-tar-file"
}
```

Install using:

```sh
# Yarn
yarn install

# or npm
npm install
```

#### For Published Plugin

```sh
npm i mcp-react-native-sdk
# OR
npm install mcp-react-native-sdk
```

🔗 [Salesforce Android SDK Integration Guide](https://developer.salesforce.com/docs/marketing/personalization/references/personalization-android-sdk/integration.html)

---

### 🍎 iOS Setup

Navigate to the `ios` folder and run:

```sh
cd ios
pod install
```

Then:

1. Add your app's **Bundle Identifier** (Xcode ➔ Target ➔ Signing & Capabilities) to the Salesforce Personalization Dashboard.
2. Open the `.xcworkspace` file.
3. In Xcode ➔ Target ➔ **General ➔ Frameworks, Libraries, and Embedded Content**, add `Evergage.xcframework`.

🔗 [Salesforce iOS SDK Integration Guide](https://developer.salesforce.com/docs/marketing/personalization/references/personalization-ios-sdk/integration.html)

---

## 💻 Usage

Import the SDK:

```ts
import { callEvergageMethod } from 'mcp-react-native-sdk';
```

### 1. Check if Context is Active

```ts
await callEvergageMethod('isActive', []);
```

### 2. Add to Cart

```ts
const lineItem = {
  item: {
    id: 'product-ABC',
    name: 'Test Product',
    description: 'This is a test product',
    url: 'https://example.com/product-ABC',
    imageUrl: 'https://example.com/product-ABC.jpg',
    price: 10,
  },
  quantity: 2,
};

const result = await callEvergageMethod('addToCart', [lineItem]);
```

### 3. Track Impression

```ts
const campaignData = {
  campaignId: 'ox2Q',
  campaignName: 'Test Mobile Data Campaign',
  experienceId: 'MFsz',
  experienceName: 'Experience',
  messageId: 'lJoN',
  target: 'testDataCamp2',
  isControlGroup: false,
  data: { url: 'https://example.com' },
};

callEvergageMethod('trackImpression', [campaignData]);
```

### 4. Track Dismissal

```ts
const campaignData = {
  campaignId: 'your_campaign_id',
  campaignName: 'Test Mobile Data Campaign',
  experienceId: 'your_experience_id',
  experienceName: 'Experience 1',
  messageId: 'your_message_id',
  target: 'your_target_name',
  isControlGroup: false,
  data: { url: 'https://example.com' },
};

callEvergageMethod('trackDismissal', [campaignData]);
```

---

## 🏁 Running the Project

### Android

```sh
npm run android
# OR
npx react-native run-android
```

### iOS

```sh
npx pod-install
npx react-native run-ios
```

---

## 🤝 Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to this library.

---

## 📄 License

MIT
