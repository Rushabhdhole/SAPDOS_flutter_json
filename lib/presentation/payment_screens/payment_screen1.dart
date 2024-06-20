import 'package:flutter/material.dart';
import '../login_screens/responsive_helper.dart';
import 'payment_screen2.dart';

class PaymentScreen1 extends StatefulWidget {
  @override
  _PaymentScreen1State createState() => _PaymentScreen1State();
}

class _PaymentScreen1State extends State<PaymentScreen1> {
  String? _selectedPaymentMethod;
  final _formKey = GlobalKey<FormState>();
  bool _isFormValid = false;

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  void _validateForm() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

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
                        image: AssetImage('assets/images/rscreen1.png'), // Update with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Expanded(
                flex: 1,
                child: Center(
                  child: SingleChildScrollView(
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
                      child: Form(
                        key: _formKey,
                        onChanged: _validateForm,
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
                            SizedBox(height: ResponsiveHelper.getSpacing(context, 50)), // Adjust spacing based on screen width
                            Text(
                              'Booking Appointment',
                              style: TextStyle(
                                fontSize: ResponsiveHelper.getFontSize(context, 24),
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF13235A),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                            Text(
                              'Payment Method',
                              style: TextStyle(
                                fontSize: ResponsiveHelper.getFontSize(context, 18),
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF13235A),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: ResponsiveHelper.getSpacing(context, 10)),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              hint: Text('Select'),
                              items: <String>['Credit Card', 'Debit Card', 'UPI'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedPaymentMethod = value;
                                });
                              },
                            ),
                            if (_selectedPaymentMethod != null) ...[
                              SizedBox(height: ResponsiveHelper.getSpacing(context, 5)),
                              Text(
                                'Select the mode of payment you prefer',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                              Text(
                                'Enter your details below',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.getFontSize(context, 18),
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF13235A),
                                ),
                              ),
                              SizedBox(height: ResponsiveHelper.getSpacing(context, 10)),
                              TextFormField(
                                controller: _cardNumberController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Card Number',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter card number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: ResponsiveHelper.getSpacing(context, 10)),
                              TextFormField(
                                controller: _cardHolderController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Card Holder',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter card holder name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: ResponsiveHelper.getSpacing(context, 10)),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _expiryDateController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'MM/YY',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter expiry date';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: ResponsiveHelper.getSpacing(context, 10)),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _cvvController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'CVV',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter CVV';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            if (_isFormValid)
                              SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                            if (_isFormValid)
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _showConfirmationDialog(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Color(0xFF13235A),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text('Pay now'),
                                  ),
                                ),
                              ),
                          ],
                        ),
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

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            color: Color(0xFF13235A), // Set the background color to blue
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle_outline, color: Colors.white, size: 60),
                SizedBox(height: 16),
                Text(
                  'Your booking is confirmed',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xFF13235A), backgroundColor: Colors.white, // Set button text color to blue
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Okay'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
