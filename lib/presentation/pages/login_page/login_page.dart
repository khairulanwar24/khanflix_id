import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khanflix_id/data/firebase/firebase_authentication.dart';
import 'package:khanflix_id/data/firebase/firebase_user_repository.dart';
import 'package:khanflix_id/domain/usecases/login/login.dart';
import 'package:khanflix_id/presentation/pages/main_page/main_page.dart';
import 'package:khanflix_id/presentation/providers/usecases/login_provider.dart';

// untuk mengakses provider disuatu widget maka state tersebut harus dibungkus dengan consumerwidget
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // menjalankan usercase/login
              Login login = ref.watch(loginProvider);

              login(LoginParams(email: 'anwar@gmail.com', password: '123456'))
                  .then(
                (result) {
                  if (result.isSuccess) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            MainPage(user: result.resultValue!),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result.errorMessage!),
                      ),
                    );
                  }
                },
              );
            },
            child: Text('login')),
      ),
    );
  }
}
