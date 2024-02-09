import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

void main() {
  runApp(MaterialApp(
    home: AddStation(),
  ));
}

class AddStation extends StatefulWidget {
  @override
  _AddStationForm createState() => _AddStationForm();
}

class _AddStationForm extends State<AddStation> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool showDivisionFields = false;
  bool showLocationFields = false;
  TextEditingController _typeAheadController = TextEditingController();

  List<String> divisionCodes = ['Division Code 1', 'Division Code 2'];
  List<String> locationCodes = ['Location Code 1', 'Location Code 2'];

  List<String> selectedCodes = []; // To store the selected codes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Enable Station'),
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
                        name: 'appauth',
                        decoration:
                            InputDecoration(labelText: 'Approval Authority'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        name: 'appDate',
                        inputType: InputType.date,
                        decoration:
                            InputDecoration(labelText: 'Select Approval Date'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderRadioGroup(
                        name: 'radioGroup',
                        decoration: InputDecoration(labelText: 'Select Option'),
                        options: [
                          FormBuilderFieldOption(
                            value: 'division_wise',
                            child: Text('Division Wise'),
                          ),
                          FormBuilderFieldOption(
                            value: 'location_wise',
                            child: Text('Location Wise'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            showDivisionFields = value == 'division_wise';
                            showLocationFields = value == 'location_wise';

                            // Clear selected codes when switching options
                            selectedCodes.clear();
                            _typeAheadController.clear();
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    if (showDivisionFields || showLocationFields)
                      Expanded(
                        child: TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: _typeAheadController,
                            decoration: InputDecoration(
                              labelText: showDivisionFields
                                  ? 'Select Division Code'
                                  : 'Select Location Code',
                            ),
                          ),
                          suggestionsCallback: (pattern) {
                            return showDivisionFields
                                ? divisionCodes.where(
                                    (code) => code
                                        .toLowerCase()
                                        .contains(pattern.toLowerCase()),
                                  )
                                : locationCodes.where(
                                    (code) => code
                                        .toLowerCase()
                                        .contains(pattern.toLowerCase()),
                                  );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion?.toString() ?? ''),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            if (!selectedCodes.contains(suggestion)) {
                              setState(() {
                                selectedCodes.add(suggestion?.toString() ?? '');
                                _typeAheadController.clear();
                              });
                            } else {
                              // Show snackbar if the code is already selected
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Already selected.'),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        name: 'validfrom',
                        inputType: InputType.date,
                        decoration: InputDecoration(labelText: 'Valid From'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        name: 'validupto',
                        inputType: InputType.date,
                        decoration: InputDecoration(labelText: 'Valid Upto'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'amount',
                        decoration: InputDecoration(labelText: 'Charges'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'englishname',
                      decoration:
                          InputDecoration(labelText: 'Station English Name'),
                    ),
                  ),
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'hindiname',
                      decoration: InputDecoration(labelText: 'Hindi Name'),
                    ),
                  ),
                ]),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        selectedCodes.clear();
                        _typeAheadController.clear();
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
                          print('Selected Codes: $selectedCodes');
                          _showSuccessDialog(); // Show success dialog
                        } else {
                          _showErrorDialog(); // Show error dialog
                        }
                      },
                      icon: Icon(Icons.verified_user),
                      label: Text('Submit'),
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
