import 'package:flutter/material.dart';
import 'package:ud_vote/authentication/startup.dart';
import 'package:ud_vote/providers/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/pages/home_bodyUI.dart';


class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState(){
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final categoryProvider = Provider.of<CategoryProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('UDVote'),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Startup()));
              },
            ),
          ],
        ),

        body: categoryProvider.isLoading?
        getLoadingUI()
            :
        categoryProvider.error.isNotEmpty?
        getErrorUI(categoryProvider.error)
            :
        HomeBodyUI(categories: categoryProvider.categories),
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


