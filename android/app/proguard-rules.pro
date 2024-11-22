
# Keep certain classes from being removed
-keep class com.example.zomoto_task.** { *; }

# Keep all public methods
-keepclassmembers class * {
    public *;
}
