// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:login_register_app/values/app_routes.dart';
//
// import '../components/app_text_form_field.dart';
// import '../resources/vectors.dart';
// import '../utils/extensions.dart';
// import '../values/app_colors.dart';
// import '../values/app_constants.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   bool isObscure = true;
//
//   @override
//   Widget build(BuildContext context) {
//     final size = context.mediaQuerySize;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Container(
//                 height: size.height * 0.24,
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(20),
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color(0xff1E2E3D),
//                       Color(0xff152534),
//                       Color(0xff0C1C2E),
//                     ],
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Sign in to your\nAccount',
//                       style: Theme.of(context).textTheme.titleLarge,
//                     ),
//                     const SizedBox(
//                       height: 6,
//                     ),
//                     Text(
//                       'Sign in to your Account',
//                       style: Theme.of(context).textTheme.bodySmall,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     AppTextFormField(
//                       labelText: 'Email',
//                       keyboardType: TextInputType.emailAddress,
//                       textInputAction: TextInputAction.next,
//                       onChanged: (value) {
//                         _formKey.currentState?.validate();
//                       },
//                       validator: (value) {
//                         return value!.isEmpty
//                             ? 'Please, Enter Email Address'
//                             : AppConstants.emailRegex.hasMatch(value)
//                             ? null
//                             : 'Invalid Email Address';
//                       },
//                       controller: emailController,
//                     ),
//                     AppTextFormField(
//                       labelText: 'Password',
//                       keyboardType: TextInputType.visiblePassword,
//                       textInputAction: TextInputAction.done,
//                       onChanged: (value) {
//                         _formKey.currentState?.validate();
//                       },
//                       validator: (value) {
//                         return value!.isEmpty
//                             ? 'Please, Enter Password'
//                             : AppConstants.passwordRegex.hasMatch(value)
//                             ? null
//                             : 'Invalid Password';
//                       },
//                       controller: passwordController,
//                       obscureText: isObscure,
//                       suffixIcon: Padding(
//                         padding: const EdgeInsets.only(right: 15),
//                         child: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               isObscure = !isObscure;
//                             });
//                           },
//                           style: ButtonStyle(
//                             minimumSize: MaterialStateProperty.all(
//                               const Size(48, 48),
//                             ),
//                           ),
//                           icon: Icon(
//                             isObscure
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       style: Theme.of(context).textButtonTheme.style,
//                       child: Text(
//                         'Forgot Password?',
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                           color: AppColors.primaryColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     FilledButton(
//                       onPressed: _formKey.currentState?.validate() ?? false
//                           ? () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Logged In!'),
//                           ),
//                         );
//                         emailController.clear();
//                         passwordController.clear();
//                       }
//                           : null,
//                       style: const ButtonStyle().copyWith(
//                         backgroundColor: MaterialStateProperty.all(
//                           _formKey.currentState?.validate() ?? false
//                               ? null
//                               : Colors.grey.shade300,
//                         ),
//                       ),
//                       child: const Text('Login'),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Divider(
//                             color: Colors.grey.shade200,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 20,
//                           ),
//                           child: Text(
//                             'Or login with',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodySmall
//                                 ?.copyWith(color: Colors.black),
//                           ),
//                         ),
//                         Expanded(
//                           child: Divider(
//                             color: Colors.grey.shade200,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: OutlinedButton.icon(
//                             onPressed: () {},
//                             style: Theme.of(context).outlinedButtonTheme.style,
//                             icon: SvgPicture.asset(
//                               Vectors.googleIcon,
//                               width: 14,
//                             ),
//                             label: const Text(
//                               'Google',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         Expanded(
//                           child: OutlinedButton.icon(
//                             onPressed: () {},
//                             style: Theme.of(context).outlinedButtonTheme.style,
//                             icon: SvgPicture.asset(
//                               Vectors.facebookIcon,
//                               width: 14,
//                             ),
//                             label: const Text(
//                               'Facebook',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account?",
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodySmall
//                           ?.copyWith(color: Colors.black),
//                     ),
//                     TextButton(
//                       onPressed: () => AppRoutes.registerScreen.pushName(),
//                       style: Theme.of(context).textButtonTheme.style,
//                       child: Text(
//                         'Register',
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                           color: AppColors.primaryColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_expandable_table/flutter_expandable_table.dart';

const Color primaryColor = Color(0xFF1e2f36); //corner
const Color accentColor = Color(0xFF0d2026); //background
const TextStyle textStyle = TextStyle(color: Colors.white);
const TextStyle textStyleSubItems = TextStyle(color: Colors.grey);




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class DefaultCellCard extends StatelessWidget {
  final Widget child;

  const DefaultCellCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      margin: const EdgeInsets.all(1),
      child: child,
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  _buildCell(String content, {CellBuilder? builder}) {
    return ExpandableTableCell(
      child: builder != null
          ? null
          : DefaultCellCard(
        child: Center(
          child: Text(
            content,
            style: textStyle,
          ),
        ),
      ),
      builder: builder,
    );
  }

  ExpandableTableCell _buildFirstRowCell() {
    return ExpandableTableCell(
      builder: (context, details) => DefaultCellCard(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              SizedBox(
                width: 24 * details.row!.address.length.toDouble(),
                child: details.row?.children != null
                    ? Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 500),
                    turns:
                    details.row?.childrenExpanded == true ? 0.25 : 0,
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                  ),
                )
                    : null,
              ),
              Text(
                '${details.row!.address.length > 1 ? details.row!.address.skip(1).map((e) => 'Sub ').join() : ''}Row ${details.row!.address.last}',
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ExpandableTable _buildSimpleTable() {
    const int columnsCount = 20;
    const int rowsCount = 20;
    //Creation header
    List<ExpandableTableHeader> headers = List.generate(
      columnsCount - 1,
          (index) => ExpandableTableHeader(
        width: index % 2 == 0 ? 200 : 150,
        cell: _buildCell('Column $index'),
      ),
    );
    //Creation rows
    List<ExpandableTableRow> rows = List.generate(
      rowsCount,
          (rowIndex) => ExpandableTableRow(
        height: rowIndex % 2 == 0 ? 50 : 70,
        firstCell: _buildCell('Row $rowIndex'),
        cells: List<ExpandableTableCell>.generate(
          columnsCount - 1,
              (columnIndex) => _buildCell('Cell $rowIndex:$columnIndex'),
        ),
      ),
    );

    return ExpandableTable(
      firstHeaderCell: _buildCell('Simple\nTable'),
      headers: headers,
      scrollShadowColor: accentColor,
      rows: rows,
    );
  }

  static const int columnsCount = 20;
  static const int subColumnsCount = 2;
  static const int rowsCount = 6;
  static const int subRowsCount = 3;
  static const int totalColumns = columnsCount + subColumnsCount;

  List<ExpandableTableRow> _generateRows(int quantity, {int depth = 0}) {
    bool generateLegendRow = (depth == 0 || depth == 2);
    return List.generate(
      quantity,
          (rowIndex) => ExpandableTableRow(
        firstCell: _buildFirstRowCell(),
        children: ((rowIndex == 3 || rowIndex == 2) && depth < 3)
            ? _generateRows(subRowsCount, depth: depth + 1)
            : null,
        cells: !(generateLegendRow && (rowIndex == 3 || rowIndex == 2))
            ? List<ExpandableTableCell>.generate(
          totalColumns,
              (columnIndex) => _buildCell('Cell $rowIndex:$columnIndex'),
        )
            : null,
        legend: generateLegendRow && (rowIndex == 3 || rowIndex == 2)
            ? const DefaultCellCard(
          child: Align(
            alignment: FractionalOffset.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                'This is row legend',
                style: textStyle,
              ),
            ),
          ),
        )
            : null,
      ),
    );
  }

  ExpandableTable _buildExpandableTable() {
    //Creation header
    List<ExpandableTableHeader> subHeader = List.generate(
      subColumnsCount,
          (index) => ExpandableTableHeader(
        cell: _buildCell('Sub Column $index'),
      ),
    );

    //Creation header
    List<ExpandableTableHeader> headers = List.generate(
      columnsCount,
          (index) => ExpandableTableHeader(
          cell: _buildCell(
              '${index == 1 ? 'Expandable\nColumn' : 'Column'} $index'),
          children: index == 1 ? subHeader : null),
    );

    return ExpandableTable(
      firstHeaderCell: _buildCell('Expandable\nTable'),
      rows: _generateRows(rowsCount),
      headers: headers,
      defaultsRowHeight: 60,
      defaultsColumnWidth: 150,
      firstColumnWidth: 250,
      scrollShadowColor: accentColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            '   Simple Table                    |                    Expandable Table'),
        centerTitle: true,
      ),
      body: Container(
        color: accentColor,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _buildSimpleTable(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _buildExpandableTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}