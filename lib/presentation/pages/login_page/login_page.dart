import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khanflix_id/data/dummies/dummy_authentication.dart';
import 'package:khanflix_id/data/dummies/dummy_user_repository.dart';
import 'package:khanflix_id/domain/usecases/login/login.dart';
import 'package:khanflix_id/presentation/pages/main_page/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // menjalankan usercase/login
              Login login = Login(
                authentication: DummyAuthentication(),
                userRepository: DummyUserRepository(),
              );

              login(LoginParams(email: 'email', password: 'password')).then(
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
