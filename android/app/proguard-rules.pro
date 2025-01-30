# حماية فئات Gson من الحذف
-keep class com.google.gson.** { *; }
-keep class com.dexterous.flutterlocalnotifications.** { *; }

# حماية معلومات الأنواع (Type Parameters)
-keepattributes Signature, InnerClasses, EnclosingMethod
-keepattributes *Annotation*