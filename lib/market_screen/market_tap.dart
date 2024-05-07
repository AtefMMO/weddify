import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/market_screen/item_user_view.dart';
import 'package:weddify/market_screen/merchant_container.dart';
import 'package:weddify/market_screen/search_cubit.dart';

class Market extends StatefulWidget {
  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
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
  List<String> categoriesTranslated = [
    'Appliances',
    'Housewares',
    'Furniture',
    'Home Furnishings',
    'Wedding halls',
    'Limousine companies',
    'Kitchens',
    'Electrical Tools',
    'Healthy Equipment',
    'Decorations'
  ];
  List<String> categoriesImages = [
    'assets/images/Appliances.jpg',
    'assets/images/Housewares.jpg',
    'assets/images/Furniture.jpg',
    'assets/images/Bed cover.jpg',
    'assets/images/Wedding halls.jpg',
    'assets/images/Limousine companies.jpg',
    'assets/images/Kitchens.jpg',
    'assets/images/Electrical Tools.jpg',
    'assets/images/Healthy Equipment.jpg',
    'assets/images/Decorations.jpg'
  ];
  String query = '';
  String previousQuery = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.secondaryColor,
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: AppTheme.mainColor),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  onChanged: (value) {
                    query = value;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 10,),
              query.isEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return MerchantContainer(
                            category: categories[index],
                            categoryTranslate: categoriesTranslated[index],
                            categoryImage: categoriesImages[index],
                          );
                        },
                        itemCount: categories.length,
                      ),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<SearchCubit, SearchState>(
                            builder: (context, state) {
                              if (state.items.isNotEmpty) {
                                if (previousQuery != query) {
                                  previousQuery = query;
                                  BlocProvider.of<SearchCubit>(context)
                                      .clearItems();
                                  BlocProvider.of<SearchCubit>(context)
                                      .getItems(query!);
                                }
                                return Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: GridView.builder(
                                      itemCount: state.items.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8.0,
                                        mainAxisSpacing: 8.0,
                                        childAspectRatio: 0.7,
                                      ),
                                      itemBuilder: (context, index) {
                                        return ItemUserView(
                                            item: state.items[index]);
                                      }),
                                ));
                              } else {
                                BlocProvider.of<SearchCubit>(context)
                                    .getItems(query!);
                                previousQuery = query;

                                return const Center(
                                  child: Text(
                                    'Item Not Found',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
