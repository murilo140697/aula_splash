import 'package:aula_splash/components/login/custom_login_button_component.dart';
import 'package:aula_splash/controllers/login_controller.dart';
import 'package:aula_splash/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.people,
                size: MediaQuery.of(context).size.height * 0.2,
              ),
              CustomTextfieldWidget(
                  onChanged: _controller.setLogin, label: 'Login'),
              CustomTextfieldWidget(
                onChanged: _controller.setPass,
                label: 'Senha',
                obscureText: true,
              ),
              SizedBox(height: 15),
              CustomLoginButtonComponent(
                loginController: _controller,
              ),
            ]),
      ),
    );
  }
}
