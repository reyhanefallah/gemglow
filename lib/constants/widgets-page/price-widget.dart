import 'package:flutter/material.dart';
import 'package:gemglow/model/gem-price-model.dart';

class GPriceItem extends StatelessWidget {
  GPriceItem(this.position, this.priceItem);

  final int position;
  final List<PriceModel> priceItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(priceItem[position].title!,
              style: Theme.of(context).textTheme.bodyMedium),
          Text(priceItem[position].price!,
              style: Theme.of(context).textTheme.bodyMedium),
          Text(priceItem[position].changes!,
              style: priceItem[position].status == "n"
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.red)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.green)),
        ],
      ),
    );
  }
}
