# Habit Task Tracker - Android App

WebアプリをAndroidアプリに変換したプロジェクトです。Google Playストアで公開できます。

## プロジェクト概要

このプロジェクトは、https://habittask-mtivudju.manus.space で動作しているWebアプリをAndroidアプリとしてパッケージ化したものです。WebViewを使用して、既存のWebアプリをネイティブアプリのように動作させます。

## 主な機能

- WebViewベースのアプリケーション
- オフライン対応のローカルストレージ
- プルダウンでリフレッシュ
- ネイティブのナビゲーション（戻るボタン対応）
- プログレスバー表示
- レスポンシブデザイン対応

## プロジェクト構成

```
HabitTaskTracker/
├── app/
│   ├── src/
│   │   └── main/
│   │       ├── java/com/habittask/tracker/
│   │       │   └── MainActivity.java
│   │       ├── res/
│   │       │   ├── layout/
│   │       │   │   └── activity_main.xml
│   │       │   ├── values/
│   │       │   │   ├── strings.xml
│   │       │   │   ├── colors.xml
│   │       │   │   └── themes.xml
│   │       │   └── mipmap-*/
│   │       │       ├── ic_launcher.png
│   │       │       └── ic_launcher_round.png
│   │       └── AndroidManifest.xml
│   ├── build.gradle
│   └── proguard-rules.pro
├── gradle/
│   └── wrapper/
├── build.gradle
├── settings.gradle
├── gradle.properties
├── gradlew
├── gradlew.bat
├── app_icon.png
├── feature_graphic_1024x500.png
├── screenshot1.png
├── screenshot2.png
├── store_listing.md
├── BUILD_INSTRUCTIONS.md
├── GOOGLE_PLAY_PUBLISHING_GUIDE.md
└── README.md
```

## 技術仕様

- **言語**: Java
- **最小SDKバージョン**: Android 7.0 (API 24)
- **ターゲットSDKバージョン**: Android 14 (API 34)
- **ビルドツール**: Gradle 8.0
- **主要ライブラリ**:
  - AndroidX AppCompat
  - Material Design Components
  - SwipeRefreshLayout

## セットアップ方法

### 必要な環境
- Android Studio (最新版)
- JDK 11以上
- Android SDK

### インストール手順

1. **プロジェクトを開く**
   ```bash
   # Android Studioで「Open an Existing Project」を選択
   # HabitTaskTrackerフォルダを選択
   ```

2. **Gradleの同期**
   - Android Studioが自動的にGradleの同期を開始します
   - 初回は依存関係のダウンロードに時間がかかります

3. **エミュレータまたは実機で実行**
   - 「Run」ボタン（緑の三角）をクリック
   - エミュレータまたは接続された実機を選択

## ビルド方法

詳細は`BUILD_INSTRUCTIONS.md`を参照してください。

### デバッグAPKのビルド
```bash
./gradlew assembleDebug
```
出力: `app/build/outputs/apk/debug/app-debug.apk`

### リリースAABのビルド（Google Play用）
```bash
./gradlew bundleRelease
```
出力: `app/build/outputs/bundle/release/app-release.aab`

## Google Playへの公開

詳細な手順は`GOOGLE_PLAY_PUBLISHING_GUIDE.md`を参照してください。

### 必要なファイル
- ✅ `app-release.aab`（署名済み）
- ✅ `app_icon.png`（512x512）
- ✅ `feature_graphic_1024x500.png`（1024x500）
- ✅ `screenshot1.png`, `screenshot2.png`
- ✅ ストア掲載情報（`store_listing.md`）

### 公開の流れ
1. Google Play Developer アカウント作成
2. 新しいアプリを作成
3. ストア掲載情報を入力
4. AABファイルをアップロード
5. 審査に提出
6. 承認後、公開

## カスタマイズ

### アプリ名の変更
`app/src/main/res/values/strings.xml`を編集：
```xml
<string name="app_name">新しいアプリ名</string>
```

### URLの変更
`app/src/main/java/com/habittask/tracker/MainActivity.java`を編集：
```java
private static final String APP_URL = "https://your-new-url.com";
```

### アプリIDの変更
`app/build.gradle`を編集：
```gradle
defaultConfig {
    applicationId "com.yourcompany.yourapp"
    ...
}
```

### アイコンの変更
各解像度のアイコンファイルを置き換え：
- `app/src/main/res/mipmap-mdpi/ic_launcher.png` (48x48)
- `app/src/main/res/mipmap-hdpi/ic_launcher.png` (72x72)
- `app/src/main/res/mipmap-xhdpi/ic_launcher.png` (96x96)
- `app/src/main/res/mipmap-xxhdpi/ic_launcher.png` (144x144)
- `app/src/main/res/mipmap-xxxhdpi/ic_launcher.png` (192x192)

## トラブルシューティング

### ビルドエラー
- Gradleの同期を再実行: `File` → `Sync Project with Gradle Files`
- キャッシュをクリア: `File` → `Invalidate Caches / Restart`

### WebViewが表示されない
- インターネット権限が`AndroidManifest.xml`に設定されているか確認
- URLが正しいか確認
- デバイスがインターネットに接続されているか確認

### アプリが署名できない
- キーストアファイルのパスが正しいか確認
- パスワードが正しいか確認
- `BUILD_INSTRUCTIONS.md`の署名セクションを参照

## セキュリティ

- WebViewは指定されたドメインのみをロード
- JavaScriptは有効（アプリの動作に必要）
- ファイルアクセスは無効
- Mixed Content（HTTP/HTTPS混在）は許可しない

## ライセンス

このプロジェクトはMIT Licenseの下で公開されています。

## サポート

問題が発生した場合は、以下のドキュメントを参照してください：
- `BUILD_INSTRUCTIONS.md` - ビルド方法
- `GOOGLE_PLAY_PUBLISHING_GUIDE.md` - 公開方法
- `store_listing.md` - ストア掲載情報

## 作成者

Manus AI Platform

## バージョン履歴

- **1.0.0** (2024-12-11)
  - 初回リリース
  - WebViewベースのアプリケーション
  - 習慣トラッキング機能
  - タスク管理機能
