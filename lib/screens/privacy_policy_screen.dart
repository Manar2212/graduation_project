import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/utils.dart';

class Privacypolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy policy'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Image.asset(
              'assets/images/privacy-policy-300x225-2wo.png',
              width: 40,
              height: 40,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // privacypolicyAKf (11:612)
            padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // thisprivacypolicydescribesourp (11:615)
                  // margin:
                  //     EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 70 * fem),
                  padding:
                  EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 15),
                  constraints: BoxConstraints(
                    maxWidth: 374 * fem,
                  ),
                  child: Text(
                    'This Privacy Policy describes Our policies and procedures on\n the collection, use and disclosure of\n Your information when You use the Service and tells You\n about Your privacy rights and how the law protects You.\nWe use Your Personal data to provide and improve the \nService. By using the Service,\n you agree to the collection and use of information in \naccordance with this Privacy Policy.\nInterpretation and Definitions (https://leap.app/\nprivacypolicy.html?lang=ar&pkg=bodyfast.zero\n.fastingtracker.weightloss&color=0#local1)\nCollecting and Using Your Personal Data (https://leap.app\n/privacypolicy.html?lang=\nar&pkg=bodyfast.zero.fastingtracker.weightloss&color=\n0#local2)\nDetailed Information on the Processing of Your Personal \nData (https://leap.app/privacypolicy.html?lang=\nar&pkg=bodyfast.zero.fastingtracker.weightloss&color=\n0#local3)\nGDPR Privacy (https://leap.app/privacypolicy.html?\nlang=ar&pkg=bodyfast.zero.fastingtracker.weightloss&\ncolor=0#local4)\nCCPA Privacy (https://leap.app/privacypolicy.html?l\nang=ar&pkg=bodyfast.zero.fastingtracker.weightloss&\ncolor=0#local5)\n"Do Not Track" Policy as Required by California Online\n Privacy Protection Act \n(CalOPPA) (https://leap.app/privacypolicy.html?lang=\nar&pkg=\nbodyfast.zero.fastingtracker.weightloss&color=0#local6)\nChildren\'s Privacy (https://leap.app/privacypolicy.html?lang\n=ar&pkg=\nbodyfast.zero.fastingtracker.weightloss&color=0#local7)\nYour California Privacy Rights (California Business and \nProfessions Code Section 22581) \n(https://leap.app/privacypolicy.html?lang=ar&pkg=\nbodyfast.zero.fastingtracker.weightloss&color=0#local8)\nLinks to Other Websites (https://leap.app/privacypolicy\n.html?lang=ar&pkg=bodyfast.zero.fastingtracker.\nweightloss&color=0#local9)\nChanges to this Privacy Policy (https://leap.app/\nprivacypolicy.html?lang=ar&pkg=bodyfast.zero.\nfastingtracker.weightloss&color=0#local10)\nContact Us (https://leap.app/privacypolicy.html?lang\n=ar&pkg=bodyfast.zero.fastingtracker.weightloss&color\n=0#local11)\nInterpretation and DefinitionsInterpretation\nThe words of which the initial letter is capitalized have\n meanings defined under the following conditions.\nThe following definitions shall have the same meaning\n regardless of whether they appear in singular or in plural.\nDefinitionsFor the purposes of this Privacy Policy:\nYou means the individual accessing or using the Service, or\n the company, or other legal entity on behalf\n of which such individual is accessing or using the Service,\n as applicable. Under GDPR (General Data Protection \nRegulation), You can be referred to as the Data Subject \nor as the User as you are the individual using the Service.\nCompany (referred to as either "the Company", "We", "Us"\n or "Our" in this Agreement) refers to Leap Fitness\n Group. For the purpose of the GDPR, the Company is\n the Data Controller.\nApplication means the software program provided by\n the Company downloaded by You on any electronic \ndevice, named Fasting Tracker.\nAffiliate means an entity that controls, is controlled by or\n is under common control with a party, where\n "control" means ownership of 50% or more of the shares,\n equity interest or other securities entitled to vote\n for election of directors or other managing authority.\nAccount means a unique account created for You to acces\ns our Service or parts of our Service.\nService refers to the Application.\nCountry refers to: United States\nService Provider means any natural or legal person who \nprocesses the data on behalf of the Company.\n It refers to third-party companies or individuals employed\n by the Company to facilitate the Service, to\n provide the Service on behalf of the Company, to perform \nservices related to the Service or to assist \nthe Company in analyzing how the Service is used. For the\n purpose of the GDPR, Service Providers \nare considered Data Processors.\nThird-party Social Media Service refers to any website or\n any social network website through which a\n User can log in or create an account to use the Service.\nPersonal Data is any information that relates to an identified\n or identifiable individual. For the purposes \nfor GDPR, Personal Data means any information relating to \nYou such as a name, an identification numbe\nr, location data, online identifier or to one or more factors\n specific to the physical, physiological, genetic\n, mental, economic, cultural or social identity. For the purposes \nof the CCPA, Personal Data means any \ninformation that identifies, relates to, describes or is capable \nof being associated with, or could reasonably\n be linked, directly or indirectly, with You.\nDevice means any device that can access the Service such\n as a computer, a cellphone or a digital tablet.\nUsage Data refers to data collected automatically, either\n generated by the use of the Service or from the\n Service infrastructure itself (for example, the duration of a\n page visit).\nData Controller, for the purposes of the GDPR\n (General Data Protection Regulation),\n refers to the Company as the legal person which alone or\n jointly with others determines the purposes and \nmeans of the processing of Personal Data.',
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
