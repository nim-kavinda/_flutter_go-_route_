import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/router/route_names.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Home Page",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(RouteNamesClass.profile);
            },
            child: const Text("Go to Profile Page"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/profile/child");
            },
            child: const Text("Go to Child Page "),
          ),
          ElevatedButton(
            onPressed: () {
              // GoRouter.of(context).go("/user", extra: {
              //   'name': 'Nimesh',
              //   'age': 24,
              // });
              String names = "Nimesh Kavinda";
              GoRouter.of(context).go("/user/$names");
            },
            child: const Text("Go to User Page "),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(
                RouteNamesClass.age,
                queryParameters: {'age': "24"},
              );
            },
            child: const Text("Go to Age Page "),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push("/back");
            },
            child: const Text("Go to Back Page"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(RouteNamesClass.products);
            },
            child: const Text("Go to All Product Page"),
          )
        ],
      ),
    );
  }
}
