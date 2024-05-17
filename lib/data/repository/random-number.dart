// // import 'dart:convert';
// // import 'dart:io';
// // import 'dart:math';
// // import 'dart:async';

// // void generateRandomPrices() {
// //   List<String> gemstones = ["Diamond", "Ruby", "Sapphire", "Emerald", "Amethyst", "Opal", "Topaz"];
// //   Map<String, double> prices = {
// //     for (var gem in gemstones) gem: (140 + Random().nextDouble() * 20).toStringAsFixed(2)
// //   };

// //   Map<String, dynamic> data = {
// //     "success": true,
// //     "rates": prices
// //   };

// //   File('gemstone_prices.json').writeAsStringSync(jsonEncode(data), mode: FileMode.write);
// //   print(jsonEncode(data));
// // }

// // void main() {
// //   Timer.periodic(Duration(seconds: 10), (Timer t) => generateRandomPrices());
// // }

// // lib/price_service.dart

// // lib/price_service.dart

// import 'dart:convert';
// import 'package:gemglow/model/gem-price-model.dart';
// import 'package:http/http.dart' as http;

// class PriceService {
//   final String url = 'https://mocki.io/v1/c1bf3eb6-c86d-4b51-ae41-10013c8f7224';

//   Future<List<PricePoint>> fetchPrices() async {
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((item) => PricePoint.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load prices');
//     }
//   }
// }
