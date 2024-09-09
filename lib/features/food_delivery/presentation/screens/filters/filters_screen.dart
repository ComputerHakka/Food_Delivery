import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/ingredient.dart';
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
  List<int> lebelsIds = [];
  List<int> ingredientsIds = [];

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
                            for (var i = 0; i < 7; i++)
                              ChoiceChip(
                                label: Text(MenuLabelEntity.labelsList[i].name),
                                selected: labels[i],
                                onSelected: (value) {
                                  setState(() {
                                    labels[i] = !labels[i];
                                    if (labels[i]) {
                                      lebelsIds.add(
                                          MenuLabelEntity.labelsList[i].id);
                                    } else {
                                      lebelsIds.remove(
                                          MenuLabelEntity.labelsList[i].id);
                                    }
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
                            for (var i = 0; i < 7; i++)
                              ChoiceChip(
                                label: Text(IngredientEntity.ingredients[i].name
                                    .toUpperCase()),
                                selected: ingredients[i],
                                onSelected: (value) {
                                  setState(() {
                                    ingredients[i] = !ingredients[i];
                                    if (ingredients[i]) {
                                      ingredientsIds.add(
                                          IngredientEntity.ingredients[i].id);
                                    } else {
                                      ingredientsIds.remove(
                                          IngredientEntity.ingredients[i].id);
                                    }
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
