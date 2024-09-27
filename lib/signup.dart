import 'package:flutter/material.dart';
import 'package:myapp/otpscreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    double pr = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(24.0, 50.0, 24.0, 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('MedBuzz',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CustomFontFamily')),
            SizedBox(
              height: 13,
            ),
            const Text('Create your account', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 13.0),
            const Text('First Name', style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 50.0,
              child: TextFormField(
                controller: _firstnameController,
                decoration: const InputDecoration(
                  labelText: 'Enter your first name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('Last Name', style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 55.0,
              child: TextFormField(
                controller: _lastnameController,
                decoration: const InputDecoration(
                  labelText: 'Enter your last name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('Email', style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 55.0,
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter your email address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 8.0),
            const Text('Password', style: TextStyle(fontSize: 18)),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Enter your password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
              ),
              obscureText: true,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
            Row(
              
              children: [
                Checkbox(
                value: true,
                onChanged: null,
              ),
              const Text('Must be 16 characters')
              ]
            ),
            Row(
              children: [
                Checkbox(
                value: true,
                onChanged: null,
              ),
              const Text('Must contain uppercase letters')
              ]
            ),
            Row(
              children: [
                Checkbox(
                value: true,
                onChanged: null,
              ),
              const Text('Must contain lowercase letters')
              ]
            ),
            Row(
              children: [
                Checkbox(
                value: true,
                onChanged: null,
              ),
              const Text('Must contain numbers')
              ]

            ),
            Row(
              children: [
                Checkbox(
                value: true,
                onChanged: null,
              ),
              const Text('Must contain symbols')
              ]

            ),
              ],
            ),
            const SizedBox(height: 8.0),
            
            const SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: TextStyle(color: Colors.white), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Corner radius
                  ),
                ),
                onPressed: () async {
                      final response = await supabase.auth.signUp(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      if(response.user != null){
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2016291677.
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context) => OTPScreen(_emailController.text)));
                      }
                },
                child: Text(
                  'SignUp',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                SizedBox(width: 4.0),
                GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, '/login')
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}