import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/providers/voter_provider.dart';
import 'package:ud_vote/authentication/verification.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../providers/auth_service.dart';
import 'dart:convert';
import 'package:ud_vote/authentication/verify.dart';


class Startup extends StatefulWidget {
  const Startup({Key? key}) : super(key: key);

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {


  String registrationNumber = "";

  Future<Map<String, dynamic>> scanBarcode() async{
    await FlutterBarcodeScanner.scanBarcode(
        "#000000",
        "Cancel",
        true,
        ScanMode.BARCODE).then((value){
      setState(() => registrationNumber = value);
      print('SCANNED REGISTRATION NUMBER: $value');
    });

    var data = {
      'registration_number': registrationNumber
    };

    var response = await Authenticate().postData(data,'otp');
    var body = json.decode(response.body);
    return body;
  }

  @override
  Widget build(BuildContext context) {
    final voterProvider = Provider.of<VoterProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [

              Image.asset(
                  'assets/images/udsm.jpg'
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'UDVote',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: Text(
                  'Your Vote Matters',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),

                ),
              ),

              Container(
                height: height * .42
                ,
                margin: const EdgeInsets.only(top: 47),
                decoration:  const BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 15, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                        indent: 120,
                        endIndent: 120,
                        color: Colors.white,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          const Text(
                            'Verify your credentials via',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox (
                              width: width,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    final status = await scanBarcode();
                                    if(status['success']){
                                      voterProvider.voter_id = status['voter_id'];
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Verify(voterId: voterProvider.voter_id!)));
                                    }
                                  } ,
                                  style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 1,
                                          color: Colors.white
                                      ),

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                      )
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'smartcard'.toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: width,
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Verification()));
                                },
                                style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 1,
                                        color: Colors.white
                                    ),

                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30)
                                    )
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'manual verification'.toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}