import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/config/di/injection.dart';
import 'package:mediezy_task/core/config/router/app_router.dart';
import 'package:mediezy_task/core/services/storage_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await sl<StorageService>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),

      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(fontFamily: 'Inter'),

          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
