import 'package:Shop_App/providers/cart.dart';
import 'package:Shop_App/providers/orders.dart';
import 'package:Shop_App/providers/products_provider.dart';
import 'package:Shop_App/screens/cart_screen.dart';
import 'package:Shop_App/screens/orders_screen.dart';
import 'package:Shop_App/screens/product_details_screen.dart';
import 'package:Shop_App/screens/products_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // we setting up a provider here, typically we setup provider to the widget which is the topmost level of the widgets that
    // needs to use the provider data. for example, in this case the 2 screens need the provider data and main is their topmost
    // widget.

    // if something changes in the provider , only the widgets which are listening to it will rebuild. rest will not.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // for provider version which are less than 4.0 it will be builder instead of the create. this provider is providing an instance
          // of ProductsProvider class to all child widget(MaterialApp and all its children). all child widgets can set up a listener to this
          // class. whenever something is changed on provider, all child which is listening to it will be rebuild
          create: (ctx) => ProductsProvier(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductsOverviewScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.route: (ctx) => CartScreen(),
          OrdersScreen.route: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
