
import 'package:chatfinal/cubit/cubit.dart';
import 'package:chatfinal/cubit/state.dart';
import 'package:chatfinal/screens/chat_screen.dart';
import 'package:chatfinal/screens/constants.dart';
import 'package:chatfinal/screens/injection.dart';
import'package:chatfinal/screens/signin_screen.dart';
import 'package:chatfinal/screens/injection.dart' as di;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await di.init();

  userConst = FirebaseAuth.instance.currentUser;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  runApp(MyApp(
    user: userConst,
  ));
}

class MyApp extends StatelessWidget {
  User? user;

  MyApp({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<AppBloc>(),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Social Network',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.teal,
            ),
            home: user != null ? const SearchScreen() : const LoginScreen(),
          );
        },
      ),
    );
  }
}
