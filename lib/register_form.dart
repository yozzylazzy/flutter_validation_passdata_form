import 'package:flutter/material.dart';

//create register form statefull
class RegisterFormStatefull extends StatefulWidget {
  const RegisterFormStatefull({Key? key}) : super(key: key);

  @override
  State<RegisterFormStatefull> createState() => _RegisterFormStatefullState();
}

class _RegisterFormStatefullState extends State<RegisterFormStatefull> {
  final GlobalKey<FormState> _keyform = GlobalKey<FormState>();
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
    );
  }
}
