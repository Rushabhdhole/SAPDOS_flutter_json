// lib/doctor_screen/doctor_screen2.dart

import 'package:flutter/material.dart';

class DoctorScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue, 
                    ),
                    child: Icon(
                      Icons.account_circle,
                      size: 80, 
                      color: Colors.white, // Color of the icon
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Patient Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Patient age',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Issue description',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'After the entering data are obtained, the next step is to obtain a record of the patient history.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildAccordion('Patient History', [
                _buildAccordionItem('Blood report', () {}),
                _buildAccordionItem('CT Scan report', () {}),
              ]),
              SizedBox(height: 20),
              _buildAccordion('Prescription', [
                _buildAccordionItem('26 March 2022', () {}),
                _buildAccordionItem('13 April 2022', () {}),
                _buildAccordionItem('Add new', () {}, isAddNew: true),
              ]),
              SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccordion(String title, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF13235A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        childrenPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        children: children,
      ),
    );
  }

  Widget _buildAccordionItem(String title, VoidCallback onPressed, {bool isAddNew = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          title: Text(title),
          trailing: IconButton(
            icon: Icon(isAddNew ? Icons.add : Icons.visibility),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
