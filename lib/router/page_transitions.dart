part of 'router.dart';

// class _PageTransitions {
//   static Page<void> pageWithTransition({
//     required LocalKey key,
//     required Widget child,
//   }) {
//     return CustomTransitionPage(
//       key: key,
//       child: child,
//       transitionDuration: const Duration(milliseconds: 500),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         final slideTween = Tween(
//           begin: const Offset(1.0, 0.0),
//           end: Offset.zero,
//         ).chain(CurveTween(curve: Curves.easeInOut));

//         final fadeTween = Tween<double>(
//           begin: 1.0,
//           end: 0.0,
//         ).chain(CurveTween(curve: Curves.easeIn));

//         final secondaryTween = Tween(
//           begin: Offset.zero,
//           end: const Offset(-1.0, 0.0),
//         ).chain(CurveTween(curve: Curves.easeInOut));

//         return FadeTransition(
//           opacity: secondaryAnimation.drive(fadeTween),
//           child: SlideTransition(
//             position: animation.drive(slideTween),
//             child: child,
//           ),
//         );
//         // return SlideTransition(
//         //   position: secondaryAnimation.drive(secondaryTween),
//         //   child: SlideTransition(
//         //     position: animation.drive(slideTween),
//         //     child: child,
//         //   ),
//         // );
//       },
//     );
//   }

//   static Page<void> subPageWithTransition({
//     required LocalKey key,
//     required Widget child,
//   }) {
//     return CustomTransitionPage(
//       key: key,
//       child: child,
//       transitionDuration: const Duration(milliseconds: 400),
//       reverseTransitionDuration: const Duration(milliseconds: 300),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         // Scale from center outward
//         final scaleTween = Tween<double>(
//           begin: 0.0,
//           end: 1.0,
//         ).chain(CurveTween(curve: Curves.easeOutCubic));

//         // Fade in alongside the scale
//         final fadeTween = Tween<double>(
//           begin: 0.0,
//           end: 1.0,
//         ).chain(CurveTween(curve: Curves.easeIn));

//         return FadeTransition(
//           opacity: animation.drive(fadeTween),
//           child: ScaleTransition(
//             scale: animation.drive(scaleTween),
//             alignment: Alignment.center, // grows from center
//             child: child,
//           ),
//         );
//       },
//     );
//   }
// }
