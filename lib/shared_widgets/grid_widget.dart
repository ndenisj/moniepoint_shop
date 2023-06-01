import 'package:flutter/material.dart';
import 'package:moniepoint_shop/app_links.dart';
import 'package:moniepoint_shop/models/product_model.dart';
import 'package:moniepoint_shop/services/route_service.dart';
import 'package:moniepoint_shop/shared_widgets/product_widget.dart';

class MyGridView extends StatelessWidget {
  final List<Product> items;

  MyGridView({required this.items});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        mainAxisExtent: MediaQuery.of(context).size.width / 1.6,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var product = items[index];
          return ProductWidget(
            product: product,
            onTap: () {
              routeService.gotoRoute(AppLinks.productDetails,
                  arguments: product);
            },
          );
        },
        childCount: items.length,
      ),
    );
  }
}
