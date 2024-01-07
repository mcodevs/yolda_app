import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class RadarAdminHomePage extends StatelessWidget {
  const RadarAdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YandexMap(),
    );
  }
}