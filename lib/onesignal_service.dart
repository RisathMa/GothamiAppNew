import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  static final OneSignalService _instance = OneSignalService._internal();
  factory OneSignalService() => _instance;
  OneSignalService._internal();

  // TODO: Replace with your OneSignal App ID
  static const String oneSignalAppId = '36467721-7730-4f0e-9f37-c19ce58b7835';

  /// Initialize OneSignal
  Future<void> initialize() async {
    // Set log level for debugging (remove in production)
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    // Initialize OneSignal with your App ID
    OneSignal.initialize(oneSignalAppId);

    // Request permission to send notifications (iOS)
    await OneSignal.Notifications.requestPermission(true);

    // Setup notification handlers
    _setupNotificationHandlers();

    print('✅ OneSignal Initialized Successfully');
  }

  /// Setup notification event handlers
  void _setupNotificationHandlers() {
    // Notification opened handler
    OneSignal.Notifications.addClickListener((event) {
      print('🔔 Notification clicked!');
      print('Notification data: ${event.notification.additionalData}');

      // Handle notification tap
      _handleNotificationOpened(event);
    });

    // Notification received handler (when app is in foreground)
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      print('📱 Notification received in foreground');

      // Display the notification even when app is open
      event.notification.display();
    });

    // Permission change handler
    OneSignal.Notifications.addPermissionObserver((state) {
      print('🔐 Notification permission state changed: $state');
    });
  }

  /// Handle when user taps on a notification
  void _handleNotificationOpened(OSNotificationClickEvent event) {
    final data = event.notification.additionalData;

    if (data != null) {
      // Handle different notification types based on custom data
      if (data.containsKey('type')) {
        final type = data['type'];

        switch (type) {
          case 'event':
          // Navigate to Events tab
            print('Navigate to Events tab');
            break;
          case 'gallery':
          // Navigate to Gallery tab
            print('Navigate to Gallery tab');
            break;
          case 'announcement':
          // Show announcement dialog
            print('Show announcement');
            break;
          default:
          // Default action - just open the app
            print('Open app home screen');
        }
      }
    }
  }

  /// Check if user has granted notification permission
  Future<bool> hasPermission() async {
    final permission = await OneSignal.Notifications.permission;
    return permission;
  }

  /// Request notification permission
  Future<bool> requestPermission() async {
    return await OneSignal.Notifications.requestPermission(true);
  }

  /// Get the OneSignal Player ID (unique user identifier)
  Future<String?> getPlayerId() async {
    final userId = OneSignal.User.pushSubscription.id;
    return userId;
  }

  /// Set user tags for targeted notifications
  Future<void> setUserTags(Map<String, String> tags) async {
    OneSignal.User.addTags(tags);
    print('✅ User tags set: $tags');
  }

  /// Remove user tags
  Future<void> removeUserTags(List<String> keys) async {
    OneSignal.User.removeTags(keys);
    print('✅ User tags removed: $keys');
  }

  /// Send a tag (for categorization)
  /// Example: setTag('grade', '5') for grade 5 students
  Future<void> setTag(String key, String value) async {
    OneSignal.User.addTags({key: value});
    print('✅ Tag set: $key = $value');
  }

  /// Enable/Disable notifications
  Future<void> setNotificationsEnabled(bool enabled) async {
    if (enabled) {
      await OneSignal.Notifications.requestPermission(true);
    }
    print('✅ Notifications ${enabled ? 'enabled' : 'disabled'}');
  }

  /// Logout user (clear user data)
  Future<void> logout() async {
    OneSignal.logout();
    print('✅ OneSignal user logged out');
  }

  /// Set external user ID (for linking with your backend)
  Future<void> setExternalUserId(String externalId) async {
    OneSignal.login(externalId);
    print('✅ External user ID set: $externalId');
  }

  /// Remove external user ID
  Future<void> removeExternalUserId() async {
    OneSignal.logout();
    print('✅ External user ID removed');
  }
}