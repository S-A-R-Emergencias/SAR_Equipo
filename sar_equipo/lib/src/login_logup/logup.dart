import 'dart:async';
import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sar_equipo/Models/person_model.dart';
import 'package:sar_equipo/Models/personnel_model.dart';
import 'package:sar_equipo/constans.dart';
import 'package:sar_equipo/src/global/environment.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import 'package:sar_equipo/src/main_web_page.dart';
import 'package:sar_equipo/src/services/personnel_service.dart';

class Logup extends StatefulWidget {
  const Logup({Key? key, required this.titleName}) : super(key: key);

  final String titleName; //declared variable

  @override
  State<Logup> createState() => _LogupState();
}

class _LogupState extends State<Logup> {
  final Personnel personnel = Personnel();
  TextEditingController birthDateController= new TextEditingController();
  
  var grades = ['Administrativo','Medico','Bombero','Voluntario'];
  var roles = ['Administrador','Miembro'];
  String selectedGrade = 'Voluntario';
  String selectedRole = "Miembro";
  String seledtedDate = "2002-02-02";

  Future<http.Response> logup() async {
    personnel.grade = selectedGrade;
    switch (selectedRole) {
      case 'Miembro':
        personnel.role = "1";
      break;
      case 'Administrador':
        personnel.role = "2";
      break;
      default: personnel.role = "1";
    }
    PersonnelService service = PersonnelService();
    final response = service.postPerson(personnel);
    return (response);
  }
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _height_container = _height * 0.9;
    double _width_container = _width * 0.9;
    double espacio = 15.0;
    if(Environment.usersession == null){
      return Login(titleName: 'Log In');
    }else{
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 143, 77, 16),
      child: Center(
        child: Container(
          width: (_width_container),
          height: (_height_container),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(40),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                      },
                    ),
              Container(
                width: _height * 0.53,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'CREAR CUENTA S.A.R.',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    //Email InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: InputBorder.none,
                              icon: Icon(Icons.email),
                            ),
                            onChanged: (value) {
                              personnel.email = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //Email End

                    SizedBox(
                      height: espacio,
                    ),

                    //Name InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Nombre',
                              border: InputBorder.none,
                              icon: Icon(Icons.person),
                            ),
                            onChanged: (value) {
                              personnel.name = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //Name End

                    SizedBox(
                      height: espacio,
                    ),

                    //LastName InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Primer Apellido',
                              border: InputBorder.none,
                              icon: Icon(Icons.person),
                            ),
                            onChanged: (value) {
                              personnel.lastName = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //LastName End

                    SizedBox(
                      height: espacio,
                    ),

                    //SecondLastName InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Segundo Apellido',
                              border: InputBorder.none,
                              icon: Icon(Icons.person),
                            ),
                            onChanged: (value) {
                              personnel.secondLastName = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //SecondLastName End

                    SizedBox(
                      height: espacio,
                    ),

                    //BirthDate InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            readOnly: true,
                            onTap:() async {
                              DateTime? pickedDate;
                              pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());
                              
                              if(pickedDate!= null){
                                try{
                                  personnel.birthDate = pickedDate;
                                  
                                  birthDateController.text = pickedDate.year.toString() + "-" + pickedDate.month.toString() + "-" + pickedDate.day.toString();
                                }catch (e) {

                                }
                                
                                setState(() {
                                  
                                });
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Fecha de Nacimiento',
                              border: InputBorder.none,
                              icon: Icon(Icons.date_range),
                              hintText: seledtedDate
                            ),
                            controller: birthDateController,
                            
                          ),
                        ),
                      ),
                    ),
                    //BirthDate End

                    SizedBox(
                      height: espacio,
                    ),

                    //CI InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Numero de Carnet',
                              border: InputBorder.none,
                              icon: Icon(Icons.card_membership),
                            ),
                            onChanged: (value) {
                              personnel.ci = int.parse(value);
                            },
                          ),
                        ),
                      ),
                    ),
                    //CI End

                    SizedBox(
                      height: espacio,
                    ),

                    //Telephone InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Telefono',
                              border: InputBorder.none,
                              icon: Icon(Icons.phone),
                            ),
                            onChanged: (value) {
                              personnel.telephone = int.parse(value);
                            },
                          ),
                        ),
                      ),
                    ),
                    //Telephone End

                    SizedBox(
                      height: espacio,
                    ),

                    //Password InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              border: InputBorder.none,
                              icon: Icon(Icons.password),
                            ),
                            onChanged: (value) {
                              personnel.password = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //Password End

                    SizedBox(
                      height: espacio,
                    ),

                    //VPassword InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Vuelve a escribir tu contraseña',
                              border: InputBorder.none,
                              icon: Icon(Icons.password),
                            ),
                            onChanged: (value) {
                              personnel.password = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //VPassword End

                    SizedBox(
                      height: espacio + 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonTheme(
                          child: TextButton(
                            style: elevatedButtonStyle,
                            onPressed: () => {
                              logup().then((value) => {
                                    if (value.statusCode == 200 ||
                                        value.statusCode == 204)
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    MainWebPage()))),
                                      }
                                    else
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              "No se puedo realizar el registro"),
                                        ))
                                      }
                                  }),
                            },
                            child: const Text(
                              "Sing Up",
                              style: TextStyle(
                                  color: Color(0xB8F7F7F8),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //Columna 2
              Container(
                width: _height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: espacio + 62,
                    ),

                    //Address InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Dirreccion',
                              border: InputBorder.none,
                              icon: Icon(Icons.grade),
                            ),
                            onChanged: (value) {
                              personnel.address = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //Grade End

                    SizedBox(
                      height: espacio,
                    ),

                    //Grade InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButton(
                            items: grades.map((String a){
                              return DropdownMenuItem(value: a,child: Text(a));}).toList(), 
                            onChanged: (String? _value)=>{
                              selectedGrade = _value!,
                              setState(() {})}
                            ,
                            hint: Text(selectedGrade)),
                        ),
                      ),
                    ),
                    //Grade End

                    SizedBox(
                      height: espacio,
                    ),

                    //Grade InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButton(
                            items: roles.map((String a){
                              return DropdownMenuItem(value: a,child: Text(a));}).toList(), 
                            onChanged: (String? _value)=>{
                              selectedRole = _value!,
                              setState(() {})}
                            ,
                            hint: Text(selectedRole)),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: espacio,
                    ),
                    
                    //BloodType InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Tipo de Sangre',
                              border: InputBorder.none,
                              icon: Icon(Icons.bloodtype),
                            ),
                            onChanged: (value) {
                              personnel.bloodType = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //BloodType End

                    SizedBox(
                      height: espacio,
                    ),

                    //Allergie InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Alergia',
                              border: InputBorder.none,
                              icon: Icon(Icons.dangerous),
                            ),
                            onChanged: (value) {
                              personnel.allergies = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //Allergie End
                  ],
                ),
              ),
              Container(
                  width: _width_container * 0.3,
                  height: _height,
                  // color: Colors.red,
                  child: (Center(
                    child: Image.asset(
                      "assets/images/login.jpg",
                      height: _height,
                      width: _width_container * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ))),
            ],
          ),
        ),
      ),
    )); }
  }
}
