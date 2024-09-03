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

  final deliveryTimes = {
    '50 мин.': const Color.fromARGB(88, 155, 39, 176),
    '60 мин.': const Color.fromARGB(88, 33, 149, 243),
    '90 мин.': const Color.fromARGB(88, 255, 152, 0),
    '120 мин.': const Color.fromARGB(88, 255, 0, 0),
    '150 мин.': const Color.fromARGB(88, 0, 255, 0),
  };

  final explainsPay = <String, String>{
    'Наличными':
        'Оплата наличными курьеру или в ресторане при получении заказа.',
    'Банковской картой онлайн':
        'При оформлении заказа на сайте (сервис доступен для карт: Visa, MasterCard)',
    'Банковской картой при получении':
        'Оплата заказа банковской картой при получении курьеру или в ресторане. Принимаются банковские карты MasterCard, Visa, МИР.',
  };

  final explainsCatch = <String, String>{
    'Доставка':
        'Заказывайте любым удобным способом, получайте заказ на указанный вами адрес.',
    'Забрать из ресторана':
        'Получайте заказ в выбранном ресторане в удобное для вас время (заказ может быть оформлен не менее чем за 30 мин. до получения).',
    'Доставка к определенному времени':
        'Выбирайте к “определенному времени”, получайте заказ минута в минуту. Заказ можно оформить не менее чем за 60 мин. до времени доставки',
  };

  void _showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,

      isScrollControlled: true, // Позволяет контролировать высоту BottomSheet
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize:
              0.85, // Задает размер BottomSheet относительно экрана

          maxChildSize: 0.85, // Может расширяться до полного экрана
          builder: (context, scrollController) {
            return Column(
              children: [
                Container(
                  height: 20,
                  child: Center(
                    child: Container(
                      width: 25,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Условия доставки'),
                          const Text(
                            'Укажите адрес доставки или выбирете на карте для определения времени ожидания заказа',
                          ),
                          const Text('Как оплатить заказ?'),
                          Column(
                            children: [
                              _ExplainBox(
                                title: explainsPay.entries.toList()[0].key,
                                explain: explainsPay.entries.toList()[0].value,
                              ),
                              _ExplainBox(
                                title: explainsPay.entries.toList()[1].key,
                                explain: explainsPay.entries.toList()[1].value,
                              ),
                              _ExplainBox(
                                title: explainsPay.entries.toList()[2].key,
                                explain: explainsPay.entries.toList()[2].value,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text('Как получить свой заказ?'),
                          Column(
                            children: [
                              _ExplainBox(
                                title: explainsCatch.entries.toList()[0].key,
                                explain:
                                    explainsCatch.entries.toList()[0].value,
                              ),
                              _ExplainBox(
                                title: explainsCatch.entries.toList()[1].key,
                                explain:
                                    explainsCatch.entries.toList()[1].value,
                              ),
                              _ExplainBox(
                                title: explainsCatch.entries.toList()[2].key,
                                explain:
                                    explainsCatch.entries.toList()[2].value,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

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
    const Point point = Point(latitude: 45.062598, longitude: 38.971360);
    const points50 = [
      Point(latitude: 45.063005, longitude: 38.971082),
      Point(latitude: 45.062337, longitude: 38.968827),
      Point(latitude: 45.056104, longitude: 38.971549),
      Point(latitude: 45.055938, longitude: 38.974585),
    ];
    const points60 = [
      Point(latitude: 45.063101, longitude: 38.972034),
      Point(latitude: 45.059281, longitude: 38.973687),
      Point(latitude: 45.060064, longitude: 38.977226),
      Point(latitude: 45.063687, longitude: 38.975430),
    ];
    final polygon50 = Polygon(LinearRing(points50), []);
    final polygon60 = Polygon(LinearRing(points60), []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Условия доставки'),
      ),
      bottomSheet: GestureDetector(
        onVerticalDragStart: (details) {
          _showSheet(context);
        },
        child: BottomSheet(
          onClosing: () {},
          enableDrag: false,
          showDragHandle: false,
          builder: (context) => Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: 25,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Условия доставки',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: deliveryTimes.length,
                    itemBuilder: (context, index) => _DeliveryTimeWidget(
                      time: deliveryTimes.keys.elementAt(index),
                      color: deliveryTimes.values.elementAt(index),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: YandexMap(
        onMapCreated: (mapWindow) {
          _mapWindow = mapWindow;
          final imageProvider = image.ImageProvider.fromImageProvider(
            const AssetImage('lib/core/assets/images/ic_pin.png'),
            id: 'pin',
          );

          _mapWindow!.map.mapObjects.addPlacemark()
            ..geometry = point
            ..setIcon(imageProvider)
            ..setIconStyle(const IconStyle(scale: 3));

          _mapWindow?.map.move(
            const CameraPosition(
              point,
              zoom: 15,
              azimuth: 0,
              tilt: 0,
            ),
          );

          _mapWindow!.map.mapObjects.addPolygon(polygon50)
            ..fillColor = const Color.fromARGB(88, 155, 39, 176)
            ..strokeColor = Colors.purpleAccent
            ..strokeWidth = 2;

          _mapWindow!.map.mapObjects.addPolygon(polygon60)
            ..fillColor = const Color.fromARGB(88, 33, 149, 243)
            ..strokeColor = Colors.blueAccent
            ..strokeWidth = 2;
        },
      ),
    );
  }
}

class _DeliveryTimeWidget extends StatelessWidget {
  const _DeliveryTimeWidget(
      {super.key, required this.time, required this.color});

  final String time;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
            ),
          ),
        ),
        Text(time),
      ],
    );
  }
}

class _ExplainBox extends StatelessWidget {
  const _ExplainBox({
    super.key,
    required this.title,
    required this.explain,
  });

  final String title;
  final String explain;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(0.0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              const CircleAvatar(
                backgroundColor: Color.fromARGB(181, 244, 67, 54),
                radius: 15,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(explain),
        ],
      ),
    );
  }
}
