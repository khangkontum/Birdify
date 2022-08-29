import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final/bloc_observer.dart';
import 'package:mobile_final/data/repositories/auth_repository.dart';
import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
import 'package:mobile_final/presentation/config/configuration.dart';
import 'package:mobile_final/presentation/routers/router.dart';
import 'package:mobile_final/presentation/routers/router.gr.dart';
import 'package:mobile_final/presentation/style/style.dart';

// final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = AppBlocObserver();

  final AuthRepository authRepository = AuthRepository();

  runApp(
    MyApp(authRepository: authRepository),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.authRepository}) : super(key: key);

  final AuthRepository authRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppConfiguration(
      app: RepositoryProvider.value(
        value: authRepository,
        child: BlocProvider(
          create: (_) => AuthBloc(authRepository),
          child: AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  AppView({
    Key? key,
  }) : super(key: key);

  final _appRouter = myAppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      title: 'Final Mobile',
      theme: themeData,
    );
  }
}
