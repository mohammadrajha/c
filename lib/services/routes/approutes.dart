import 'package:flutter/cupertino.dart';
import 'package:mai_jo/packages/views/cart/cart_page.dart';
import 'package:mai_jo/packages/views/favorites/favorites.dart';
import 'package:mai_jo/packages/views/more/more.dart';
import 'package:mai_jo/packages/views/orders/orders.dart';
import 'package:mai_jo/packages/views/product_details/product_details.dart';
import 'package:mai_jo/packages/views/settings/add_new_address.dart';
import 'package:mai_jo/packages/views/settings/settings.dart';
import 'package:mai_jo/packages/views/spalash_screen/splash_screen.dart';
import 'package:mai_jo/packages/views/station_page/station_page.dart';
import 'package:mai_jo/packages/views/welcome_page/welcome_page.dart';

import '../../packages/views/authentication/login.dart/login.dart';
import '../../packages/views/authentication/signup.dart/curent_location/curent_location.dart';
import '../../packages/views/authentication/signup.dart/full_name/full_name.dart';
import '../../packages/views/authentication/signup.dart/otp/otp.dart';
import '../../packages/views/authentication/signup.dart/password/input_password.dart';
import '../../packages/views/authentication/signup.dart/phone_number/input_phone.dart';
import '../../packages/views/home_page/homepage.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SplashScreenPage.routename: (context) => const SplashScreenPage(),
    WelcomePage.routename: (context) => const WelcomePage(),
    LoginPage.routename: (context) => const LoginPage(),
    InputPhone.routename: (context) => const InputPhone(),
    OtpPage.routename: (context) => const OtpPage(),
    InputPassword.routename: (context) => const InputPassword(),
    FullName.routename: (context) => const FullName(),
    CurentLocation.routename: (context) => const CurentLocation(),
    HomePageScreen.routename: (context) => const HomePageScreen(),
    MorePage.routename: (context) => const MorePage(),
    SettingsPage.routename: (context) => const SettingsPage(),
    OrdersPage.routename: (context) => OrdersPage(),
    FavoritesPage.routename: (context) => const FavoritesPage(),
    StationPage.routename: (context) => StationPage(),
    ProductDetails.routename: (context) => const ProductDetails(),
    CartHome.routename: (context) => const CartHome(),
    AddNewAddress.routename: (context) => const AddNewAddress(),

    // // Authentication routes

    // // Main app routes
    // HomePageNew.routename: (context) => const HomePageNew(),
    // WaterShopDetails.routename: (context) => const WaterShopDetails(),
    // MoreServices.routename: (context) => const MoreServices(),
    // CartHome.routename: (context) => const CartHome(),
    // CheckOutPage.routename: (context) => const CheckOutPage(),
    // ProfilePage.routename: (context) => ProfilePage(),
    // MapPage.routename: (context) => const MapPage(),
    // ForgotPassword.routename: (context) => const ForgotPassword(),
    // ForgotPAsswordEntryScreen.routename: (context) =>
    //     const ForgotPAsswordEntryScreen(),
    // OrderPage.routename: (context) => const OrderPage(),

    // Note: AddressInfoPage requires parameters for instantiation, which are not provided in the code above.
    // Please make sure to pass the required parameters or update the AddressInfoPage widget to have default parameters.
    // Uncomment the below line once the parameters are available
    // AddressInfoPage.routename: (context) => AddressInfoPage(),
  };
}
