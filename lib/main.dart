import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:purchase_app/main.dart';
import 'package:sales_app/main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Main App Drawer';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final routerConfig = GoRouter(routes: [
    GoRoute(
      path: '/',
      routes: [
        GoRoute(
          path: 'sales',
          builder: (context, state) => const SalesApp(),
        ),
        GoRoute(
          path: 'purchase',
          builder: (context, state) => const PurchaseApp(),
        ),
      ],
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text("Main App")),
        body: const Center(
          child: Text("Main App Content"),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  GoRouter.of(context).go('/');
                },
              ),
              ListTile(
                title: const Text('Sales'),
                onTap: () {
                  GoRouter.of(context).go('/sales');
                },
              ),
              ListTile(
                title: const Text('Purchase'),
                onTap: () {
                  GoRouter.of(context).go('/purchase');
                },
              ),
            ],
          ),
        ),
      ),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
    );
  }
}
