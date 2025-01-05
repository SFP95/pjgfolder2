import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey[800],
            size: 30,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded), // Icono a mostrar
            onPressed: () {
              Navigator.popAndPushNamed(context, '/home');
            },
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.grey.shade400,
          title: Text('Galery',style: TextStyle(fontSize: 30,color: Colors.grey[800])),
    ),
    body: GridView.count(
      padding: EdgeInsets.all(40),
      mainAxisSpacing: 30.3,
      crossAxisSpacing: 30.3,
      crossAxisCount: 3,
      children: List.generate(10, (index) {
        return Center(
          child: Image.network('https://via.placeholder.com/150'), // Aquí puedes reemplazar las URLs de las imágenes con las que obtengas de tu servicio de imágenes
        );
        }),
      ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.grey[800],
    onPressed: () {
      Navigator.pushNamed(context, '/newPhoto');
    },
    child: Icon(Icons.add,color: Colors.grey.shade400,),
    ),
    );
  }
}
