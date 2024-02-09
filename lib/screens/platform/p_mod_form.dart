import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:responsive_admin_dashboard/screens/components/drawer_menu.dart';

void main() {
  runApp(MaterialApp(
    home: ModifyPlatform(),
  ));
}

class ModifyPlatform extends StatefulWidget {
  @override
  _SimpleFormState createState() => _SimpleFormState();
}

class _SimpleFormState extends State<ModifyPlatform> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    DrawerMenu();
    return Scaffold(
      appBar: AppBar(
        title: Text('Modify Platform Charges'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/backgroud.png"), // Replace with your image asset
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.fromARGB(106, 100, 62, 238)
                  .withOpacity(0.4), // Adjust the opacity as needed
              BlendMode.darken,
            ),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xFF36CBDF), // Adjusted color format
              Color(0xFFD245F5), // Adjusted color format
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'loc_code',
                        decoration: InputDecoration(labelText: 'Location Code'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        name: 'sdate',
                        inputType: InputType.date,
                        decoration: InputDecoration(labelText: 'Start Date'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        name: 'edate',
                        inputType: InputType.date,
                        decoration: InputDecoration(labelText: 'End Date'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'amount',
                        decoration: InputDecoration(labelText: 'Amount'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'remarks',
                  decoration: InputDecoration(labelText: 'Reason'),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'modify_remark',
                        decoration:
                            InputDecoration(labelText: 'Modification Reason'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'appauth',
                        decoration:
                            InputDecoration(labelText: 'Approval Authority'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        name: 'appdate',
                        inputType: InputType.date,
                        decoration: InputDecoration(labelText: 'Approval Date'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      icon: Icon(Icons.refresh),
                      label: Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: Colors.red,
                        onPrimary: Colors.white,
                        padding: EdgeInsets.all(16.0),
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          var formData = _formKey.currentState!.value;
                          print(formData);
                          _showSuccessDialog(); // Show success dialog
                        } else {
                          _showErrorDialog(); // Show error dialog
                        }
                      },
                      icon: Icon(Icons.verified_user),
                      label: Text('Update Platform Charge'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        padding: EdgeInsets.all(16.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to show success dialog
  Future<void> _showSuccessDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Form submitted successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to show error dialog
  Future<void> _showErrorDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Form submission failed. Please check your input.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
