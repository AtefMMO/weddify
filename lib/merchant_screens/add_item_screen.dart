import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weddify/login/login_bloc.dart';
import 'package:weddify/login/user_data.dart';
import 'package:weddify/merchant_screens/add_item_to_firebase.dart';


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
  late ItemData _itemData;
LoginBloc loginBloc =LoginBloc();
  @override
  void initState() {
    super.initState();
    _itemData = ItemData(); // Initialize _itemModel in initState
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>loginBloc,
      child: BlocBuilder<LoginBloc,LoginState>(
        builder: (BuildContext context, state) {
          return SingleChildScrollView(
            child: _buildModalContainer(context,state),
          );
        },

      ),
    );
  }

  Container _buildModalContainer(BuildContext context,LoginState state) {
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
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _buildImagePicker(context),
                    _buildValidationButton(state)
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Padding _buildValidationButton(LoginState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ElevatedButton(
        onPressed: () {
          print(_itemData.title);
          print(_itemData.description);
print(_itemData.price);
print(state.id);
          addItem(state.id!);
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
          // _itemModel!.selectedImage = pickedImage;
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
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black)),
        ),
        maxLines: 3,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Invalid Item description';
          }
        },
        onChanged: (value) {
          _itemData?.description = value;
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
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black))),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Invalid Item price';
            }
          },
          onChanged: (value) {
            _itemData?.price = value;
            print('${_itemData.price}');
          }),
    );
  }

  Padding _buildTitleField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Enter Item title',
            hintStyle: Theme.of(context).textTheme.titleSmall,
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black))),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Invalid Item Name';
          }
        },
        onChanged: (value) {
          _itemData?.title = value;
        },
      ),
    );
  }

  void addItem(String uid) async {
    if (formKey.currentState!.validate()) {
      ItemData note = ItemData(
          title: _itemData.title,
          description: _itemData.description,
          price: _itemData.price);

      try {
       await FirebaseUtilsMerchant.addItemToFirebase(_itemData,uid);
        print('Item Added Successfully');
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: "Item Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } catch (e) {
        print('Error adding Item: $e');
        // Handle error adding note to Firebase
        Fluttertoast.showToast(
          msg: "Failed to add Item Please try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }
}
