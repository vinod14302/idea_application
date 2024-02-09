import 'package:flutter/material.dart';

void main() {
  runApp(Pview());
}

class Pview extends StatefulWidget {
  @override
  _SimpleFormState createState() => _SimpleFormState();
}

class _SimpleFormState extends State<Pview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Increase Platform Charge View'),
      ),
      body: MyTable(),
    );
  }
}

class MyTable extends StatefulWidget {
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  List<Map<String, dynamic>> data = [
    {
      'location': 'ACND',
      'location_name': 'AAAA',
      'division': 'LKO',
      'startDate': '2022-01-01',
      'endDate': '2022-01-31',
      'amount': 10,
      'reason': 'Increase',
      'approved_by': 'Vinod',
      'modified_by': 'UTS',
      'last_modified': '2022-01-15',
    },
    {
      'location': 'AMB',
      'location_name': 'New York',
      'division': 'Male',
      'startDate': '2022-01-01',
      'endDate': '2022-01-31',
      'amount': 1000,
      'reason': 'Increase',
      'approved_by': 'John Doe',
      'modified_by': 'Jane Doe',
      'last_modified': '2022-01-15',
    },
    // Add more data as needed
  ];

  List<Map<String, dynamic>> filteredData = [];

  TextEditingController locidController = TextEditingController();
  TextEditingController diivisionController = TextEditingController();
  TextEditingController validityController = TextEditingController();
  TextEditingController sdateController = TextEditingController();
  TextEditingController edateController = TextEditingController();

  bool isDataInput = false;

  @override
  void initState() {
    super.initState();
    filteredData = List.from(data);
  }

  void filterData() {
    setState(() {
      filteredData = data.where((item) {
        return item['location']
                .toLowerCase()
                .contains(locidController.text.toLowerCase()) &&
            item['division']
                .toLowerCase()
                .contains(diivisionController.text.toLowerCase()) &&
            item['startDate']
                .toLowerCase()
                .contains(validityController.text.toLowerCase()) &&
            item['startDate']
                .toLowerCase()
                .contains(sdateController.text.toLowerCase()) &&
            item['endDate']
                .toLowerCase()
                .contains(edateController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green], // Adjust colors as needed
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: locidController,
                      onChanged: (value) {
                        setState(() {
                          isDataInput = value.isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Location Code',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: isDataInput ? Colors.blue : Colors.white,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: diivisionController,
                      onChanged: (value) {
                        setState(() {
                          isDataInput = value.isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Division',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: isDataInput ? Colors.blue : Colors.white,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: validityController,
                      onChanged: (value) {
                        setState(() {
                          isDataInput = value.isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Validity Type',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: isDataInput ? Colors.blue : Colors.white,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: sdateController,
                      onChanged: (value) {
                        setState(() {
                          isDataInput = value.isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Start Date',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: isDataInput ? Colors.blue : Colors.white,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: edateController,
                      onChanged: (value) {
                        setState(() {
                          isDataInput = value.isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'End Date',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: isDataInput ? Colors.blue : Colors.white,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    height: 48.0, // Adjust height as needed
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: filterData,
                      child: Text(
                        'Filter',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          child: CustomPaint(
            painter: DashedBorderPainter(
              color: Colors.grey,
              strokeWidth: 1.0,
              dashWidth: 4.0,
              gapWidth: 4.0,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Location')),
                  DataColumn(label: Text('Location Name')),
                  DataColumn(label: Text('Division')),
                  DataColumn(label: Text('Start Date')),
                  DataColumn(label: Text('End Date')),
                  DataColumn(label: Text('Amount')),
                  DataColumn(label: Text('Reason')),
                  DataColumn(label: Text('Approved by')),
                  DataColumn(label: Text('Modified by')),
                  DataColumn(label: Text('Last Modified')),
                ],
                rows: filteredData.map((item) {
                  return DataRow(
                    cells: [
                      DataCell(Text(item['location'])),
                      DataCell(Text(item['location_name'])),
                      DataCell(Text(item['division'])),
                      DataCell(Text(item['startDate'])),
                      DataCell(Text(item['endDate'])),
                      DataCell(Text(item['amount'].toString())),
                      DataCell(Text(item['reason'])),
                      DataCell(Text(item['approved_by'])),
                      DataCell(Text(item['modified_by'])),
                      DataCell(Text(item['last_modified'])),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double gapWidth;
  final BorderRadius borderRadius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.gapWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
        bottomLeft: borderRadius.bottomLeft,
        bottomRight: borderRadius.bottomRight,
      ));

    double currentX = 0.0;
    while (currentX < size.width) {
      path.moveTo(currentX, 0.0);
      path.lineTo(currentX + dashWidth, 0.0);
      currentX += dashWidth + gapWidth;
    }

    double currentY = 0.0;
    while (currentY < size.height) {
      path.moveTo(0.0, currentY);
      path.lineTo(0.0, currentY + dashWidth);
      currentY += dashWidth + gapWidth;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
