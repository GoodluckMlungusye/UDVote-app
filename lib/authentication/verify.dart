import 'package:flutter/material.dart';
import 'package:ud_vote/nav_page.dart';
import 'dart:convert';
import '../providers/auth_service.dart';


class Verify extends StatefulWidget {

  final int voterId;

  const Verify({Key? key, required this.voterId}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  bool isLoading = false;
  String errorMessage = '';
  TextEditingController otpControl = TextEditingController();

  verify() async{

    setState(() {
      isLoading = true;
    });

    var data = {
        'voter_id': widget.voterId,
        'otp':  otpControl.text
    };

    var response = await Authenticate().postData(data,'verify');
    var body = json.decode(response.body);
    if(body['success']){
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const NavigationPage()));
    }
    else {
      setState(() {
        errorMessage = body['errorMessage'];
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
          ),
        body: Stack(
          children: [

            SizedBox(
              height: height,
              child: Column(
                children: [
                  Image.asset('assets/images/startup.jpg'),
                  Container(
                    color: Colors.indigo,
                  )
                ],
              ),
            ),

            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
                child: Container(
                  height: height * .66,
                  decoration:  const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                        ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Enter the code sent to your email to proceed',
                            style: TextStyle(
                                color: Colors.indigo,
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Divider(
                          thickness: 1.5,
                          indent: 120,
                          endIndent: 120,
                          color: Colors.indigo,
                          height: 9,
                        ),


                         Padding(
                          padding: const EdgeInsets.only(top:30),
                          child: Text(
                            errorMessage,
                            style: const TextStyle(
                                color: Colors.red,
                                fontFamily: 'Poppins',
                                fontSize: 15,
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Form(
                              child: Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                    child: SizedBox(
                                      height: 45,
                                      child: Form(
                                        child: TextFormField(
                                          textInputAction: TextInputAction.send,
                                          onEditingComplete: (){
                                            if(!isLoading){
                                              verify();
                                            }
                                          },
                                          controller: otpControl,
                                          decoration:const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(30))

                                            ),
                                            labelText: 'code',
                                            filled: true,
                                            fillColor: Color(0xffF2EEEE),
                                            prefixIcon: Icon(Icons.numbers),
                                            prefixIconColor: Colors.indigo,
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 30, 0,0),
                                    child: SizedBox (
                                      width: width,
                                      child: ElevatedButton(
                                          onPressed: (){
                                            if(!isLoading){
                                              verify();
                                            }

                                          },
                                          style: ElevatedButton.styleFrom(

                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30)
                                              )
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: isLoading? const Row(
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
                                              'proceed'.toUpperCase(),
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
                              )
                          ),
                        ),

                      ],
                    ),
                  ),

                ),
              ),
            ),

          ],
        )

      ),
    );
  }
}
