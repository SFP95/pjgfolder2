import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,  this.title="", required this.icon, required this.onPress, required this.endIcon, this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(

        width: 40,height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey[900]
        ),
        child: Icon(icon,color: Colors.white54),
        //Icons.settings,color: Colors.white38,size: 30
      ),
      title: Text(title,style: TextStyle(color: textColor)),
      //      title: Text("Settings",style: TextStyle(color: Colors.white)),
      trailing: endIcon? Container(
          width: 30,height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey[800]
          ),
          child: IconButton(onPressed: () => Navigator.of(context),
              icon: Icon( Icons.arrow_forward_ios,size: 18,color: Colors.grey[600],))) : null,
    );
  }
}