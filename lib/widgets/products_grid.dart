import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/products.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavorites;
  ProductsGrid(this.showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showOnlyFavorites ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      //itemBuilder: (ctx, i) => ChangeNotifierProvider(
      //  create: (c) => products[i],
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //better solution for list and grid
        value: products[
            i], //.value better with provding objects which have alredy been created
        child: ProductItem(
            //  products[i].id,
            //  products[i].title,
            //  products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
