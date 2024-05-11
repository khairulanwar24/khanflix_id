import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khanflix_id/domain/entities/user.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.user});
// main page akan dipanggil ketika berhasil login, so berhasil masuk ke main_page, berikan objectnya.
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Center(
        child: Text(
          user.toString(),
        ),
      ),
    );
  }
}
