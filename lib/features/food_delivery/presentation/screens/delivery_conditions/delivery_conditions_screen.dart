import 'package:flutter/material.dart';
import 'package:yandex_maps_mapkit/image.dart' as image;
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/mapkit_factory.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';

class DeliveryConditionsScreen extends StatefulWidget {
  const DeliveryConditionsScreen({super.key});

  @override
  State<DeliveryConditionsScreen> createState() =>
      _DeliveryConditionsScreenState();
}

class _DeliveryConditionsScreenState extends State<DeliveryConditionsScreen> {
  MapWindow? _mapWindow;

  @override
  void initState() {
    mapkit.onStart();
    super.initState();
  }

  @override
  void dispose() {
    mapkit.onStop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Условия доставки'),
      ),
      body: YandexMap(
        onMapCreated: (mapWindow) {
          _mapWindow = mapWindow;
          final imageProvider = image.ImageProvider.fromImageProvider(
            const AssetImage('lib/core/assets/images/ic_pin.png'),
          );
          _mapWindow!.map.mapObjects.addPlacemark()
            ..geometry = const Point(latitude: 45.062598, longitude: 38.971360)
            ..setIcon(imageProvider);
          _mapWindow?.map.move(
            const CameraPosition(
              Point(
                latitude: 45.062598,
                longitude: 38.971360,
              ),
              zoom: 17,
              azimuth: 0,
              tilt: 0,
            ),
          );
        },
      ),
    );
  }
}
