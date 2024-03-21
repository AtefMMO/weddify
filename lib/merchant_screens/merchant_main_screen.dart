import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/merchant_screens/add_item_screen.dart';
import 'package:weddify/merchant_screens/items_screen.dart';
import 'package:weddify/merchant_screens/settings_screen.dart';

class MerchantMainScreen extends StatefulWidget {
  static const String routeName = 'MerchantMainScreen';
  final String id;

  const MerchantMainScreen({super.key, required this.id});
  @override
  State<MerchantMainScreen> createState() => _MerchantMainScreenState();
}

class _MerchantMainScreenState extends State<MerchantMainScreen> {
  List<Widget> tapsList = [const ItemsScreen(), const SettingsScreen()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          selectedIndex == 0 ? 'Merchant\'s Name' : 'Settings',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.white,
        notchMargin: 6,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          unselectedItemColor: AppTheme.unselectedPurble,
          selectedItemColor: AppTheme.selectedPurble,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Items'),
            const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowAddTaskBottomSheet();
          //bottom sheet here
        },
        shape: const StadiumBorder(side: BorderSide(color: Colors.grey, width: 4)),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tapsList[selectedIndex],
    );
  }

  ShowAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => AddItemScreen(
              id: widget.id,
            ));
  }
}
