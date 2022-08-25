import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final/bloc_observer.dart';
import 'package:mobile_final/data/repositories/auth_repository.dart';
import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
import 'package:mobile_final/presentation/routers/auth_router.dart';
import 'package:mobile_final/presentation/style/style.dart';

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
    return RepositoryProvider.value(
        value: authRepository,
        child: BlocProvider(
          create: (_) => AuthBloc(authRepository),
          child: const AppView(),
        ));
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Mobile',
      theme: themeData,
      home: SafeArea(
        child: FlowBuilder<AuthStatus>(
          state: context.select((AuthBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppView,
        ),
      ),
    );
  }
}
