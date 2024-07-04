import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/data/user.dart';
import 'package:my_flutter_app/pages/age.dart';
import 'package:my_flutter_app/pages/back.dart';
import 'package:my_flutter_app/pages/child_page.dart';
import 'package:my_flutter_app/pages/home_page.dart';
import 'package:my_flutter_app/pages/login.dart';
import 'package:my_flutter_app/pages/profile_page.dart';
import 'package:my_flutter_app/pages/user_page.dart';
import 'package:my_flutter_app/router/route_names.dart';

class RouterClass {
  final router = GoRouter(
    errorPageBuilder: (context, state) {
      return const MaterialPage<dynamic>(
        child: Scaffold(
          body: Center(
            child: Text("This page is not found"),
          ),
        ),
      );
    },
    //redirect to login page if user is not loged in
    // redirect: (context, state) {
    //   bool isUserLoggedIn = UserData.isUserValid;
    //   if (isUserLoggedIn) {
    //     return '/';
    //   } else {
    //     return '/login';
    //   }
    // },
    initialLocation: '/',
    routes: [
      //Home Page
      GoRoute(
        name: 'home',
        path: "/",
        builder: (context, state) {
          return const HomePage();
        },
      ),

      //profile Page
      GoRoute(
        name: RouteNamesClass.profile,
        path: "/profile",
        builder: (context, state) {
          return const ProfilePage();
        },
        routes: [
          GoRoute(
            name: "Child",
            path: "child",
            builder: (context, state) {
              return ChildPage();
            },
          )
        ],
      ),
      //User Page data pass with extra
      // GoRoute(
      //   path: "/user",
      //   builder: (context, state) {
      //     final name = (state.extra as Map<String, dynamic>)['name'] as String;
      //     final age = (state.extra as Map<String, dynamic>)['age'] as int;

      //     return UserPage(
      //       userName: name,
      //       userAge: age,
      //     );
      //   },
      // ),

      //data pass as path parameter
      GoRoute(
        name: 'user',
        path: '/user/:name',
        builder: (context, state) {
          return UserPage(
            userName: state.pathParameters['name']!,
          );
        },
      ),

      GoRoute(
        path: "/age",
        name: RouteNamesClass.age,
        builder: (context, state) {
          final int age = state.uri.queryParameters['age'] == null
              ? 0
              : int.parse(state.uri.queryParameters['age']!);

          return Age(age: age);
        },
      ),
      //loginPage
      GoRoute(
        path: "/login",
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: "/back",
        builder: (context, state) {
          return const backPage();
        },
      ),
    ],
  );
}
