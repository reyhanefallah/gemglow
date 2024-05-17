// import 'package:flutter/material.dart';
// import 'package:gemglow/constants/widgets-page/price-widget.dart';
// import 'package:gemglow/constants/widgets/appbar.dart';
// import 'package:gemglow/model/gem-price-model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// class PriceScreen extends StatefulWidget {
//   PriceScreen({super.key});

//   @override
//   State<PriceScreen> createState() => _PriceScreenState();
// }

// class _PriceScreenState extends State<PriceScreen> {
//   List<PriceModel> priceItem = [];

//   getResponse() {
//     var url = "http://sasansafari.com/flutter/api.php?access_key=flutter123456";
//     http.get(Uri.parse(url)).then(
//       (value) {
//         if (value.statusCode == 200) {
//           List jsonList = convert.jsonDecode(value.body);

//           // if (jsonList.isEmpty) {
//           if (jsonList.length > 0) {
//             for (int i = 0; i < jsonList.length; i++) {
//               setState(() {
//                 priceItem.add(PriceModel(
//                   id: jsonList[i]["id"],
//                   title: jsonList[i]["title"],
//                   price: jsonList[i]["price"],
//                   changes: jsonList[i]["changes"],
//                   status: jsonList[i]["status"],
//                 ));
//               });
//               // }
//             }
//           }
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     getResponse();

//     return Scaffold(
//       //appBar: GAppBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             children: [
//               SizedBox(height: 32),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('نام سنگ'),
//                   Text('قیمت'),
//                   Text('تغییرات'),
//                 ],
//               ),
//               SizedBox(
//                 height: 420,
//                 child: ListView.separated(
//                   itemCount: priceItem.length,
//                   itemBuilder: (BuildContext context, int position) {
//                     return Padding(
//                       padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
//                       child: GPriceItem(position, priceItem),
//                     );
//                   },
//                   separatorBuilder: (BuildContext context, int index) {
//                     return SizedBox();
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/price-widget.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/model/gem-price-model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PriceScreen extends StatefulWidget {
  PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<PriceModel> priceItem = [];
  List<String> customNames = [
    "Diamond",
    "Ruby",
    "Emerald",
    "Sapphire",
    "Opal",
    "Amethyst",
  ];

  Future getResponse(BuildContext cntx) async {
    var url = "http://sasansafari.com/flutter/api.php?access_key=flutter123456";

    var value = await http.get(Uri.parse(url));

    if (value.statusCode == 200) {
      List jsonList = convert.jsonDecode(value.body);

      if (jsonList.isNotEmpty) {
        for (int i = 0; i < customNames.length; i++) {
          setState(() {
            priceItem.add(PriceModel(
              id: jsonList[i]["id"],
              title: customNames[i],
              price: jsonList[i]["price"],
              changes: jsonList[i]["changes"],
              status: jsonList[i]["status"],
            ));
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getResponse(context);
  }

  @override
  void didUpdateWidget(covariant PriceScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    getResponse(context);

    return Scaffold(
      //appBar: GAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('نام سنگ'),
                  Text('قیمت'),
                  Text('تغییرات'),
                ],
              ),
              SizedBox(
                height: 420,
                child: listFutureBuilder(context),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: GElevatedButton(
          Gcolor: GColor.primaryColor2,
          Gtitle: 'به روزرسانی',
          Gstyle:
              Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),
          GonPressed: () {
            priceItem.clear();
            listFutureBuilder(context);
          },
        ),
      ),
    );
  }

  FutureBuilder<dynamic> listFutureBuilder(BuildContext context) {
    return FutureBuilder(
        future: getResponse(context),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.separated(
                  itemCount: priceItem.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: GPriceItem(position, priceItem),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
