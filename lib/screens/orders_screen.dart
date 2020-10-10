import 'package:Shop_App/providers/orders.dart';
import 'package:Shop_App/screens/order_item_screen.dart';
import 'package:Shop_App/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const route = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderdata = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderItemScreen(
          orderdata.orders[index],
        ),
        itemCount: orderdata.orders.length,
      ),
    );
  }
}
