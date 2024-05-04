import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/market_screen/item_user_view.dart';
import 'package:weddify/market_screen/market_cubit.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = 'CategoryScreen';

  @override
  Widget build(BuildContext context) {
    final String? category =
        ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => MarketCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.mainColor,
          title: Text(category ?? 'category',style: const TextStyle(fontFamily: 'RTL-MochaYemen-Sugar'),),
          centerTitle: true,
        ),
        body: Container(
          color: AppTheme.secondaryColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<MarketCubit, MarketState>(
                  builder: (context, state) {
                    if (state.items.isNotEmpty) {
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: state.items.length,
                          itemBuilder: (context, index) {
                            return ItemUserView(item: state.items[index]);
                          },
                        ),
                      );
                    } else {
                      BlocProvider.of<MarketCubit>(context).getItems(category!);
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
