import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeader(
              child: Column(
                children: [
                  GHomeAppBar(),
                  SizedBox(
                    height: 24,
                  ),
                  GSearchBar(
                    text: 'جستجو در فروشگاه',
                    icon: Iconsax.search_normal,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: 'دسته بندی ها',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 80.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return VerticalCategory(
                                backgroundcolor: Colors.white,
                                image: 'assets/png/jewel.png',
                                title: 'جواهر',
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  PromoSlider(
                    banners: [
                      'assets/images/promobanner1.jpg',
                      'assets/images/promobanner2.jpg',
                      'assets/images/promobanner3.jpg',
                      'assets/images/promobanner4.jpg',
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GGridLayout(
                    itemcount: 4,
                    itembuilder: (_, index) => GProductCardVertical(),
                  ),
                  SectionHeading(
                    title: 'محبوب ترین ها',
                    showActionButton: false,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GGridLayout(
                    itemcount: 2,
                    itembuilder: (_, index) => GProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//searchbar
class GSearchBar extends StatelessWidget {
  const GSearchBar({
    super.key,
    required this.text,
    this.icon,
    this.showbackground = true,
    this.showborder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
  });

  final String text;
  final IconData? icon;
  final bool showbackground, showborder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: showbackground ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: showborder ? Border.all(color: GColor.primaryColor2) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: GColor.primaryColor2,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: GTextStyle.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
