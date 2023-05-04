import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product/recommended_product_controller.dart';


import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';

import 'dependency/dependencies.dart' as dependency;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the dependencies
  await dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();

    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(
        builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Product Delivery App',
            initialRoute: RouteHelper.getLandingPage(),
            getPages: RouteHelper.routes,
            
          );
        },
      );
    });
  }
}

// import 'package:flutter/material.dart';


// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late GoogleMapController mapController;

//   final LatLng _center = const LatLng(9.1450, 40.4897);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Maps Sample App'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 11.0,
            
//           ),
//         ),
//       ),
//     );
//   }
// }


