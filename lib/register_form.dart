import 'dart:html';

import 'package:flutter/material.dart';

enum Gender{Pria, Wanita}
//create register form statefull
class RegisterFormStatefull extends StatefulWidget {
  const RegisterFormStatefull({Key? key}) : super(key: key);

  @override
  State<RegisterFormStatefull> createState() => _RegisterFormStatefullState();
}

class _RegisterFormStatefullState extends State<RegisterFormStatefull> {
  Gender? _gender = Gender.Pria;
  final GlobalKey<FormState> _keyform = GlobalKey<FormState>();
  String selectedAgama = '';
  TextEditingController namalengkap = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar cuman Title
      appBar: AppBar(
        title: const Text('Register Form'),
        toolbarHeight: 70,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Form(
              key: _keyform,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: namalengkap,
                    validator: (value){
                      // if(value == null || value.isEmpty){
                      //   return 'Mohon Isikan Data Dengan Benar';
                      // }
                      // return null;
                      return (value!.isEmpty?
                      "Nama Harus Diisi" : null);
                    },
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                      ),
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    //controller: ,
                    validator: (value){
                      // if(value == null || value.isEmpty){
                      //   return 'Mohon Isikan Data Dengan Benar';
                      // }
                      // return null;
                      return (value!.isEmpty?
                      "Email Tidak Valid" : null);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                      ),
                      prefixIcon: Icon(Icons.mail),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    //controller: ,
                    validator: (value){
                      // if(value == null || value.isEmpty){
                      //   return 'Mohon Isikan Data Dengan Benar';
                      // }
                      // return null;
                      return (value!.isEmpty?
                      "Telepon Tidak Valid" : null);
                    },
                    decoration: InputDecoration(
                      labelText: 'Telepon',
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                      ),
                      prefixIcon: Icon(Icons.phone),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    maxLines: 3,
                    //controller: ,
                    validator: (value){
                      // if(value == null || value.isEmpty){
                      //   return 'Mohon Isikan Data Dengan Benar';
                      // }
                      // return null;
                      return (value!.isEmpty?
                      "Alamat Tidak Valid" : null);
                    },
                    decoration: InputDecoration(
                      //contentPadding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 10.0),
                      labelText: 'Alamat',
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                      ),
                      prefixIcon: Icon(Icons.home),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    //controller: ,
                    validator: (value) => value ==null ? 'Agama Harus Dipilih' : null,
                      items: <String>['Katolik', 'Kristen', 'Islam', 'Budha', 'Hindu'].map((String value)
                          {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                            );
                          }).toList(),
                      onChanged: (value){
                        setState(() {
                          selectedAgama = value!;
                        });
                      },
                    decoration: InputDecoration(
                      labelText: 'Pilih Agama',
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                      ),
                      //prefixIcon: Icon(Icons.home),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Flexible(
                        child: ListTile(
                            title: const Text("Pria"),
                            leading: Radio<Gender>(
                              value: Gender.Pria,
                              groupValue: _gender,
                              onChanged: (Gender? value){
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                      ),
                      SizedBox(width: 20,),
                      Flexible(
                        child: ListTile(
                          title: const Text("Wanita"),
                          leading: Radio<Gender>(
                            value: Gender.Wanita,
                            groupValue: _gender,
                            onChanged: (Gender? value){
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){
                      //memanggil method validate dari keyform dengan currentState (bisa banyak currentCOntext, dll)
                      if(_keyform.currentState!.validate()){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(title: const Text('Informasi'),content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Nama Lengkap : ${namalengkap.text}")
                            ],
                          ));});
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Data Register Belum Lengkap....."))
                        );
                      }
                    },
                    child: Text(
                        'Submit'
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      fixedSize: Size(150, 50),
                      shadowColor: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
