import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:mobile_final/bloc_observer.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';
import 'package:mobile_final/data/repositories/auth_repository.dart';
import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
import 'package:mobile_final/logic/club/cubit/create_club_cubit.dart';
import 'package:mobile_final/logic/meetup/create-meetup-cubit/create_meetup_cubit.dart';
import 'package:mobile_final/presentation/config/configuration.dart';
import 'package:mobile_final/presentation/routers/auth_router.dart';
import 'package:mobile_final/presentation/style/style.dart';

// final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = AppBlocObserver();

  final AuthRepository authRepository = AuthRepository();

  runApp(
    MyApp(
      authRepository: authRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.authRepository,
  }) : super(key: key);

  final AuthRepository authRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppConfiguration(
      app: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: authRepository,
          ),
          RepositoryProvider(
            create: (context) => ApiRepository(
              authRepository: authRepository,
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(authRepository),
            ),
            BlocProvider(
              create: (context) =>
                  CreateMeetupCubit(context.read<ApiRepository>()),
            ),
          ],
          child: const AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Mobile',
      theme: themeData,
      home: const AuthGate(),
    );
  }
}
