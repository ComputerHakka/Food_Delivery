import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/label.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

List<String> options = ['default', 'cheap', 'expensive'];

class _FiltersScreenState extends State<FiltersScreen> {
  String currentOption = options[0];
  bool isSpicy = false;
  bool isVegan = false;
  List<bool> labels = [false, false, false, false, false, false, false];
  List<bool> ingredients = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильтр'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Очистить'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        ListTile(
                          title: const Text('По умолчанию'),
                          leading: Radio(
                            value: options[0],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Сначала дешевле'),
                          leading: Radio(
                            value: options[1],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Сначала дороже'),
                          leading: Radio(
                            value: options[2],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Вид',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 10,
                          children: [
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[0].name),
                              selected: labels[0],
                              onSelected: (value) {
                                setState(() {
                                  labels[0] = !labels[0];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[1].name),
                              selected: labels[1],
                              onSelected: (value) {
                                setState(() {
                                  labels[1] = !labels[1];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[2].name),
                              selected: labels[2],
                              onSelected: (value) {
                                setState(() {
                                  labels[2] = !labels[2];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[3].name),
                              selected: labels[3],
                              onSelected: (value) {
                                setState(() {
                                  labels[3] = !labels[3];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[4].name),
                              selected: labels[4],
                              onSelected: (value) {
                                setState(() {
                                  labels[4] = !labels[4];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[5].name),
                              selected: labels[5],
                              onSelected: (value) {
                                setState(() {
                                  labels[5] = !labels[5];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[6].name),
                              selected: labels[6],
                              onSelected: (value) {
                                setState(() {
                                  labels[6] = !labels[6];
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Состав',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 10,
                          children: [
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[0].name),
                              selected: ingredients[0],
                              onSelected: (value) {
                                setState(() {
                                  ingredients[0] = !ingredients[0];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[1].name),
                              selected: ingredients[1],
                              onSelected: (value) {
                                setState(() {
                                  ingredients[1] = !ingredients[1];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[2].name),
                              selected: ingredients[2],
                              onSelected: (value) {
                                setState(() {
                                  ingredients[2] = !ingredients[2];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[3].name),
                              selected: ingredients[3],
                              onSelected: (value) {
                                setState(() {
                                  ingredients[3] = !ingredients[3];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[4].name),
                              selected: ingredients[4],
                              onSelected: (value) {
                                setState(() {
                                  ingredients[4] = !ingredients[4];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[5].name),
                              selected: ingredients[5],
                              onSelected: (value) {
                                setState(() {
                                  ingredients[5] = !ingredients[5];
                                });
                              },
                            ),
                            ChoiceChip(
                              label: Text(MenuLabelEntity.labelsList[6].name),
                              selected: ingredients[6],
                              onSelected: (value) {
                                setState(() {
                                  ingredients[6] = !ingredients[6];
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Острое', style: TextStyle(fontSize: 16)),
                        Switch(
                          value: isSpicy,
                          onChanged: (value) {
                            setState(() {
                              isSpicy = !isSpicy;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Вегетарианское',
                            style: TextStyle(fontSize: 16)),
                        Switch(
                          value: isVegan,
                          onChanged: (value) {
                            setState(() {
                              isVegan = !isVegan;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4.0,
                  offset: Offset(0.0, -1.5),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('ПОКАЗАТЬ 17 ПОЗИЦИЙ'),
            ),
          ),
        ],
      ),
    );
  }
}
