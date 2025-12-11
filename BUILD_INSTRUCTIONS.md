# Habit Task Tracker - ビルド手順書

## 必要な環境

### Android Studioを使用する場合
1. **Android Studio** (最新版推奨)
   - ダウンロード: https://developer.android.com/studio
2. **JDK 11以上**
   - Android Studioに含まれています

### コマンドラインを使用する場合
1. **JDK 11以上**
   - ダウンロード: https://adoptium.net/
2. **Android SDK**
   - Android Studioと一緒にインストールされます

## ビルド方法

### 方法1: Android Studioを使用（推奨）

1. **プロジェクトを開く**
   - Android Studioを起動
   - "Open an Existing Project"を選択
   - `HabitTaskTracker`フォルダを選択

2. **Gradleの同期**
   - プロジェクトが開いたら、自動的にGradleの同期が始まります
   - 完了するまで待ちます（初回は時間がかかります）

3. **APKをビルド**
   - メニューから `Build` → `Build Bundle(s) / APK(s)` → `Build APK(s)`を選択
   - ビルドが完了すると、`app/build/outputs/apk/debug/app-debug.apk`が生成されます

4. **AAB（Android App Bundle）をビルド（Google Play用）**
   - メニューから `Build` → `Build Bundle(s) / APK(s)` → `Build Bundle(s)`を選択
   - `app/build/outputs/bundle/release/app-release.aab`が生成されます

### 方法2: コマンドラインを使用

1. **プロジェクトディレクトリに移動**
   ```bash
   cd HabitTaskTracker
   ```

2. **デバッグAPKをビルド**
   ```bash
   ./gradlew assembleDebug
   ```
   生成場所: `app/build/outputs/apk/debug/app-debug.apk`

3. **リリースAPKをビルド（署名が必要）**
   ```bash
   ./gradlew assembleRelease
   ```

4. **AABをビルド（Google Play用）**
   ```bash
   ./gradlew bundleRelease
   ```
   生成場所: `app/build/outputs/bundle/release/app-release.aab`

## 署名の設定（Google Play公開用）

Google Playにアップロードするには、アプリに署名する必要があります。

### 1. キーストアの作成

```bash
keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

以下の情報を入力します：
- キーストアのパスワード
- 名前、組織、都市、国などの情報
- キーのパスワード

### 2. 署名設定をGradleに追加

`app/build.gradle`に以下を追加：

```gradle
android {
    ...
    signingConfigs {
        release {
            storeFile file("../my-release-key.keystore")
            storePassword "your-keystore-password"
            keyAlias "my-key-alias"
            keyPassword "your-key-password"
        }
    }
    
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}
```

**重要**: パスワードをコードに直接書かないでください。本番環境では環境変数を使用してください。

### 3. 署名付きAABをビルド

```bash
./gradlew bundleRelease
```

## トラブルシューティング

### エラー: "SDK location not found"
- `local.properties`ファイルを作成し、以下を追加：
  ```
  sdk.dir=/path/to/Android/Sdk
  ```
  （Android SDKのパスは環境によって異なります）

### エラー: "Gradle sync failed"
- インターネット接続を確認
- Android Studioを再起動
- `File` → `Invalidate Caches / Restart`を実行

### ビルドが遅い
- `gradle.properties`に以下を追加：
  ```
  org.gradle.jvmargs=-Xmx4096m
  org.gradle.parallel=true
  org.gradle.caching=true
  ```

## 次のステップ

ビルドが完了したら、以下のファイルをGoogle Play Consoleにアップロードします：
- `app/build/outputs/bundle/release/app-release.aab`（署名済み）

その他の必要なアセット：
- アプリアイコン（各解像度）
- フィーチャーグラフィック（1024x500）
- スクリーンショット（最低2枚）
- ストア掲載情報（`store_listing.md`を参照）
