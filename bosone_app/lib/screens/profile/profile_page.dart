import 'package:bosone_app/screens/authentication/login.dart';
import 'package:bosone_app/services/fire_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final User? user;
  const ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  late User? _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${_currentUser!.displayName}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'EMAIL: ${_currentUser!.email}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 16.0,
            ),
            _currentUser!.emailVerified
                ? Text(
                    'Email Verified',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.green),
                  )
                : Text(
                    'Email not verified',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.red),
                  ),
            ElevatedButton(
                onPressed: () async {
                  await _currentUser?.sendEmailVerification();
                },
                child: Text('Verify Email')),
            IconButton(
              onPressed: () async {
                User? user = await FireAuth.refreshUser(_currentUser!);
                if (user != null) {
                  setState(() {
                    _currentUser = user;
                  });
                }
              },
              icon: Icon(Icons.refresh),
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (builder) => Login(),
                    ),
                  );
                },
                child: Text('Sign Out'))
            //add widgets for verifying email
            //add, signing out the user
          ],
        ),
      ),
    );
  }
}
