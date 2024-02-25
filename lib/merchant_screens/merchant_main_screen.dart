import 'package:flutter/material.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/merchant_screens/add_item_screen.dart';
import 'package:weddify/merchant_screens/items_screen.dart';
import 'package:weddify/merchant_screens/settings_screen.dart';

class MerchantMainScreen extends StatefulWidget {
  static const String routeName = 'MerchantMainScreen';

  @override
  State<MerchantMainScreen> createState() => _MerchantMainScreenState();
}

class _MerchantMainScreenState extends State<MerchantMainScreen> {
  @override
  List<Widget> tapsList = [ItemsScreen(), SettingsScreen()];
  int selectedIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            selectedIndex == 0 ? 'Merchant\'s Name' : 'Settings',
            style: Theme.of(context).textTheme.titleLarge,
          )),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.white,
        notchMargin: 6,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          unselectedItemColor: AppTheme.unselectedPurble,
          selectedItemColor: AppTheme.selectedPurble,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Items'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowAddTaskBottomSheet();
          //bottom sheet here
        },
        shape: StadiumBorder(side: BorderSide(color: Colors.grey, width: 4)),
        child: Icon(
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
        context: context, builder: (context) => AddItemScreen());
  }
}
