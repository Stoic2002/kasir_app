import 'package:flutter/material.dart';

import 'package:kasir_app/features/transaction/presentetion/widget/product_item_show.dart';

class ShowSelectedProduct {
  void showSelectedProducts(BuildContext context) {
    showModalBottomSheet(
      elevation: 2,
      isScrollControlled: true,
      // constraints: BoxConstraints(maxWidth: double.infinity, maxHeight: 700),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          maxChildSize: 0.9,
          minChildSize: 0.32,
          builder: (context, scrollController) => SingleChildScrollView(
            controller: scrollController,
            child: Stack(
                alignment: AlignmentDirectional.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    child: Container(
                      width: 60,
                      height: 8,
                      color: Colors.white,
                    ),
                    top: -15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ProductItemShow(),
                      ),
                    ),
                  ),
                ]),
          ),
        );
      },
    );
  }
}
