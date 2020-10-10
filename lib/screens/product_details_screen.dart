import 'package:Shop_App/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // ProductDetailScreen(this.title);
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    // getting the data from the argument that is passed ,when we call the pushnamed route method
    final productId = ModalRoute.of(context).settings.arguments as String;
    // here we getting the data from the provider class. the instance is created on the main.dart. using the getter function (items) we can use the List method firstwhere
    // and get the element matching the productID

    // the listen argument is used as false so we dont rebuild everytime the product is changed, since we dont need that in this screen. by default its set to true and will
    // rerun the widget everytime the provider data is changed
    final loadedProduct = Provider.of<ProductsProvier>(context, listen: false)
        .findbyId(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${loadedProduct.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  loadedProduct.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ))
          ],
        ),
      ),
    );
  }
}
