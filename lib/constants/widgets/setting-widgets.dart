import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/user-controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GPrimaryHeaderContainer extends StatelessWidget {
  const GPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurveHome(
      child: Container(
        color: GColor.primaryColor1,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty
            ? networkImage
            : 'assets/png/profile-image.png';
        return controller.imageUploading.value
            ? GShimmerEffect(width: 55, height: 55, radius: 80)
            : CircleImage(
                image: image,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
                padding: 0.0,
                isNetworkImage: networkImage.isNotEmpty);
      }),
      //  CircleImage(
      //   image: 'assets/png/profile-image.png',
      //   fit: BoxFit.cover,
      //   width: 50,
      //   height: 50,
      //   padding: 0.0,
      // ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: Colors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Iconsax.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SetteingMenuTile extends StatelessWidget {
  const SetteingMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: GColor.primaryColor1,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
