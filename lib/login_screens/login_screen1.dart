import 'package:flutter/material.dart';
import 'responsive_helper.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              if (constraints.maxWidth >= 600) // Only show the image on larger screens
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'SAPDOS',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.getFontSize(context, 44), // Adjust font size based on screen width
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF13235A),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 100)), // Adjust spacing based on screen width
                        Text(
                          'Login to your sapdos account or create one now.',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.getFontSize(context, 18),
                            color: Color(0xFF13235A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                        Center(
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/screen3');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF13235A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('LOGIN'),
                            ),
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                        Center(
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/screen2');
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Color(0xFF13235A),
                                backgroundColor: Colors.white,
                                side: BorderSide(color: Color(0xFF13235A)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('SIGN-UP'),
                            ),
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 10)),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/screen2');
                            },
                            child: Text(
                              'Proceed as a Guest',
                              style: TextStyle(
                                color: Color(0xFF13235A),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
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
