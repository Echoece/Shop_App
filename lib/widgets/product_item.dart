import 'package:Shop_App/providers/cart.dart';
import 'package:Shop_App/providers/product.dart';
import 'package:Shop_App/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//this widget is a part of the product_overview_screen, important thing to consider is this class recieve a single prodcut
class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // we setting the listen to false because we are only interested in the data for now. we will use consumer widget to specify below where change is
    // required to listen into.
    final product = Provider.of<Product>(context, listen: false);
    // we setting listen to false , because we only interested in changing the data, not rebuilding our widget depending on it. the widget which will change
    // will be the cart screen.
    final cart = Provider.of<Cart>(context, listen: false);
    // we wrap with clipRRect to get the rounded corners. this R stand for rounded.
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // wrapping with gesterdetector because we want to make it clickable
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            // the child argument is used in case we need some widget that we dont want to rebuild when provider data changes.
            // for example child : Text('Never changes'), this is tiny opitmization
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toggleFavourite();
              },
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product.id, product.title, product.price);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
