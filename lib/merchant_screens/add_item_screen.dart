import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weddify/merchant_screens/add_item_bloc.dart';
import 'package:weddify/merchant_screens/user_image_picker.dart';
import 'package:weddify/models/item_model.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key, required this.id,required this.name});
  final String id;
  final String name;
  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  var formKey = GlobalKey<FormState>();
  List<String> categories = [
    'اجهزة منزلية',
    'ادوات منزلية',
    'أثاث',
    'مفروشات',
    'قاعات',
    'شركات ليموزين',
    'مطابخ',
    'ادوات كهربائية',
    'ادوات صحية',
    'ديكورات'
  ];
  late ItemData _itemData;
  final AddItemBloc _addItemBloc = AddItemBloc();
  String? _selectedItemCategory;
  @override
  void initState() {
    super.initState();
    _itemData = ItemData(); // Initialize _itemModel in initState
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _addItemBloc,
      child: BlocBuilder<AddItemBloc, AddItemState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              padding: const EdgeInsets.all(8),
              color: Theme.of(context).cardColor,
              child: Column(
                children: [
                  Text(
                    'Add new Item',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Enter Item title',
                                  hintStyle:
                                      Theme.of(context).textTheme.titleSmall,
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Invalid Item Name';
                                }
                              },
                              onChanged: (value) {
                                _itemData.title = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Enter Item price',
                                    hintStyle:
                                        Theme.of(context).textTheme.titleSmall,
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Invalid Item price';
                                  }
                                },
                                onChanged: (value) {
                                  _itemData.price = value;
                                  print('${_itemData.price}');
                                }),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter Item description',
                                hintStyle:
                                    Theme.of(context).textTheme.titleSmall,
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.black)),
                              ),
                              maxLines: 3,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Invalid Item description';
                                }
                              },
                              onChanged: (value) {
                                _itemData.description = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 10),
                            child: Text(
                              'Select Item Category',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          DropdownButtonFormField<String>(dropdownColor: Colors.white,
                            value: _selectedItemCategory,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedItemCategory = newValue;
                              });
                            },
                            items: categories
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              labelText: 'Select an item',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              'Select Item Image',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UserImagePicker(
                              onPickImage: (pickedImage) {
                                _itemData.selectedImage = pickedImage;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: ElevatedButton(
                              onPressed: () {
                                print(_itemData.title);
                                print(_itemData.description);
                                print(_itemData.price);
                                if(formKey.currentState!.validate()){
                                  _addItemBloc.add(
                                    AddItemEvent.onSaveItem(
                                      id: widget.id,
                                      itemModel: ItemData(
                                        description: _itemData.description,
                                        price: _itemData.price,
                                        title: _itemData.title,
                                        selectedImage: _itemData.selectedImage,
                                        category: _selectedItemCategory,
                                        seller: widget.name
                                      ),
                                      context: context,
                                    ),
                                  );
                                }

                              },
                              child: const Text(
                                'Add Item',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}
