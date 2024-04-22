import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_hotel/configs/routes/routes.dart';
import 'package:my_hotel/configs/routes/routes_name.dart';
import 'package:my_hotel/repository/Auth/auth_repository.dart';
import 'package:my_hotel/repository/Auth/implement_auth_repository.dart';
import 'package:my_hotel/repository/Hotel/hotel_repository.dart';
import 'package:my_hotel/repository/Hotel/implement_hotel_repository.dart';
import 'package:my_hotel/view/login/login_screen.dart';
import 'package:my_hotel/view/splash/splash_screen.dart';
import 'package:my_hotel/view_model/hotel_view_model.dart';
import 'package:my_hotel/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp());
  getIt.registerLazySingleton<HotelRepository>(() => HotelRepositoryImp());
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