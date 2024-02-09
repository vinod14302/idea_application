import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class UtsStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4DA0B0), Color(0xFFD7C9B0)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: BoxWithPieChart(),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4CA1AF), Color(0xFFC4E0E5)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: BoxWithInputFields(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxWithPieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Station Data Zone Wise'),
        SizedBox(height: 16.0),
        Container(
          width: double.infinity,
          height: 200.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4DA0B0), Color(0xFFD7C9B0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(value: 30, color: Colors.red),
                PieChartSectionData(value: 20, color: Colors.green),
                PieChartSectionData(value: 50, color: Colors.blue),
                PieChartSectionData(value: 150, color: Colors.pink),
                PieChartSectionData(value: 250, color: Colors.lightBlue),
                PieChartSectionData(value: 350, color: Colors.grey),
                PieChartSectionData(value: 450, color: Colors.deepOrangeAccent),
                PieChartSectionData(value: 550, color: Colors.deepPurple),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BoxWithInputFields extends StatefulWidget {
  @override
  _BoxWithInputFieldsState createState() => _BoxWithInputFieldsState();
}

class _BoxWithInputFieldsState extends State<BoxWithInputFields> {
  String selectedMonth = 'January';
  String selectedYear = '2022';

  String zone = 'NR';
  String totalLocation = '779';
  String testLocation = '769';
  String finalLocation = '0';

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  List<String> years = [
    '2022', '2023', '2024', '2025', '2026', '2027',
    // Add more years as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Balance Sheet Statistics'),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4CA1AF), Color(0xFFC4E0E5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showDetailsModal(context, 'Zone', 'Location Name',
                            'Location Code', 'Division Code', 'Last Date');
                      },
                      child: Container(
                        height: 50.0,
                        child: DropdownButtonFormField<String>(
                          value: selectedMonth,
                          items: months.map((String month) {
                            return DropdownMenuItem<String>(
                              value: month,
                              child: Text(
                                month,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedMonth = value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Select Month',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showDetailsModal(
                            context,
                            'Total Location',
                            'Location Name',
                            'Location Code',
                            'Division Code',
                            'Last Date');
                      },
                      child: Container(
                        height: 50.0,
                        child: DropdownButtonFormField<String>(
                          value: selectedYear,
                          items: years.map((String year) {
                            return DropdownMenuItem<String>(
                              value: year,
                              child: Text(
                                year,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedYear = value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Select Year',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Divider(),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showDetailsModal(
                            context,
                            'Test Location',
                            'Location Name',
                            'Location Code',
                            'Division Code',
                            'Last Date');
                      },
                      child: Text(
                        'Zone: $zone',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showDetailsModal(
                            context,
                            'Final Location',
                            'Location Name',
                            'Location Code',
                            'Division Code',
                            'Last Date');
                      },
                      child: Text(
                        'TTL Location: $totalLocation',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text('Test Location: $testLocation'),
                  ),
                  Expanded(
                    child: Text('Final Location: $finalLocation'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showDetailsModal(BuildContext context, String title, String header1,
      String header2, String header3, String header4) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set this to true
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text(header1)),
                      DataColumn(label: Text(header2)),
                      DataColumn(label: Text(header3)),
                      DataColumn(label: Text(header4)),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Location1')),
                        DataCell(Text('Code1')),
                        DataCell(Text('Division1')),
                        DataCell(Text('LastDate1')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Location2')),
                        DataCell(Text('Code2')),
                        DataCell(Text('Division2')),
                        DataCell(Text('LastDate2')),
                      ]),
                      // Add more rows as needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  runApp(UtsStats());
}
