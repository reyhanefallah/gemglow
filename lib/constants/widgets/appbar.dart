import 'package:flutter/material.dart';

class GAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GAppBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.actions,
    this.leadingOnpressed,
    this.backarrow = true,
  });

  final Widget? title;
  final bool backarrow;
  final Widget? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: leadingIcon,
        // backarrow
        //     ? IconButton(
        //         onPressed: () => Get.back(),
        //         icon: Icon(Icons.arrow_forward),
        //       )
        //     : leadingIcon != null
        //         ? IconButton(
        //             onPressed: leadingOnpressed,
        //             icon: Icon(leadingIcon),
        //           )
        //         : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
