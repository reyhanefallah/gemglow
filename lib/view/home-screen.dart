import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
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
                  SearchBar(
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
              child: PromoSlider(
                banners: [
                  'assets/images/promobanner1.jpg',
                  'assets/images/promobanner2.jpg',
                  'assets/images/promobanner3.jpg',
                  'assets/images/promobanner4.jpg',
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
class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.text,
    this.icon,
    this.showbackground = true,
    this.showborder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showbackground, showborder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
