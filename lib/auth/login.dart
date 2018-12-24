import 'package:flutter/material.dart';

class _LoginData {
  String email = '';
  String password = '';
}

class LoginPage extends StatelessWidget {

  final _LoginData _data = new _LoginData();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();

      print('Printing the login data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');
    }
  }

  @override
  Widget build(BuildContext context) {

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      onSaved: (String value) {
        this._data.email = value;
      },
      decoration: InputDecoration(
        hintText: 'Email',
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      onSaved: (String value) {
        this._data.password = value;
      },
      decoration: InputDecoration(
        hintText: 'Password',
      ),
    );

    final logo = Image.asset(
      'assets/tink-circle-512.png',
      fit: BoxFit.contain,
      height: 160.0,
    );

    final loginButton = new RaisedButton(
      color: Colors.lightBlueAccent,
      padding: EdgeInsets.symmetric(vertical: 12.0),
      onPressed: () {
        this.submit();
        Navigator.pushNamed(context, '/');
      },
      child: new Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );

    return new MaterialApp(
      title: 'Login Page',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'Login Page',
          ),
        ),
        body: new Center(
          child: new Form(
            key: this._formKey,
            child: new ListView(
              padding: EdgeInsets.only(top: 80.0, left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(height: 48.0),
                email,
                SizedBox(height: 16.0),
                password,
                SizedBox(height: 48.0),
                loginButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}