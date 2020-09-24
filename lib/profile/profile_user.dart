import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/login_screen/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileUser extends StatefulWidget{
  _ProfileUserState createState() => _ProfileUserState();
}
class _ProfileUserState extends State<ProfileUser> {
  GoogleSignIn googleSignIn = GoogleSignIn(clientId: "619033735551-plgl572jufnllvoh011e6cspl14sj8bf.apps.googleusercontent.com");
  GoogleSignInAccount account ;
  GoogleSignInAuthentication auth;
  bool gotProfile = false;
  @override
  void initState() {
    // TODO: implement initState
    getProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return gotProfile ? Scaffold(
      appBar: AppBar(
        title: Text("Your profile"),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.exit_to_app),
          onPressed: () async{
          await googleSignIn.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },)],
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(account.photoUrl,height: 150,),
            Text(account.displayName),
            Text(account.email),
          //  Text(auth.idToken),
          ],
        )
      ),
    ) : LinearProgressIndicator();
  }

    void getProfile() async {
      await googleSignIn.signInSilently();
      account = googleSignIn.currentUser;
      auth = await account.authentication;
      setState(() {
        gotProfile = true;
      });
  }

}