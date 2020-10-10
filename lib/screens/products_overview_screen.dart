import 'package:Shop_App/providers/cart.dart';
import 'package:Shop_App/screens/cart_screen.dart';
import 'package:Shop_App/widgets/app_drawer.dart';
import 'package:Shop_App/widgets/badge.dart';
import 'package:Shop_App/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions { Favourites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        // this will create a popupmenubutton
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedvalue) {
              setState(() {
                if (selectedvalue == FilterOptions.All) {
                  /*
                //essentially setting isFavourite to false.
                productContainer.showAll();
                */
                  _showOnlyFavourites = false;
                } else {
                  /*
                //essentially setting isFavourite to true.
                productContainer.showFavourites();
                */
                  _showOnlyFavourites = true;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOptions.Favourites,
                // this is 0 since its first value of enum
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
                // this is 1 since its second value of enum
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, childs) => Badge(
              child: childs,
              value: cart.itemCount.toString(),
            ),
            // child widgets inside the consumer doesnt get rebuild, we are passing this to the builder function
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.route);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
