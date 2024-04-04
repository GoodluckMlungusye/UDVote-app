import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/models/category.dart';
import 'package:ud_vote/sub_pages/contestant.dart';
import '../providers/voter_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeBodyUI extends StatelessWidget {

  final Categories categories;
  const HomeBodyUI({Key? key,required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final voterProvider = Provider.of<VoterProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;

    return  Scaffold(
      body: Stack(
        children: [

          SizedBox(
            height: height,
            child: Column(
              children: [
                Image.asset('assets/images/category.png'),
                Container(
                  color: Colors.indigo,
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
            child: Container(
              height: height * .66,
              decoration:  const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  children:  [
                    const Text(
                      'Select Category',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const Divider(
                      thickness: 1.5,
                      indent: 130,
                      endIndent: 130,
                      color: Colors.indigo,
                      height: 9,
                    ),

                    const SizedBox(height: 30),

                    Consumer<VoterProvider>(
                      builder:(context, ref,_) => Expanded(
                        child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 3,
                              crossAxisSpacing: 3
                            ),
                            itemCount: categories.categories.length,
                            itemBuilder: (BuildContext context, int index) {

                              return voterProvider.categoryIsAdded(categories.categories[index].id) ?

                              GestureDetector(
                                onTap: (){
                                  Fluttertoast.showToast(
                                      msg: 'You already voted for this category',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 3,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.black,
                                      fontSize: 12
                                  );
                                },
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Color(0xffF2EEEE)
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                           categories.categories[index].categoryAbbreviation.toUpperCase(),
                                          style: const TextStyle(
                                              color: Colors.indigo,
                                              fontFamily: 'Poppins',
                                              fontSize: 60,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 1,
                                          indent: 10,
                                          endIndent: 10,
                                          color: Colors.indigo,
                                          height: 5,
                                        ),
                                        Expanded(
                                          child: Text(
                                            categories.categories[index].categoryName.toUpperCase(),
                                            style: const TextStyle(
                                              color: Colors.indigo,
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            softWrap: true,
                                            overflow: TextOverflow.visible,

                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )

                                  :

                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Contestant(categoryName: categories.categories[index].categoryName)));
                                },
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: Color(0xffF2EEEE)
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        categories.categories[index].categoryAbbreviation.toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.indigo,
                                            fontFamily: 'Poppins',
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        indent: 10,
                                        endIndent: 10,
                                        color: Colors.indigo,
                                        height: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          categories.categories[index].categoryName.toUpperCase(),
                                          style: const TextStyle(
                                            color: Colors.indigo,
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          softWrap: true,
                                          overflow: TextOverflow.visible,

                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
