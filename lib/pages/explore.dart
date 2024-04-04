import 'package:flutter/material.dart';
import 'package:ud_vote/providers/motivator_provider.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/pages/explore_bodyUI.dart';

class Explore extends StatefulWidget {

  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  @override
  void initState(){
    final motivatorProvider = Provider.of<MotivatorProvider>(context, listen: false);
    motivatorProvider.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final motivatorProvider = Provider.of<MotivatorProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Explore Democracy'),
          centerTitle: true,
          elevation: 0,
        ),
        body: motivatorProvider.isLoading?
              getLoadingUI()
              :
              motivatorProvider.error.isNotEmpty?
                  getErrorUI(motivatorProvider.error)
                  :
                  ExploreBodyUI(motivators: motivatorProvider.motivators),
      ),
    );
  }


  Widget getLoadingUI() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
          ),
          Text(
              "Loading...",
            style: TextStyle(
                color: Colors.indigo,
                fontFamily: 'Poppins',
                fontSize: 20
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }


  Widget getErrorUI(String error) {
    return Center(
     child: Text(
       error,
       style: const TextStyle(
         color: Colors.red,
         fontFamily: 'Poppins',
         fontSize: 20
       ),
       textAlign: TextAlign.center,
     ),

    );
  }

}


