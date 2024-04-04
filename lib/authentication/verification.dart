import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ud_vote/authentication/verify.dart';
import '../providers/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/providers/voter_provider.dart';


class Verification extends StatefulWidget {

  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {

  bool isLoading = false;
  String errorMessage = '';
  TextEditingController registrationNumberControl = TextEditingController();

  Future<Map<String, dynamic>>  authenticate() async {

    setState(() {
      isLoading = true;
    });

    var data = {
      'registration_number': registrationNumberControl.text
    };

    var response = await Authenticate().postData(data, 'otp');
    var body = json.decode(response.body);
    return body;

  }


  @override
  Widget build(BuildContext context) {

    final voterProvider = Provider.of<VoterProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
              child: Column(
                children: <Widget>[

                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.jpg'),
                    radius: 60.0,
                  ),


                  const Padding(
                    padding:  EdgeInsets.only(top: 30),
                    child:  Text(
                      "Enter your registration number",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),

                      textAlign: TextAlign.center,
                    ),
                  ),


                  Padding(
                    padding:  const EdgeInsets.only(top: 30),
                    child:  Text(
                      errorMessage,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.red
                      ),

                      textAlign: TextAlign.center,
                    ),
                  ),



                  Padding(
                    padding:  const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        textInputAction: TextInputAction.send,
                        onEditingComplete: ()async {
                          if(!isLoading){
                            final status = await authenticate();
                            if (status['success']) {
                              setState(() {
                                isLoading = false;
                              });
                              voterProvider.voter_id = status['voter_id'];
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Verify(voterId: voterProvider.voter_id!)));
                            } else {
                              setState(() {
                                errorMessage = status['errorMessage'];
                                isLoading = false;
                              });
                            }
                          }
                        },
                        controller: registrationNumberControl,
                        decoration:const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))

                          ),
                          labelText: 'Reg.No',
                          filled: true,
                          fillColor: Color(0xffF2EEEE),
                          prefixIcon: Icon(Icons.numbers),
                          prefixIconColor: Colors.indigo,
                        ),

                      ),
                    ),
                  ),


                  Padding(
                    padding:  const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () async {
                            if(!isLoading){
                              final status = await authenticate();
                              if (status['success']) {
                                setState(() {
                                  isLoading = false;
                                });
                                voterProvider.voter_id = status['voter_id'];
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Verify(voterId: voterProvider.voter_id!)));
                              } else {
                                setState(() {
                                  errorMessage = status['errorMessage'];
                                  isLoading = false;
                                });
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              elevation: 0,
                              side: const BorderSide(
                                  width: 1,
                                  color: Colors.white
                              ),

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:isLoading? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Loading...',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        letterSpacing: 1
                                    ),
                                  ),
                                )
                              ],
                            ) :Text(
                              'submit'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1
                              ),
                            ),
                          )
                      ),
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