import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            child: Container(
              margin: EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'username',
                    ),
                    controller: _usernameController,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'password',
                    ),
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  Padding(
                    padding: EdgeInsets.all(70.0),
                  ),
                  RaisedButton(
                    onPressed:
                        state is! LoginLoading ? _onLoginButtonPressed : null,
                    child: Text('Login'),
                  ),
                  Container(
                    child: state is LoginLoading
                        ? CircularProgressIndicator()
                        : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
