# Add project specific ProGuard rules here.
-keepattributes JavascriptInterface
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
-keep public class * extends android.webkit.WebChromeClient
-dontwarn android.webkit.**
