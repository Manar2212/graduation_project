import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/utils.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Image.asset(
              'assets/images/-ujb.png',
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // aboutaWR (11:751)
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // epilepsyisacommonconditionthat (11:754)
                  // margin:
                  //     EdgeInsets.fromLTRB(4 * fem, 0 * fem, 0 * fem, 86 * fem),
                  padding:
                  EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
                  constraints: BoxConstraints(
                    maxWidth: 386 * fem,
                  ),
                  child: Text(
                    'Epilepsy is a common condition that affects\n the brain and causes frequent seizures.\nSeizures are bursts of electrical activity in\n the brain that temporarily affect how it works.\n They can cause a wide range of symptoms.\nEpilepsy can start at any age, but usually starts\n either in childhood or in people over 60.\nIt\'s often lifelong, but can sometimes get\n slowly better over time.\nSymptoms of epilepsy\nSeizures can affect people in different ways, \ndepending on which part of the brain is\n involved.Possible symptoms include:\nuncontrollable jerking and shaking, called a "fit"\nlosing awareness and staring blankly into space\nbecoming stiff\nstrange sensations, such as a "rising" feeling \nin the tummy, unusual smells or tastes, and a \ntingling feeling in your arms or legs collapsing\nSometimes you might pass out and not \nremember what happened.\nWhen to get medical help\nSee a GP if you think you might have had a\n seizure for the first time.\nThis does not mean you have epilepsy, \nas a seizure can have several causes and \nsometimes they\'re just a one-off, but you\n should see a doctor to find out why it \nhappened.\nFind out more about the tests for epilepsy you \nmight have Call 999 for an ambulance if \nsomeone:\nis having a seizure for the first time\nhas a seizure that lasts more than 5 minutes\nhas lots of seizures in a row\nhas breathing problems or has seriously injured \nthemselvesFind out what to do if someone has \na seizure\nTreatments for epilepsy\nTreatment can help most people with epilepsy\n have fewer seizures or stop having seizures\n completely.\nTreatments include:\nmedicines called anti-epileptic drugs – these \nare the main treatment\nsurgery to remove a small part of the brain \nthat\'s causing the seizures\na procedure to put a small electrical device\n inside the body that can help control seizures\na special diet (ketogenic diet) that can help \ncontrol seizures\nSome people need treatment for life. But you\n might be able to stop treatment if your\n seizures disappear over time.\nLiving with epilepsy\nEpilepsy is usually a lifelong condition, but \nmost people with it are able to have normal \nlives if their seizures are well controlled.\nMost children with epilepsy are able to go to \na mainstream school, take part in most\n activities and sports, and get a job when \nthey\'re older.\nBut you may have to think about your epilepsy\n before you do things such as driving, certain\n jobs, swimming, using contraception and \nplanning a pregnancy.\nAdvice is available from a GP or support \ngroups to help you adjust to life with epilepsy.\nFind out more about living with epilepsy\nCauses of epilepsy\nIn epilepsy, the electrical signals in the brain\n become scrambled and there are sometimes \nsudden bursts of electrical activity. This is what\n causes seizures.\nIn most cases, it\'s not clear why this happens.\n It\'s possible it could be partly caused by your \ngenes affecting how your brain works, as \naround 1 in 3 people with epilepsy have a \nfamily member with it.\nOccasionally, epilepsy can be caused by \ndamage to the brain, such as damage from:\na stroke\na brain tumour\na severe head injury\ndrug abuse or alcohol misuse\na brain infection\na lack of oxygen during birth\nPage last reviewed: 18 September 2020\nNext review due: 18 September 2023',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 19 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}