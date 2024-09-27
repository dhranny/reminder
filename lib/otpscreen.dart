import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OTPScreen extends StatelessWidget {
  String email;
  String token = '1234';
  OTPScreen(this.email);
  final _a = TextEditingController();
  final _b = TextEditingController();
  final _c = TextEditingController();
  final _d = TextEditingController();
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(24.0, 90.0, 24.0, 80.0),
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
            const Text('Check your email', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 13.0),
            Text('We have sent a verification to $email',
                style: TextStyle(fontSize: 14)),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                  width: 50,
                  child: TextFormField(
                    controller: _a,
                    decoration: const InputDecoration(
                      labelText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  width: 50,
                  child: TextFormField(
                    controller: _b,
                    decoration: const InputDecoration(
                      labelText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  width: 50,
                  child: TextFormField(
                    controller: _c,
                    decoration: const InputDecoration(
                      labelText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  width: 50,
                  child: TextFormField(
                    controller: _d,
                    decoration: const InputDecoration(
                      labelText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: TextStyle(color: Colors.white), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Corner radius
                  ),
                ),
                onPressed: () async {},
                child: Text(
                  'Verify Email',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive an email?"),
                SizedBox(width: 4.0),
                GestureDetector(
                  onTap: () async {
                    final response = await supabase.auth.signInWithOtp(
                        email: email,
                        type: OtpType.email,
                        token: token,                      
                      );
                      if(response.u != null){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context) => OTPScreen(username)));
                      }
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
