import 'package:flutter/material.dart';
import 'package:tumbuh_iman/core/extensions/translations_extenstion.dart';
import 'package:tumbuh_iman/core/services/translation_service.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class LanguageSelector extends StatefulWidget {
  final Function(String)? onLanguageChanged;

  const LanguageSelector({
    super.key,
    this.onLanguageChanged,
  });

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  void initState() {
    super.initState();
    // Listen to translation changes
    getIt<TranslationService>().addListener(_onTranslationChanged);
  }

  @override
  void dispose() {
    getIt<TranslationService>().removeListener(_onTranslationChanged);
    super.dispose();
  }

  void _onTranslationChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final translationService = getIt<TranslationService>();
    final currentLocale = translationService.currentLocale;

    return PopupMenuButton<String>(
      icon: const Icon(Icons.language),
      tooltip: 'profile.language'.tr,
      onSelected: (String locale) async {
        // Show loading
        if (context.mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final success = await translationService.changeLocale(locale);

        // Dismiss loading
        if (context.mounted) {
          Navigator.of(context).pop();
        }

        if (success) {
          widget.onLanguageChanged?.call(locale);

          // Show success message
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('common.success'.tr),
                backgroundColor: AppColors.success,
              ),
            );
          }
        } else {
          // Show error message
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('common.failed'.tr),
                backgroundColor: AppColors.error,
              ),
            );
          }
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'en',
          child: Row(
            children: [
              const Text('🇬🇧'),
              const SizedBox(width: AppDimensions.spaceS),
              const Text('English'),
              if (currentLocale == 'en') ...[
                const Spacer(),
                Icon(Icons.check, color: AppColors.primary, size: 20),
              ],
            ],
          ),
        ),
        PopupMenuItem(
          value: 'id',
          child: Row(
            children: [
              const Text('🇮🇩'),
              const SizedBox(width: AppDimensions.spaceS),
              const Text('Indonesia'),
              if (currentLocale == 'id') ...[
                const Spacer(),
                Icon(Icons.check, color: AppColors.primary, size: 20),
              ],
            ],
          ),
        ),
        PopupMenuItem(
          value: 'ar',
          child: Row(
            children: [
              const Text('🇸🇦'),
              const SizedBox(width: AppDimensions.spaceS),
              const Text('العربية'),
              if (currentLocale == 'ar') ...[
                const Spacer(),
                Icon(Icons.check, color: AppColors.primary, size: 20),
              ],
            ],
          ),
        ),
      ],
    );
  }
}