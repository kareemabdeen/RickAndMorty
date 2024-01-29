import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Global/depedency_injection.dart';
import 'app_router.dart';
import 'business_logic_layer/bloc/bloc_obserer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setupDependencyInjection();
  runApp(RickandMorty(
    appRouter: AppRouter(),
  ));
}

class RickandMorty extends StatelessWidget {
  final AppRouter appRouter;
  const RickandMorty({
    required this.appRouter,
    super.key,
  });

  //final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter
              .generateRoutes, // will be called immediatly when we use any push or pop om any screen on may app
        );
      },
    );
  }
}
