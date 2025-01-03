
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/ProfileMenuWidget.dart';

class ProfileUserLog extends StatefulWidget{
  @override
  State<ProfileUserLog> createState() => _ProfileUserLogState();
}

class _ProfileUserLogState extends State<ProfileUserLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded), // Icono a mostrar
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/perfil.png') ,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Divider(height: 30,color: Colors.grey[400]),
                  Text("NOMBRE DE USUARIO (alias)",style: TextStyle(fontSize: 20,color: Colors.grey[800])),
                  Divider(height: 30,color: Colors.grey[400]),
                  Text("correo@gmail.com",style: TextStyle(fontSize: 17,color: Colors.grey[800])),
                  Divider(height: 30,color: Colors.grey[400]),
                  Text("Birthday: 00 - 00 - 0000",style: TextStyle(fontSize: 17,color: Colors.grey[800])),
                  Divider(height: 30,color: Colors.grey[400]),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 0),
              child: Column(
                children: [
                  Divider(height: 50,color: Colors.grey[800]),
                  ProfileMenuWidget(
                    icon: Icons.settings,
                    title: "Ajustes" ,
                    textColor:Colors.grey[400] ,
                    endIcon: false,
                    onPress: () {  },),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(
                    icon: Icons.info,
                    title: "Información" ,
                    textColor:Colors.grey[400] ,
                    endIcon: false,
                    onPress: () {  },),
                  const SizedBox(height: 10),
                  Divider(color: Colors.grey[500],endIndent: 0,indent: 0),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(
                    icon: Icons.login,
                    title: "Sign in" ,
                    textColor:Colors.grey[400],
                    endIcon: true,
                    onPress: () { Navigator.of(context).popAndPushNamed('/login'); },),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(
                    icon: Icons.logout,
                    title: "Log out" ,
                    textColor:Colors.grey[400],
                    endIcon: true,
                    onPress: () { Navigator.of(context).popAndPushNamed('/'); },),
                  Divider(height: 50,color: Colors.grey[800]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}