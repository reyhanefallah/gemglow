// import 'package:flutter/material.dart';
// import 'package:gemglow/constants/color-string.dart';
// import 'package:gemglow/constants/widgets/appbar.dart';
// import 'package:gemglow/constants/widgets/widgets.dart';
// import 'package:gemglow/controller/update-name-controller.dart';
// import 'package:gemglow/data/utils/validation.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class ChangeUsernameScreen extends StatelessWidget {
//   const ChangeUsernameScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(UpdateNameController());
//     return Scaffold(
//       appBar: GAppBar(
//         actions: [
//           IconButton(
//             onPressed: () => Get.back(),
//             icon: Icon(Iconsax.arrow_left),
//           ),
//         ],
//         title: Text(
//           'تغییر نام کاربری',
//           style: Theme.of(context).textTheme.headlineSmall,
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Text(
//             //     'از نام واقعی خود برای تأیید آسان استفاده کنید، این نام در چندین صفحه ظاهر می شود',
//             //     style: Theme.of(context).textTheme.labelMedium),
//             // SizedBox(height: 32),
//             Form(
//               key: controller.updateUserNameFormKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: controller.userName,
//                     validator: (value) =>
//                         GValidator.validateEmptyText('Username', value),
//                     expands: false,
//                     decoration: InputDecoration(
//                         labelText: 'نام کاربری',
//                         prefixIcon: Icon(Iconsax.user),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: GColor.primaryColor2),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 32),
//             GElevatedButton(
//                 Gcolor: GColor.primaryColor1,
//                 Gtitle: 'ذخیره',
//                 Gstyle: TextStyle(color: Colors.white),
//                 GonPressed: () => controller.updateUserName()),
//           ],
//         ),
//       ),
//     );
//   }
// }
