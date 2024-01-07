import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/application/home/user_home/bloc/user_home_bloc.dart';
import 'package:yolda_app/domain/common/extensions/list_extension.dart';
import 'package:yolda_app/domain/common/extensions/point_extension.dart';
import 'package:yolda_app/infrastructure/firebase/firebase_service.dart';
import 'package:yolda_app/infrastructure/models/home/radars/speed_radar.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final Completer<YandexMapController> _controller = Completer();
  final GlobalKey mapKey = GlobalKey();
  late final UserHomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = UserHomeBloc();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Future<void> onMapCreated(YandexMapController controller) async {
    _controller.complete(controller);
    await controller.toggleTrafficLayer(visible: true);
    // ignore: use_build_context_synchronously
    final mediaQuery = MediaQuery.of(context);
    final height =
        mapKey.currentContext!.size!.height * mediaQuery.devicePixelRatio;
    final width =
        mapKey.currentContext!.size!.width * mediaQuery.devicePixelRatio;

    await controller.toggleUserLayer(
      visible: true,
      autoZoomEnabled: true,
      anchor: UserLocationAnchor(
        course: Offset(0.5 * width, 0.5 * height),
        normal: Offset(0.5 * width, 0.5 * height),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseService.radarPath.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                    "Serverda xatolik mavjud. Keyinroq qayta urinib ko'ring!"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final data = snapshot.data!.docs.map((e) => e.data()).toList();
            _bloc.add(UserHomeEvent.getAllMarkers(radars: data));
            return YandexMap(
              key: mapKey,
              onMapCreated: onMapCreated,
              mapObjects: data.toMarkers(),
              onMapTap: (argument) {
                final radar = SpeedRadar(
                  name: "test",
                  location: argument.toLocation(),
                  speedLimit: 70,
                );
                _bloc.add(
                  UserHomeEvent.createMarker(radar: radar),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
