import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_hotel/configs/routes/routes.dart';
import 'package:my_hotel/configs/routes/routes_name.dart';
import 'package:my_hotel/repository/Area/area_repository.dart';
import 'package:my_hotel/repository/Area/implement_area_repository.dart';
import 'package:my_hotel/repository/Auth/auth_repository.dart';
import 'package:my_hotel/repository/Auth/implement_auth_repository.dart';
import 'package:my_hotel/repository/Banner/banner_repository.dart';
import 'package:my_hotel/repository/Banner/implement_banner_repository.dart';
import 'package:my_hotel/repository/Coupon/coupon_repository.dart';
import 'package:my_hotel/repository/Coupon/implement_conpon_repository.dart';
import 'package:my_hotel/repository/Customer/customer_repository.dart';
import 'package:my_hotel/repository/Customer/implement_customer_repository.dart';
import 'package:my_hotel/repository/Hotel/hotel_repository.dart';
import 'package:my_hotel/repository/Hotel/implement_hotel_repository.dart';
import 'package:my_hotel/repository/Order/implement_order_repository.dart';
import 'package:my_hotel/repository/Order/order_repository.dart';
import 'package:my_hotel/view/splash/splash_screen.dart';
import 'package:my_hotel/view_model/area_view_model.dart';
import 'package:my_hotel/view_model/banner_view_model.dart';
import 'package:my_hotel/view_model/coupon_view_model.dart';
import 'package:my_hotel/view_model/customer_view_model.dart';
import 'package:my_hotel/view_model/favourite_view_model.dart';
import 'package:my_hotel/view_model/hotel_view_model.dart';
import 'package:my_hotel/view_model/login/login_view_model.dart';
import 'package:my_hotel/view_model/order_view_model.dart';
import 'package:provider/provider.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp());
  getIt.registerLazySingleton<HotelRepository>(() => HotelRepositoryImp());
  getIt.registerLazySingleton<AreaRepository>(() => AreaRepositoryImp());
  getIt.registerLazySingleton<BannerRepository>(() => BannerRepositoryImp());
  getIt.registerLazySingleton<OrderRepository>(() => OrderRepositoryImp());
  getIt.registerLazySingleton<CouponRepository>(() => CouponRepositoryImp());
  getIt
      .registerLazySingleton<CustomerRepository>(() => CustomerRepositoryImp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(authRepository: getIt()),
        ),
        ChangeNotifierProvider(
          create: (context) => HotelViewModel(hotelRepository: getIt()),
        ),
        ChangeNotifierProvider(
          create: (context) => AreaViewModel(areaRepository: getIt()),
        ),
        ChangeNotifierProvider(
          create: (context) => BannerViewModel(bannerRepository: getIt()),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderViewModel(orderRepository: getIt()),
        ),
        ChangeNotifierProvider(
          create: (context) => CouponViewModel(couponRepository: getIt()),
        ),
        ChangeNotifierProvider(
          create: (context) => FavouriteViewModel(hotelRepository: getIt()),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerViewModel(customerRepository: getIt()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SplashScreen(),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
