import 'package:dart_either/dart_either.dart';

abstract class BaseAuthRepository {
  Future<Either> signUpWithFirebase(String email, String password);
  Future<Either> loginWithFirebase(String email, String password);
  Future<Either> signOutFirebase();
}



// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginCubit(),
//       child: Scaffold(
//         appBar: AppBar(),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 3.w),
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 Logo(),
//                 CustomTextFormField(
//                   validators: (p0) => AppValidator.emailName(p0),
//                   controller: emailController,
//                   hint: 'email',
//                 ),
//                 SizedBox(
//                   height: 3.h,
//                 ),
//                 CustomTextFormField(
//                   validators: (p0) => AppValidator.passwordValidation(p0),
//                   controller: passwordController,
//                   hint: 'password',
//                   isPassword: true,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                         onPressed: () {},
//                         child: CustomText(data: 'forget_password'.tr()))
//                   ],
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 BlocConsumer<LoginCubit, LoginState>(
//                   listener: (context, state) {
//                     if (state is LoginFailure) {
//                       showDialog(
//                         barrierDismissible: false,
//                         // Prevents dismissing by tapping outside
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           backgroundColor: AppColors.white,
//                           title: Text(
//                             'Error',
//                             style: TextStyle(
//                                 fontSize: 26, fontWeight: FontWeight.bold),
//                           ),
//                           content: Text(state.message),
//                           actions: [
//                             ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: CustomText(data: 'Confirm'))
//                           ],
//                         ),
//                       );
//                     }
//                     if (state is LoginSuccess) {
//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HomeScreen(),
//                         ),
//                         (route) => false,
//                       );
//                     }
//                   },
//                   builder: (context, state) {
//                     return CustomAuthButton(
//                       onTap: () {
//                         if (formKey.currentState!.validate()) {
//                           context.read<LoginCubit>().signInWIthFirebase(
//                               emailController.text, passwordController.text);
//                         }
//                       },
//                       data: 'sign_in'.tr(),
//                     );
//                   },
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       style: ButtonStyle(
//                           padding: WidgetStatePropertyAll(EdgeInsets.zero)),
//                       child: CustomText(data: 'dont_have_an_account'.tr()),
//                       onPressed: () {},
//                     ),
//                     TextButton(
//                       style: ButtonStyle(
//                           padding: WidgetStatePropertyAll(EdgeInsets.zero)),
//                       child: CustomText(
//                         data: 'sign_up'.tr(),
//                         color: AppColors.pink,
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SignUpScreen(),
//                             ));
//                       },
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HeadLineText extends StatelessWidget {
//   const HeadLineText({super.key, required this.data});

//   final String data;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       data,
//       style: TextStyle(
//         color: AppColors.pink,
//         fontWeight: FontWeight.w900,
//         fontSize: 35,
//       ),
//     );
//   }
// }