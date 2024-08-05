import 'package:farmadex/view/authentication/data/firebase_auth_repository.dart';
import 'package:farmadex/view/authentication/domain/app_user.dart';
import 'package:farmadex/view/onboarding/providers/app_user_provider/app_user_provider.dart';
import 'package:farmadex/view/onboarding/providers/onboarding_state_provider/onboarding_state_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:farmadex/view/onboarding/model/onboarding_model.dart';
import 'package:farmadex_models/farmadex_models.dart';

class OnboardPage extends ConsumerStatefulWidget {
  const OnboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardPageState();
}

class _OnboardPageState extends ConsumerState<OnboardPage> {
  final nameInputcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserType? userType = ref.watch(onboardingStateProviderProvider).userType;

    return IntroductionScreen(
      canProgress: (int page) {
        if (page == 2) {
          return userType != null;
        }
        if (page == 1) {
          return nameInputcontroller.text.isNotEmpty;
        }
        return true;
      },
      doneStyle: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      dotsFlex: 2,
      showNextButton: true,
      showBackButton: true,
      back: const Text("Geri"),
      onDone: () async {
        ref.read(appUserRepositoryProvider.notifier).createUser(_createUser(
            ref.read(firebaseAuthProvider).currentUser!,
            ref.read(onboardingStateProviderProvider)));
      },
      next: const Text("İleri"),
      done: const Text("Bitti"),
      dotsDecorator: DotsDecorator(
        activeColor: Theme.of(context).primaryColor,
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Verimliliği Artırın, Zamanı Optimize Edin",
          body:
              "Bu uygulama, karmaşık tıbbi bilgileri basitleştirir ve hızlı karar vermenizi sağlar. Tedavi süreçlerinizi hızlandırın, verimliliği artırın ve zamanınızı en iyi şekilde kullanın",
          image: const Center(
            child: InitialScreenIcon(
              icon: Icons.medical_services,
            ),
          ),
        ),
        PageViewModel(
          title: 'İsim',
          image: const InitialScreenIcon(icon: Icons.account_circle),
          bodyWidget: Center(
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: nameInputcontroller,
                onChanged: (value) {
                  ref
                      .watch(onboardingStateProviderProvider.notifier)
                      .changeName(value);
                },
                decoration: const InputDecoration(
                  hintText: 'İsim',
                ),
              ),
            ),
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(
            imageFlex: 2,
            bodyFlex: 2,
            footerFlex: 1,
          ),
          image: const InitialScreenIcon(icon: Icons.account_circle),
          useRowInLandscape: true,
          title: "Kullanıcı Tipi",
          body: "Sizi yakından tanıyalım.  ",
          footer: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CustomSelectableButton(
                    isSelected: userType == UserType.specialist,
                    onPressed: () {
                      ref
                          .watch(onboardingStateProviderProvider.notifier)
                          .changeUserType(UserType.specialist);
                    },
                    child: const Text('Uzman - Asistan'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomSelectableButton(
                    isSelected: userType == UserType.practitioner,
                    onPressed: () {
                      ref
                          .watch(onboardingStateProviderProvider.notifier)
                          .changeUserType(UserType.practitioner);
                    },
                    child: const Text('Pratisyen Hekim'),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  CustomSelectableButton(
                    isSelected: userType == UserType.student,
                    onPressed: () {
                      ref
                          .watch(onboardingStateProviderProvider.notifier)
                          .changeUserType(UserType.student);
                    },
                    child: const Text('Tıp Öğrencisi'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomSelectableButton(
                    isSelected: userType == UserType.other,
                    onPressed: () {
                      ref
                          .watch(onboardingStateProviderProvider.notifier)
                          .changeUserType(UserType.other);
                    },
                    child: const Text('Diğer'),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (userType == UserType.specialist) ...[
          PageViewModel(
            title: "Uzmanlık Alanı",
            image: const Center(
                child: InitialScreenIcon(icon: Icons.medical_services)),
            bodyWidget: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  Speciality.values.length,
                  (index) => CustomSelectableButton(
                    isSelected:
                        ref.watch(onboardingStateProviderProvider).speciality ==
                            Speciality.values[index],
                    onPressed: () {
                      ref
                          .watch(onboardingStateProviderProvider.notifier)
                          .changeSpeciality(Speciality.values[index]);
                    },
                    child: Text(
                      Speciality.values[index].valeu,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        if (userType == UserType.student) ...[
          PageViewModel(
            image: const Center(child: InitialScreenIcon(icon: Icons.school)),
            title: "Sınıf Bilgisi",
            bodyWidget: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => CustomSelectableButton(
                      isSelected: ref
                              .watch(onboardingStateProviderProvider)
                              .classNumber ==
                          index + 1,
                      onPressed: () {
                        ref
                            .watch(onboardingStateProviderProvider.notifier)
                            .changeClass(index + 1);
                      },
                      child: Text('${index + 1}. Sınıf'),
                    ),
                  )),
            ),
          ),
        ],
        PageViewModel(
          title: "Herşey Hazır!",
          body: "Şimdi uygulamayı kullanmaya başlayabilirsiniz",
          image: const InitialScreenIcon(icon: Icons.check_circle_outline),
        ),
      ],
    );
  }
}

class InitialScreenIcon extends StatelessWidget {
  const InitialScreenIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 180, color: Theme.of(context).primaryColor);
  }
}

class CustomSelectableButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final bool isSelected;

  const CustomSelectableButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: FilledButton.tonal(
          onPressed: onPressed,
          style: isSelected
              ? ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).primaryColor,
                )
              : null,
          child: Align(
              alignment: Alignment.center, // This line should fix the issue
              child: child)),
    );
  }
}

AppUser _createUser(auth.User currentUser, OnboardingModel onboardstate) {
  return AppUser(
    email: currentUser.email!,
    name: onboardstate.name,
    uid: currentUser.uid,
    isPremium: false,
    isOnboarded: true,
    classGrade: onboardstate.classNumber,
    speciality: onboardstate.speciality,
    userType: onboardstate.userType,
    registerDate: DateTime.now(),
  );
}
