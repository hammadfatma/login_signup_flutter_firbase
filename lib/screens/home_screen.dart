import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<AuthProviderApp>(context,listen: false).signOut(context);
          },
          child: Text('Log Out'),
        ),
      ),
    );
  }
}
