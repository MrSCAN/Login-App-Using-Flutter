import 'package:flutter/material.dart';
import 'package:loginapp/settings.dart';
import 'package:loginapp/login.dart';


void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _title = "Please Login";
  Widget _screen;
  login _login;
  settings _settings;
  bool _authenticated;

  _MyAppState(){
    _login = new login(onSubmit: (){onSubmit();});
    _settings = new settings();
    _screen = _login;
    _authenticated = false;
  }
  void onSubmit(){
    print('Login with: '+_login.username+ ' '+_login.password);
    if(_login.username =='user' && _login.password == '1234'){
      _setAuthenticated(true);

    }
  }

  void _goHome(){
     print("go home");
     setState(() {
       if(_authenticated == true){
         _screen = _settings;
         _title = 'Welcome';
       }
       else{
         _screen = _login;
         _title = 'please login';
       }
     });
  }

  void _logout(){
    print("wait loggging out...");
    _screen = _login;
    _setAuthenticated(false);
  }
  void _setAuthenticated(bool auth){
    setState(() {
      if(auth == true){
        _screen = _settings;
        _title = 'Welcome';
        _authenticated = true;
      }
      else{
        _screen = _login;
        _title = 'please login';
        _authenticated = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: (){
              _goHome();
            }),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: (){
              _logout();
            }),
          ],
        ),
        body: _screen,
      ),
    );
  }
}
