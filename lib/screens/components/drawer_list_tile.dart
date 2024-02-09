import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerListTile extends StatefulWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.tap,
    this.subItems = const [], // Add a list of sub-items
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback tap;
  final List<DrawerListTile> subItems;

  @override
  _DrawerListTileState createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Column(
        children: [
          MouseRegion(
            onEnter: (_) => _handleHover(true),
            onExit: (_) => _handleHover(false),
            child: InkWell(
              onTap: widget.tap,
              child: Container(
                width: 200,
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: isHovered
                      ? Color.fromARGB(255, 64, 67, 254)
                      : Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      widget.svgSrc,
                      color: isHovered ? Colors.black : Colors.white,
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Sub-menu items
          if (widget.subItems.isNotEmpty && isHovered)
            Column(
              children: widget.subItems,
            ),
        ],
      ),
    );
  }

  void _handleHover(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
