import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:mobile_final/bloc_observer.dart';
import 'package:mobile_final/data/repositories/auth_repository.dart';
import 'package:mobile_final/data/repositories/chat_repository.dart';
import 'package:mobile_final/data/repositories/meetup_repository.dart';
import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
import 'package:mobile_final/presentation/config/configuration.dart';
import 'package:mobile_final/presentation/routers/auth_router.dart';
import 'package:mobile_final/presentation/routers/router.dart';
import 'package:mobile_final/presentation/style/style.dart';

// final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = AppBlocObserver();

  final AuthRepository authRepository = AuthRepository();
  final ChatRepository chatRepository = ChatRepository();
  final MeetUpRepository meetUpRepository = MeetUpRepository();

  runApp(
    MyApp(
        authRepository: authRepository,
        chatRepository: chatRepository,
        meetUpRepository: meetUpRepository),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(
      {Key? key,
      required this.authRepository,
      required this.chatRepository,
      required this.meetUpRepository})
      : super(key: key);

  final AuthRepository authRepository;
  final ChatRepository chatRepository;
  final MeetUpRepository meetUpRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppConfiguration(
      app: RepositoryProvider.value(
        value: authRepository,
        child: BlocProvider(
          create: (_) => AuthBloc(authRepository),
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
