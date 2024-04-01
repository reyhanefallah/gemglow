import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/image-strings.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/brandcard.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/tabbar.dart';
import 'package:gemglow/view/home-screen.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: GAppBar(
          title: Text(
            'فروشگاه',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CardCounter(
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(24),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      GSearchBar(
                        text: 'جستجو در فروشگاه',
                        showborder: true,
                        icon: Iconsax.search_normal,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SectionHeading(
                        title: 'featured Brands',
                        textColor: Colors.black,
                        onPressed: () {},
                        space: MainAxisAlignment.spaceBetween,
                      ),
                      SizedBox(
                        height: 24 / 1.5,
                      ),
                      GGridLayout(
                        itemcount: 4,
                        maxextent: 80,
                        itembuilder: (_, index) {
                          return BrandCard(showBorder: true);
                        },
                      ),
                    ],
                  ),
                ),
                bottom: GTabBer(
                  tabs: [
                    Tab(
                      text: 'طبیعی',
                    ),
                    Tab(
                      text: 'طبیعی',
                    ),
                    Tab(
                      text: 'طبیعی',
                    ),
                    Tab(
                      text: 'طبیعی',
                    ),
                    Tab(
                      text: 'طبیعی',
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
