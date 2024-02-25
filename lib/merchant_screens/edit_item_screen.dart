import 'package:flutter/material.dart';

class EditItemScreen extends StatefulWidget {

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
var formKey=GlobalKey<FormState>();

String itemName='Item',itemPrice='111',itemDescription='My New Item';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8),
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Text(
              'Edit Item',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
                padding: EdgeInsets.all(25),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(initialValue: itemName,
                          decoration: InputDecoration(
                              hintText: 'Enter Item title',
                              hintStyle: Theme.of(context).textTheme.titleSmall,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Item Name';
                            }
                          },
                          onChanged: (value) {
                            itemName = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(initialValue: itemPrice,
                          decoration: InputDecoration(
                              hintText: 'Enter Item price',
                              hintStyle: Theme.of(context).textTheme.titleSmall,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Item price';
                            }
                          },
                          onChanged: (value) {
                            itemPrice = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(initialValue: itemDescription,
                          decoration: InputDecoration(
                            hintText: 'Enter Item description',
                            hintStyle: Theme.of(context).textTheme.titleSmall,
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.black)),
                          ),
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Item description';
                            }
                          },
                          onChanged: (value) {
                            itemDescription = value;
                          },
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
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Colors.grey,
                          child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                //add item to db
                              }
                            },
                            child: Text(
                              'Edit Item',
                              style: TextStyle(fontSize: 18),
                            )),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
