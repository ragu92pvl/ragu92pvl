

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/provider/data_provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';

class AddLeadsPage extends ConsumerStatefulWidget {

  const AddLeadsPage({super.key});

  @override
  ConsumerState<AddLeadsPage> createState() => _AddLeadsPageState();
}

class _AddLeadsPageState extends ConsumerState<AddLeadsPage> {


  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;


  Future<void> _showDateTimePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDate = pickedDate;
          _selectedTime = pickedTime;
          ref.watch(leadControllerProvider).leadModel.date = '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day} ${_selectedTime.hour}:${_selectedTime.minute}';
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    var leadRef = ref.read(leadControllerProvider);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.loginDividerColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Add Leads",style: TextStyle(color: Colors.white,fontFamily: AppStyle.poppinsRegular),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: leadRef.leadFormKey,
            child: Column(
              children: [
                Text("Please fill the leads data",style: TextStyle(fontFamily: AppStyle.poppinsRegular),),
                const SizedBox(height: 10,),
                TextFormField(
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    onSaved: (value){
                      leadRef.leadModel.name = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Name *',
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.loginDividerColor,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                TextFormField(
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    onSaved: (value){
                      leadRef.leadModel.mobile = int.parse(value!);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Mobile Number *',
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.loginDividerColor,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                TextFormField(
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    onSaved: (value){
                      leadRef.leadModel.address = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Address',
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.loginDividerColor,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                TextFormField(
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    onSaved: (value){
                      leadRef.leadModel.occupation = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Occupation',
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.loginDividerColor,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                TextFormField(
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    onSaved: (value){
                      leadRef.leadModel.business = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Business',
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.loginDividerColor,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                TextFormField(
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    onSaved: (value){
                      leadRef.leadModel.turnover = value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Turn Over Year',
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.loginDividerColor,
                        ),
                      ),
                    )
                ),
               leadRef.leadType == 0 ?Column(
                  children: [
                    const SizedBox(height: 10,),
                    TextFormField(
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
                        onSaved: (value){
                          leadRef.leadModel.remarks = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Remarks',
                          contentPadding: const EdgeInsets.all(15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: AppColors.loginDividerColor,
                            ),
                          ),
                        )
                    ),
                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        _showDateTimePicker(context);
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                            onEditingComplete: () => FocusScope.of(context).nextFocus(),
                            onSaved: (value){
                              leadRef.leadModel.date = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter FollowUp Date',
                              contentPadding: const EdgeInsets.all(15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: AppColors.loginDividerColor,
                                ),
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ):Container(),
                const SizedBox(height: 20,),
                RadioListTile(
                  title: const Text('Follow up'),
                  value: 0,
                  groupValue: leadRef.leadType,
                  onChanged: (value) {
                    setState(() {
                      leadRef.leadType = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Confirmed'),
                  value: 1,
                  groupValue: leadRef.leadType,
                  onChanged: (value) {
                    setState(() {
                      leadRef.leadType = value!;
                    });
                  },
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        leadRef.leadFormKey.currentState!.save();
                        leadRef.addLeads(context);
                      },
                      text: 'Submit',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
