import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weddify/market_screen/item_user_view.dart';
import 'package:weddify/market_screen/market_cubit.dart';
import 'package:weddify/merchant_screens/item_container.dart';


class CategoryScreen extends StatelessWidget {

  static const String routeName = 'CategoryScreen';


  @override
  Widget build(BuildContext context) {
    final String ? category = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    return BlocProvider(
      create: (context) => MarketCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(category ?? 'category'), centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<MarketCubit, MarketState>(
                builder: (context, state) {
                  if (state.items.isNotEmpty) {
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
