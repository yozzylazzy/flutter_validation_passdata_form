import 'dart:ui';
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
  String? _gender2 = 'Pria';
  String selectedAgama = '';
  TextEditingController namalengkap = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telepon = TextEditingController();
  TextEditingController alamat = TextEditingController();

  bool _passwordVisible = true;
  //
  @override
  void initState(){
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar cuman Title
      drawer: Drawer(
        width: 300,
        backgroundColor: Colors.black45,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                //image: Image.asset('images/git.png'),
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage("images/git.png"),
                  alignment: Alignment.center,

                ),
              ),
                child: Text(''),
            ),
            ListTile(
              leading: Icon(Icons.home,color: Colors.white),
              title: const Text('Home',
              style: TextStyle(
                color: Colors.white
              )),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: const Text('User',
                  style: TextStyle(
                      color: Colors.white
                  )),
                onTap: (){
                    Navigator.pop(context);
                },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Register Form'),
        toolbarHeight: 70,
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(icon: Icon(Icons.menu),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),

        ],
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
                    controller: email,
                    validator: (value){
                      bool emailValidation = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value.toString());
                      if(value == null || value.isEmpty || !emailValidation){
                        return 'Mohon Isikan Email Dengan Benar';
                      }
                      return null;
                      // return (value!.isEmpty && emailValidation!?
                      // "Email Tidak Valid" : null);
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
                    controller: telepon,
                    validator: (value){
                      bool phoneValidator = RegExp(r'(^(?:[+0]9)?[0-9]{9,14}$)').hasMatch(value.toString());
                      if(value == null || value.isEmpty||!phoneValidator){
                         return 'Mohon Isikan Data Dengan Benar';
                      }
                      return null;
                      // return (value!.isEmpty?
                      // "Telepon Tidak Valid":
                      //  phoneValidator?
                      //  "Telepon Tidak Dikenal" : null);
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
                    controller: alamat,
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
                            leading: Radio<String>(
                              value: 'Pria',
                              groupValue: _gender2,
                              onChanged: (String? value){
                                setState(() {
                                  _gender2 = value;
                                });
                              },
                            ),
                          ),
                      ),
                      SizedBox(width: 20,),
                      Flexible(
                        child: ListTile(
                          title: const Text("Wanita"),
                          leading: Radio<String>(
                            value: 'Wanita',
                            groupValue: _gender2,
                            onChanged: (String? value){
                              setState(() {
                                _gender2 = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    obscureText: !_passwordVisible,
                    autocorrect: false,
                    //controller: ,
                    validator: (value){
                      return (value!.isEmpty?
                      "Password Tidak Boleh Kosong" : null);
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Masukkan Password',
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: (){
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      //memanggil method validate dari keyform dengan currentState (bisa banyak currentCOntext, dll)
                      if(_keyform.currentState!.validate()){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(title: const Text('Informasi'),content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Nama Lengkap : ${namalengkap.text}"),
                              Text("Email : ${email.text}"),
                              Text("Telepon : ${telepon.text}"),
                              Text("Alamat : ${alamat.text}"),
                              Text("Agama : ${selectedAgama}"),
                              Text("Gender : ${_gender2}"),
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
                      fixedSize: Size(150.0, 50.0),
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
