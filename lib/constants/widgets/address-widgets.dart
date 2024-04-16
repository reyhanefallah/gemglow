import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:iconsax/iconsax.dart';

class GSingleAddress extends StatelessWidget {
  const GSingleAddress({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? GColor.primaryColor1.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : Colors.black26,
      margin: EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Positioned(
            left: 5,
            top: 0.0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? GColor.primaryColor3 : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ریحانه فلاح',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 16 / 2),
              Text('+98 9178766199',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              SizedBox(height: 16 / 2),
              Text('تهران تهرانپارس فلکه چهارم خیابان توحید', softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}
