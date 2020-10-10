import 'package:Shop_App/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavourites;
  ProductsGrid(this.showOnlyFavourites);

  @override
  Widget build(BuildContext context) {
    // setting up a listener to provider, so once the data change there on product, only this widget and its child will rebuild. of(context) is a generic class
    // we specifying that we want to listen to Prodcutprovider only. when we do this, the provider packege looks in the direct parent of this class(inth is case prodcutsoverview),
    // since no provider is provided there , it looks the next parent (main or myapp widget) where it finds a provider and here it finds a instance of productprovider class.
    final productsData = Provider.of<ProductsProvier>(context);
    // using the getter to get a copy of the products list. also testing for filter if favonly or showall
    final products =
        showOnlyFavourites ? productsData.favouriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      // we are using changenotifierprovider so that the productitem screen can listen to the changes made on individual product. here we are not passing a product list, but one
      // individual product to the ProductItem. So with that we can listen to the changes on that product and  in this case change the favourite button icons
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      ),
    );
  }
}
