# Gothami Junior School - Flutter Application

A beautiful, responsive mobile application for Gothami Junior School built with Flutter, featuring real-time updates via Supabase and image download capabilities.

## 🌟 Features

- **Home Screen**: Hero section with school information, statistics, and principal's message
- **Gallery**: Photo gallery with category filters and **image download** functionality
- **Events**: Upcoming school events calendar with category filtering
- **Contact**: Complete contact information including address, phone numbers, and email
- **Real-time Updates**: Gallery and Events update automatically via Supabase
- **Pull to Refresh**: Manually refresh content on Gallery and Events screens
- **Image Download**: Users can download any image from the gallery to their device

## 📁 Project Structure

```
lib/
├── main.dart                      # App entry point with Supabase initialization
├── models.dart                    # Data models (GalleryImage, SchoolEvent, enums)
├── constants.dart                 # Fallback constants (optional)
├── supabase_service.dart          # Supabase API service
├── image_download_service.dart    # Image download functionality
├── screens/
│   ├── home_screen.dart          # Home page with hero section
│   ├── gallery_screen.dart       # Photo gallery with download feature
│   ├── events_screen.dart        # Events calendar with real-time updates
│   └── contact_screen.dart       # Contact information
└── widgets/
    └── filter_buttons.dart       # Reusable filter button widget
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode (for mobile development)
- Supabase account (free tier available)

### Step 1: Create Flutter Project

```bash
flutter create gothami_junior_school
cd gothami_junior_school
```

### Step 2: Setup Files

1. Replace `pubspec.yaml` with the provided version
2. Copy all `.dart` files to appropriate folders:
   - Core files to `lib/`
   - Screen files to `lib/screens/`
   - Widget files to `lib/widgets/`

### Step 3: Install Dependencies

```bash
flutter pub get
```

### Step 4: Setup Supabase

#### 4.1 Create Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a free account
2. Create a new project
3. Note your **Project URL** and **Anon Key** from Settings > API

#### 4.2 Create Database Tables

Run these SQL queries in Supabase SQL Editor:

```sql
-- Create gallery_images table
CREATE TABLE gallery_images (
  id SERIAL PRIMARY KEY,
  image_url TEXT NOT NULL,
  alt_text TEXT,
  category TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Create school_events table
CREATE TABLE school_events (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  date TEXT NOT NULL,
  time TEXT NOT NULL,
  category TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Enable Row Level Security
ALTER TABLE gallery_images ENABLE ROW LEVEL SECURITY;
ALTER TABLE school_events ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access
CREATE POLICY "Allow public read access" ON gallery_images
  FOR SELECT USING (true);

CREATE POLICY "Allow public read access" ON school_events
  FOR SELECT USING (true);
```

#### 4.3 Insert Sample Data

```sql
-- Insert sample gallery images
INSERT INTO gallery_images (image_url, alt_text, category) VALUES
('https://picsum.photos/seed/school1/400/300', 'School Building', 'infrastructure'),
('https://picsum.photos/seed/award/400/300', 'Awards Ceremony', 'academic'),
('https://picsum.photos/seed/sportsday/400/300', 'Sports Day', 'sports'),
('https://picsum.photos/seed/dance/400/300', 'Cultural Dance', 'cultural');

-- Insert sample events
INSERT INTO school_events (title, date, time, category, description) VALUES
('Annual Sports Meet', 'July 20, 2024', '9:00 AM - 4:00 PM', 'sports', 'The most anticipated sporting event of the year.'),
('Parent-Teacher Meeting', 'July 25, 2024', '10:00 AM - 1:00 PM', 'meetings', 'An opportunity for parents to discuss their child''s progress.'),
('Science Fair', 'August 5, 2024', 'All Day', 'academic', 'Students showcase their innovative science projects.');
```

#### 4.4 Configure App

Open `lib/main.dart` and replace the Supabase credentials:

```dart
const String supabaseUrl = 'YOUR_SUPABASE_PROJECT_URL';
const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
```

### Step 5: Setup Android Permissions

Edit `android/app/src/main/AndroidManifest.xml`:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- Add these permissions -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"
        android:maxSdkVersion="32" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"
        android:maxSdkVersion="32" />
    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />
    
    <application
        android:label="Gothami Junior School"
        ...>
```

### Step 6: Setup iOS Permissions

Edit `ios/Runner/Info.plist`:

```xml
<dict>
    <!-- Add these keys -->
    <key>NSPhotoLibraryAddUsageDescription</key>
    <string>We need access to save images to your photo library</string>
    <key>NSPhotoLibraryUsageDescription</key>
    <string>We need access to your photo library</string>
    ...
</dict>
```

### Step 7: Run the App

```bash
flutter run
```

## 📱 How to Change App Icon

### Method 1: Using flutter_launcher_icons (Recommended)

1. **Prepare your icon image:**
   - Create a 1024x1024 PNG image
   - Save it as `assets/icon/app_icon.png`
   - Create foreground image (optional): `assets/icon/app_icon_foreground.png`

2. **Create assets folder:**
   ```bash
   mkdir -p assets/icon
   ```

3. **The `pubspec.yaml` already includes the configuration:**
   ```yaml
   flutter_launcher_icons:
     android: true
     ios: true
     image_path: "assets/icon/app_icon.png"
     adaptive_icon_background: "#A52A2A"
     adaptive_icon_foreground: "assets/icon/app_icon_foreground.png"
   ```

4. **Generate icons:**
   ```bash
   flutter pub get
   flutter pub run flutter_launcher_icons
   ```

### Method 2: Manual Setup

#### Android:
1. Generate icon files at different sizes:
   - mipmap-mdpi: 48x48
   - mipmap-hdpi: 72x72
   - mipmap-xhdpi: 96x96
   - mipmap-xxhdpi: 144x144
   - mipmap-xxxhdpi: 192x192

2. Replace files in:
   ```
   android/app/src/main/res/mipmap-*/ic_launcher.png
   ```

#### iOS:
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select `Runner` > `Runner` > `Assets.xcassets` > `AppIcon`
3. Drag and drop icon images for each size

## 🏷️ How to Change App Name

### Android

Edit `android/app/src/main/AndroidManifest.xml`:

```xml
<application
    android:label="Your New App Name"
    ...>
```

### iOS

**Method 1: Info.plist**

Edit `ios/Runner/Info.plist`:

```xml
<key>CFBundleDisplayName</key>
<string>Your New App Name</string>
<key>CFBundleName</key>
<string>Your New App Name</string>
```

**Method 2: Xcode**

1. Open `ios/Runner.xcworkspace` in Xcode
2. Select `Runner` project
3. Go to `General` tab
4. Change `Display Name` field

### Update pubspec.yaml (optional)

```yaml
name: your_new_app_name
description: Your app description
```

**Note:** Changing the package name in `pubspec.yaml` requires more steps. It's better to keep the internal name and only change the display name.

## 📦 Building for Production

### Android APK

```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# Split APK by architecture (smaller size)
flutter build apk --split-per-abi --release
```

APK location: `build/app/outputs/flutter-apk/`

### Android App Bundle (for Play Store)

```bash
flutter build appbundle --release
```

Bundle location: `build/app/outputs/bundle/release/`

### iOS

```bash
# Build for release
flutter build ios --release

# Or open in Xcode
open ios/Runner.xcworkspace
```

Then use Xcode to archive and upload to App Store.

## 🎨 Customization

### Update School Information

Edit constants in `lib/screens/home_screen.dart` and `lib/screens/contact_screen.dart`

### Change Colors

Modify `lib/main.dart`:

```dart
theme: ThemeData(
  primarySwatch: Colors.blue,  // Change primary color
  scaffoldBackgroundColor: Colors.grey[50],
),
```

### Update Logo

Edit the logo in `lib/main.dart` in the AppBar section

## 🔄 Managing Content via Supabase

### Adding Images

1. Go to Supabase Dashboard
2. Navigate to Table Editor > `gallery_images`
3. Click "Insert row"
4. Fill in:
   - `image_url`: Full URL to image
   - `alt_text`: Description
   - `category`: infrastructure/academic/sports/cultural

### Adding Events

1. Navigate to `school_events` table
2. Click "Insert row"
3. Fill in event details
4. Category options: academic/sports/cultural/meetings/general

### Real-time Updates

Changes in Supabase automatically reflect in the app via real-time subscriptions!

## 🛠️ Troubleshooting

### Image Download Not Working

1. Check permissions in AndroidManifest.xml and Info.plist
2. Test on physical device (emulators may have issues)
3. Grant storage permissions when prompted

### Supabase Connection Issues

1. Verify URL and Anon Key are correct
2. Check internet connection
3. Ensure Row Level Security policies are set correctly

### Build Errors

```bash
# Clean build
flutter clean
flutter pub get
flutter run
```

## 📄 License

This project is created for Gothami Junior School.

## 💡 Support

For issues or questions:
1. Check Supabase Dashboard for API logs
2. Review Flutter debug console for errors
3. Contact the development team

## 🎯 Future Enhancements

- Push notifications for new events
- User authentication for admin panel
- In-app event registration
- Multi-language support
- Dark mode theme#   G o t h a m i a p p - t e s t  
 