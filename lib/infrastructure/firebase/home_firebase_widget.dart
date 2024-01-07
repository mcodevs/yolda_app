import 'package:flutter/material.dart';
import 'package:yolda_app/infrastructure/firebase/firebase_service.dart';
import 'package:yolda_app/infrastructure/models/home/core/base/base_model.dart';

class HomeFirebaseWidget extends StatelessWidget {
  const HomeFirebaseWidget({
    super.key,
    required this.onLoading,
    required this.onError,
    required this.onSuccess,
  });
  
  final Widget Function(BuildContext context) onLoading;
  final Widget Function(BuildContext context, String errorMessage) onError;
  final Widget Function(BuildContext context, List<BaseModel> radars) onSuccess;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseService.radarPath.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return onError(context, snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return onLoading(context);
        }
        final radars = snapshot.data!.docs.map((e) => e.data()).toList();
        return onSuccess(
          context,
          radars,
        );
      },
    );
  }
}
