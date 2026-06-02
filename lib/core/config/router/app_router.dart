// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mediezy_task/view/auth/login_screen.dart';

// import '../di/injection.dart';


// import 'route_names.dart';

// class AppRouter {

//  static Route<dynamic>
//  generateRoute(

//  RouteSettings settings

//  ){

//    switch(
//    settings.name
//    ){

//     //  case RouteNames.splash:

//     //    return MaterialPageRoute(

//     //      builder:(_)=>

//     //      const SplashScreen(),

//     //    );

//      case RouteNames.login:

//        return MaterialPageRoute(

//          builder:(_)=>

//          BlocProvider(

//            create:(_)=>

//            LoginBloc(

//              sl.get()

//            ),

//            child:

//            const LoginScreen(),

//          ),

//        );

//     //  case RouteNames.signup:

//     //    return MaterialPageRoute(

//     //      builder:(_)=>

//     //      const SignupScreen(),

//     //    );

//     //  case RouteNames.home:

//     //    return MaterialPageRoute(

//     //      builder:(_)=>

//     //      const HomeScreen(),

//     //    );

//      default:

//        return MaterialPageRoute(

//          builder:(_)=>

//          const Scaffold(

//            body:

//            Center(

//              child:

//              Text(
//              "Route not found"
//              ),

//            ),

//          ),

//        );

//    }

//  }

// }