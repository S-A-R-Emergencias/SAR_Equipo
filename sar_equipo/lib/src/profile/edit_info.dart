import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sar_equipo/Models/personnel_model.dart';
import 'package:sar_equipo/constans.dart';
import 'package:sar_equipo/src/global/environment.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import 'package:sar_equipo/src/main_web_page.dart';
import 'package:sar_equipo/src/services/personnel_service.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key, required this.titleName, this.personnelSend}) : super(key: key);

  final String titleName; //declared variable
  final Personnel? personnelSend;
  @override
  State<EditInfo> createState() => _EditInfoState(personnelSend);
}

class _EditInfoState extends State<EditInfo> {
  Personnel? personnel;

  _EditInfoState(this.personnel);
  var grades = ['Administrativo','Medico','Bombero','Voluntario'];
  var roles = ['Administrador','Miembro'];
  String selectedGrade = 'Voluntario';
  String selectedRole = "Miembro";
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController secontLastNameController= new TextEditingController();
  TextEditingController birthDateController= new TextEditingController();
  TextEditingController ciController= new TextEditingController();
  TextEditingController phoneController= new TextEditingController();
  TextEditingController addressController= new TextEditingController();
  TextEditingController bloodtypeController= new TextEditingController();
  TextEditingController alerController= new TextEditingController();
  void InitializeText(){
    emailController.text = personnel!.email!;
    nameController.text = personnel!.name!;
    lastNameController.text = personnel!.lastName!;
    secontLastNameController.text = personnel!.secondLastName == null?"":personnel!.secondLastName!;
    birthDateController.text = personnel!.birthDate!.year.toString() + "-" + personnel!.birthDate!.month.toString() + "-" + personnel!.birthDate!.day.toString();
    ciController.text = personnel!.ci!.toString();
    phoneController.text = personnel!.telephone!.toString();
    addressController.text = personnel!.address!;
    bloodtypeController.text = personnel!.bloodType!;
    alerController.text = personnel!.allergies!;
    selectedGrade = personnel!.grade!;
    selectedRole = personnel!.role!;
    switch (personnel!.role!) {
      case '1':
        selectedRole = "Miembro";
      break;
      case '2':
        selectedRole = "Administrador";
      break;
      default: selectedRole = "Miembro";
    }
  }

  Future<http.Response> UpdateInfo() async {
    personnel!.grade = selectedGrade;
    switch (selectedRole) {
      case 'Miembro':
        personnel!.role = "1";
      break;
      case 'Administrador':
        personnel!.role = "2";
      break;
      default: personnel!.role = "1";
    }
    personnel!.email = emailController.text;
    personnel!.name = nameController.text;
    personnel!.lastName = lastNameController.text;
    personnel!.secondLastName == null?null:secontLastNameController.text;
    personnel!.ci = int.parse(ciController.text);
    personnel!.telephone= int.parse(phoneController.text);
    personnel!.address = addressController.text;
    personnel!.bloodType = bloodtypeController.text;
    personnel!.allergies = alerController.text;
    personnel!.grade = selectedGrade;
    PersonnelService service = PersonnelService();
    final response = service.putPerson(personnel!);
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
    InitializeText();
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
                            controller: emailController
                            
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
                            controller:nameController
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
                            controller:lastNameController
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
                           controller:secontLastNameController
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
                            controller: birthDateController,
                            onTap:() async {
                              DateTime? pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());
                              if(pickedDate!= null){
                                setState(() {
                                  birthDateController.text = pickedDate.year.toString() + "-" + pickedDate.month.toString() + "-" + pickedDate.day.toString();
                                });
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Fecha de Nacimiento',
                              border: InputBorder.none,
                              icon: Icon(Icons.date_range),
                            ),
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
                            controller: ciController,
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
                            controller: phoneController,
                          ),
                        ),
                      ),
                    ),
                    //Telephone End

                    SizedBox(
                      height: espacio,
                    ),
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
                              UpdateInfo().then((value) => {
                                    if (value.statusCode == 200 ||
                                        value.statusCode == 204)
                                      {
                                        Environment.usersession = personnel,
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
                              "Actualizar",
                              style: TextStyle(
                                  color: Color(0xB8F7F7F8),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
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
                            controller: addressController,
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
                              if(Environment.usersession!.role =="2"){
                                selectedGrade = _value!,
                                setState(() {})}
                              }
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
                              if(Environment.usersession!.role =="2"){
                                selectedRole = _value!,
                                setState(() {})}
                              }
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
                            readOnly:true,
                            decoration: InputDecoration(
                              labelText: 'Tipo de Sangre',
                              border: InputBorder.none,
                              icon: Icon(Icons.bloodtype),
                            ),
                            controller: bloodtypeController,
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
                            readOnly:true,
                            decoration: InputDecoration(
                              labelText: 'Alergia',
                              border: InputBorder.none,
                              icon: Icon(Icons.dangerous),
                            ),
                            controller:alerController
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
