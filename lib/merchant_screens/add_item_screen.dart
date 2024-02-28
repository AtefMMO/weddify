import 'package:flutter/material.dart';
import 'package:weddify/login/user_data.dart';
import 'package:weddify/merchant_screens/merchant_bloc.dart';
import 'package:weddify/merchant_screens/user_image_picker.dart';
import 'package:weddify/models/item_model.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  var formKey = GlobalKey<FormState>();

  UserData? _userData;
  ItemModel? _itemModel;

  final MerchantBloc _merchantBloc = MerchantBloc();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildModalContainer(context),
    );
  }

  Container _buildModalContainer(BuildContext context) {
    return Container(
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
                    _buildTitleField(context),
                    _buildPriceField(context),
                    const SizedBox(height: 15),
                    _buildDescriptionField(context),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Select Item Image',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _buildImagePicker(context),
                    _buildValidationButton()
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Padding _buildValidationButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            _merchantBloc.add(MerchantEvent.onAddItem(itemModel: _itemModel ?? ItemModel(), userId: _userData!.id));
          }
        },
        child: const Text(
          'Add Item',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Padding _buildImagePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: UserImagePicker(
        onPickImage: (pickedImage) {
          _itemModel!.selectedImage = pickedImage;
        },
      ),
    );
  }

  Padding _buildDescriptionField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Enter Item description',
          hintStyle: Theme.of(context).textTheme.titleSmall,
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black)),
        ),
        maxLines: 3,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Invalid Item description';
          }
        },
        onChanged: (value) {
          _itemModel!.description = value;
        },
      ),
    );
  }

  Padding _buildPriceField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Enter Item price',
            hintStyle: Theme.of(context).textTheme.titleSmall,
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black))),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Invalid Item price';
          }
        },
        onChanged: (value) {
          _itemModel!.price = value;
        },
      ),
    );
  }

  Padding _buildTitleField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Enter Item title',
            hintStyle: Theme.of(context).textTheme.titleSmall,
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black))),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Invalid Item Name';
          }
        },
        onChanged: (value) {
          _itemModel?.title = value;
        },
      ),
    );
  }
}
