import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weddify/merchant_screens/merchant_bloc.dart';
import 'package:weddify/merchant_screens/user_image_picker.dart';
import 'package:weddify/models/item_model.dart';

class AddVideoScreen extends StatefulWidget {
  const AddVideoScreen({super.key});

  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  var formKey = GlobalKey<FormState>();

  File? selectedImage;
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
      width: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.all(8),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Text(
            'Add Video',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
              padding: const EdgeInsets.all(25),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Select Video Image',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.black),
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

          }
        },
        child: const Text(
          'Add Video',
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
          selectedImage = pickedImage;
        },
      ),
    );
  }
}
