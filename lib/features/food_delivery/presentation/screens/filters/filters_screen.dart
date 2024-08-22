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
              child: Column(
                children: [
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
                    children: [
                      const Text('Вид'),
                      Wrap(
                        children: [
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[0].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[1].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[2].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[3].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[4].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[5].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[6].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Column(
                    children: [
                      const Text('Состав'),
                      Wrap(
                        children: [
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[0].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[1].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[2].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[3].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[4].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[5].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          ChoiceChip(
                            label: Text(MenuLabelEntity.labelsList[6].name),
                            selected: false,
                            onSelected: (value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Острое'),
                      Switch(
                        value: isSpicy,
                        onChanged: (value) {
                          setState(() {
                            isSpicy = !isSpicy;
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Вегетарианское'),
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
          ElevatedButton(
              onPressed: () {}, child: const Text('ПОКАЗАТЬ 17 ПОЗИЦИЙ'))
        ],
      ),
    );
  }
}
