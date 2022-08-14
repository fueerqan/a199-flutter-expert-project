import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsHelper {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static Future<void> sendOpenPageAnalytics(String pageName) async {
    await analytics.logEvent(
      name: 'open_screen',
      parameters: <String, dynamic>{
        'page_name': pageName,
        'datetime': DateTime.now().toIso8601String(),
      },
    );

    await analytics.setCurrentScreen(screenName: pageName);
  }

  static Future<void> sendEvent(
    String eventName,
    String eventLabel,
    String eventCategory,
    String eventAction,
  ) async {
    await analytics.logEvent(
      name: eventName,
      parameters: <String, dynamic>{
        'event_label': eventLabel,
        'event_category': eventCategory,
        'event_action': eventAction,
      },
    );
  }
}
