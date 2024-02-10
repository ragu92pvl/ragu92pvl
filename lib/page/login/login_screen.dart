

import 'package:easy_upi_payment/easy_upi_payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:userapp/provider/data_provider.dart';

import '../../constants/app_colors.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';

class LoginScreen extends ConsumerStatefulWidget {

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {


  void _launchURL() async {
    String _url='upi://pay?pa=anandham10-1@okicici&pn=Dinesh&am=1&tn=Test Payment&cu=INR';
    var result = await launch(_url);
    debugPrint(result.toString());
    if (result ==true) {
      print("Done");
    } else if (result ==false){
      print("Fail");
    }
  }


  @override
  Widget build(BuildContext context) {

    var authRef = ref.read(authControllerProvider);

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Form(
            key: authRef.loginKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40,),
                Image.asset("assets/images/logo.png",height: 150,width: 150,),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Sign in",style: TextStyle(fontSize: 26,fontFamily: 'Poppins Bold'),),
                      SizedBox(
                        width: 120,
                        child: Divider(color: AppColors.loginDividerColor,),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                          onSaved: (value){
                            authRef.signInModel.username = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Username',
                            contentPadding: const EdgeInsets.all(15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: AppColors.loginDividerColor,
                              ),
                            ),
                          )
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                          onSaved: (value){
                            authRef.signInModel.password = value;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            contentPadding: const EdgeInsets.all(15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: AppColors.loginDividerColor,
                              ),
                            ),
                          )
                      ),
                      const SizedBox(height: 10,),
                      // Generated code for this Button Widget...
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              authRef.loginKey.currentState!.save();
                              authRef.signIn(context);
                            },
                            text: 'Sign in',
                            options: FFButtonOptions(
                              width: 250,
                              height: 50,
                              padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: AppColors.loginDividerColor,
                              textStyle: const TextStyle(color: Colors.white,fontFamily: 'Poppins Bold'),
                              elevation: 3,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40,),
                      const Center(child: Text("Trouble to login?",style: TextStyle(fontSize: 14,fontFamily: 'Poppins Regular',),)),
                      InkWell(
                        onTap: (){

                        },
                        child: const Center(
                          child: Text("Contact Support",style: TextStyle(fontSize: 18,fontFamily: 'Poppins Bold',color: Colors.blue,
                              decoration: TextDecoration.underline,decorationColor: Colors.blue),),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
