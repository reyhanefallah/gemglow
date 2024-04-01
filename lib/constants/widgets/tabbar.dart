import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets/brandcard.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';

class GTabBer extends StatelessWidget implements PreferredSizeWidget {
  const GTabBer({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: GColor.primaryColor1,
        labelColor: Colors.black,
        unselectedLabelColor: GColor.primaryColor2,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getAppBarHeight());

  double getAppBarHeight() {
    return kToolbarHeight;
  }
}

//CategoryTab
class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              BrandShowCase(
                images: [
                  'assets/images/promobanner2.jpg',
                  'assets/images/promobanner3.jpg',
                  'assets/images/promobanner4.jpg',
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SectionHeading(
                title: 'you might like',
                textColor: Colors.black,
                showActionButton: true,
                onPressed: () {},
              ),
              SizedBox(
                height: 15,
              ),
              GGridLayout(
                  itemcount: 4,
                  itembuilder: (_, index) => GProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
