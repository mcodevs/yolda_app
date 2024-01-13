// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';
// import 'package:yolda_app/application/home/user_home/bloc/user_home_bloc.dart';
// import 'package:yolda_app/domain/common/extensions/list_extension.dart';
// import 'package:yolda_app/infrastructure/firebase/firebase_service.dart';
// import 'package:yolda_app/infrastructure/services/log_service.dart';

// class HomeFirebaseWidget extends StatefulWidget {
//   const HomeFirebaseWidget({
//     super.key,
//     required this.onLoading,
//     required this.onError,
//     required this.onSuccess,
//   });

//   final Widget Function(BuildContext context) onLoading;
//   final Widget Function(BuildContext context, String errorMessage) onError;
//   final Widget Function(BuildContext context, List<PlacemarkMapObject> radars)
//       onSuccess;

//   @override
//   State<HomeFirebaseWidget> createState() => _HomeFirebaseWidgetState();
// }

// class _HomeFirebaseWidgetState extends State<HomeFirebaseWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseService.radarPath.snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return widget.onError(context, snapshot.error.toString());
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return widget.onLoading(context);
//         }
//         LogService.w("message");
//         final radars = snapshot.data!.docs.map((e) => e.data()).toList();
//         WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//           context
//               .read<UserHomeBloc>()
//               .add(UserHomeEvent.getAllMarkers(radars: radars));
//         });
//         return widget.onSuccess(
//           context,
//           radars.toMarkers(),
//         );
//       },
//     );
//   }
// }
