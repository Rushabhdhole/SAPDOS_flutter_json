import 'package:flutter/material.dart';
import 'responsive_helper.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool _rememberMe = false;
  bool _passwordVisible = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid(String email) {
    return email.contains('@gmail.com');
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              if (!ResponsiveHelper.isMobile(context)) // Only show the image on larger screens
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/rscreen1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'SAPDOS',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.getFontSize(context, 24), // Adjust font size
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ResponsiveHelper.getFontSize(context, 18), // Adjust font size
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Enter existing account’s details',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.getFontSize(context, 13), // Adjust font size
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                          Center(
                            child: SizedBox(
                              width: ResponsiveHelper.isMobile(context) ? 200 : 300, // Adjust width based on screen size
                              child: TextField(
                                controller: _emailController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email address/ Phone No.',
                                  prefixIcon: Icon(Icons.email), // Add email icon
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: ResponsiveHelper.getSpacing(context, 10)),
                          Center(
                            child: SizedBox(
                              width: ResponsiveHelper.isMobile(context) ? 200 : 300, // Adjust width based on screen size
                              child: TextField(
                                controller: _passwordController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock), // Add lock icon
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: !_passwordVisible,
                              ),
                            ),
                          ),
                          SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                              ),
                              Text('Remember me'),
                              TextButton(onPressed: () {}, child: Text('Forgot Password?')),
                            ],
                          ),
                          SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                          Center(
                            child: SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: _isEmailValid(_emailController.text) && _isPasswordValid(_passwordController.text)
                                    ? () {
                                        Navigator.pushNamed(context, '/doctor_screen/doctor_screen1.dart');
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFF13235A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('LOGIN as Doctor'),
                              ),
                            ),
                          ),
                          SizedBox(height: ResponsiveHelper.getSpacing(context, 10)),
                          Center(
                            child: SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: _isEmailValid(_emailController.text) && _isPasswordValid(_passwordController.text)
                                    ? () {
                                        Navigator.pushNamed(context, '/patient_screens/patient_screen1.dart');
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFF13235A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('LOGIN as Patient'),
                              ),
                            ),
                          ),
                          SizedBox(height: ResponsiveHelper.getSpacing(context, 10)),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/screen2');
                              },
                              child: Text('Not on Sapdos? Sign-up'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Screen3(),
  ));
}
