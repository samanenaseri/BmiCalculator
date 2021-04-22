import 'package:bmi/ui/constant.dart';
import 'package:flutter/material.dart';


class BoxIcons extends StatefulWidget {
 final String label;
 final IconData icon;
 final double size;
 final double fontsize;

  const BoxIcons({@required this.label,@required this.icon,this.size,this.fontsize});
  @override
  _BoxIconsState createState() => _BoxIconsState();
}

class _BoxIconsState extends State<BoxIcons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Text(widget.label,
         style: TextStyle(
           fontSize: widget.fontsize,
           fontWeight: FontWeight.bold,
           color:Color(0xffffffff),
         ),
         ),
        Icon(widget.icon,
        size: widget.size,
          color: Color(0xb9ffffff),
        )
      ],
    );
  }
}
