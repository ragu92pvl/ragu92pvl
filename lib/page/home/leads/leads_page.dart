

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/page/home/leads/add_leads_page.dart';
import 'package:userapp/widget/my_floating_action_button.dart';

class LeadsPage extends ConsumerStatefulWidget {
  const LeadsPage({super.key});

  @override
  ConsumerState<LeadsPage> createState() => _LeadsPageState();
}

class _LeadsPageState extends ConsumerState<LeadsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFAB(AddLeadsPage()),
    );
  }
}
