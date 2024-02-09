import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:responsive_admin_dashboard/screens/components/drawer_menu.dart';

void main() {
  runApp(MaterialApp(
    home: IncreasePlatform(),
  ));
}

class IncreasePlatform extends StatefulWidget {
  @override
  _SimpleFormState createState() => _SimpleFormState();
}

class _SimpleFormState extends State<IncreasePlatform> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool showDivisionFields = false;
  bool showLocationFields = false;
  TextEditingController _typeAheadController = TextEditingController();
  TextEditingController _fileController =
      TextEditingController(); // Controller for file path

  List<String> divisionCodes = ['Division Code 1', 'Division Code 2'];
  List<String> locationCodes = ['Location Code 1', 'Location Code 2'];

  List<String> selectedCodes = []; // To store the selected codes
  List<File> _files = [];

  // Function to get the directory path for saving files
  Future<String> getSaveDirectory() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String savePath = '${appDocumentsDirectory.path}/flutterProject';
    return savePath;
  }

// Function to save files on web platform

  Future<void> saveFilesWeb(List<File> files) async {
    for (int i = 0; i < files.length; i++) {
      ByteData bytes = await rootBundle.load(files[i].path);
      Uint8List content = bytes.buffer.asUint8List();
      String fileName = 'file_$i.txt'; // You can customize the file name here
      final blob = html.Blob([content]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", fileName)
        ..click();
      html.Url.revokeObjectUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Increase Platform Charges'),
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
                        name: 'startDate',
                        inputType: InputType.date,
                        decoration:
                            InputDecoration(labelText: 'Select Start Date'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        name: 'endDate',
                        inputType: InputType.date,
                        decoration:
                            InputDecoration(labelText: 'Select End Date'),
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
                FormBuilderTextField(
                  name: 'remarks',
                  decoration: InputDecoration(labelText: 'Reason'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _fileController,
                        decoration:
                            InputDecoration(labelText: 'Upload File Path'),
                        readOnly: true,
                      ),
                    ),
                    SizedBox(width: 16),
                    // File upload button
                    ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          setState(() {
                            _files = result.files
                                .map((platformFile) =>
                                    File(platformFile.path ?? 'upload a file'))
                                .toList();

                            _fileController.text = _files.isNotEmpty
                                ? _getFilesDisplayString()
                                : '';
                          });

                          if (kIsWeb) {
                            await saveFilesWeb(_files); // Save files on web
                          } else {
                            await saveFilesWeb(
                                _files); // Save files on other platforms
                          }
                        }
                      },
                      child: Text('Upload File'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        selectedCodes.clear();
                        _typeAheadController.clear();
                        _fileController.clear(); // Clear file path controller
                        setState(() {
                          _files.clear(); // Clear selected files
                        });
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
                          print(
                              'Selected Files: ${_files.map((file) => file.path).toList()}');

                          _showSuccessDialog(); // Show success dialog
                        } else {
                          _showErrorDialog(); // Show error dialog
                        }
                      },
                      icon: Icon(Icons.verified_user),
                      label: Text('Verify Increase'),
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

  String _getFilesDisplayString() {
    return _files.map((file) => file.path).join(', ');
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
