import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class Analytics {
  Analytics._() {
    _analytics = FirebaseAnalytics.instance;
    _observer = FirebaseAnalyticsObserver(analytics: _analytics);
  }

  late final FirebaseAnalytics _analytics;
  late final FirebaseAnalyticsObserver _observer;

  FirebaseAnalyticsObserver get observer => _observer;

  static Analytics get instance => Analytics._();

  Future<void> logSelectContentEvent({
    required String name,
  }) async {
    if (kDebugMode) return;
    await _analytics.logEvent(
      name: "select_content",
      parameters: {
        "content_type": name,
      },
    );
  }

  Future<void> logGenerateLeadEvent({
    required String name,
    required String email,
    required String title,
    required String message,
  }) async {
    if (kDebugMode) return;
    await _analytics.logEvent(
      name: "generate_lead",
      parameters: {
        "name": name,
        "email": email,
        "title": title,
        "message": message,
      },
    );
  }
}
