import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.onTap,
    this.isActive = true,
  });

  final String buttonText;
  final IconData icon;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ClipRect(
        child: SizedBox(
          height: 60.0,
          child: Center(
            child: isActive
                ? ListTile(
                    leading: Icon(
                      icon,
                      size: 40,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      buttonText,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 16),
                    ),
                    onTap: onTap,
                    trailing: const Icon(Icons.arrow_forward_ios),
                  )
                : Banner(
                    message: "Yakında",
                    location: BannerLocation.topEnd,
                    child: ListTile(
                      enabled: false,
                      leading: Icon(
                        icon,
                        size: 40,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      title: Text(
                        buttonText,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontSize: 16, color: Colors.grey),
                      ),
                      onTap: null,
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
