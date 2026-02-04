import 'package:flutter/material.dart' hide Badge;
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/components/navigation/custom_app_bar.dart';
import 'package:tumbuh_iman/presentation/components/buttons/primary_button.dart';
import 'package:tumbuh_iman/presentation/components/buttons/secondary_button.dart';
import 'package:tumbuh_iman/presentation/components/buttons/text_button_custom.dart';
import 'package:tumbuh_iman/presentation/components/buttons/icon_button_custom.dart';
import 'package:tumbuh_iman/presentation/components/buttons/floating_action_button_custom.dart';
import 'package:tumbuh_iman/presentation/components/cards/info_card.dart';
import 'package:tumbuh_iman/presentation/components/cards/stat_card.dart';
import 'package:tumbuh_iman/presentation/components/cards/feature_card.dart';
import 'package:tumbuh_iman/presentation/components/cards/action_card.dart';
import 'package:tumbuh_iman/presentation/components/cards/summary_card.dart';
import 'package:tumbuh_iman/presentation/components/inputs/text_field_custom.dart';
import 'package:tumbuh_iman/presentation/components/inputs/search_field.dart';
import 'package:tumbuh_iman/presentation/components/dialogs/confirm_dialog.dart';
import 'package:tumbuh_iman/presentation/components/dialogs/info_dialog.dart';
import 'package:tumbuh_iman/presentation/components/dialogs/error_dialog.dart';
import 'package:tumbuh_iman/presentation/components/dialogs/success_dialog.dart';
import 'package:tumbuh_iman/presentation/components/dialogs/custom_bottom_sheet.dart';
import 'package:tumbuh_iman/presentation/components/indicators/loading_indicator.dart';
import 'package:tumbuh_iman/presentation/components/indicators/progress_indicator_custom.dart';
import 'package:tumbuh_iman/presentation/components/indicators/shimmer_loading.dart';
import 'package:tumbuh_iman/presentation/components/states/error_view.dart';
import 'package:tumbuh_iman/presentation/components/states/empty_state.dart';
import 'package:tumbuh_iman/presentation/components/states/success_view.dart';
import 'package:tumbuh_iman/presentation/components/misc/avatar.dart';
import 'package:tumbuh_iman/presentation/components/misc/badge.dart';
import 'package:tumbuh_iman/presentation/components/misc/chip_custom.dart';
import 'package:tumbuh_iman/presentation/components/misc/divider_custom.dart';

class ComponentShowcasePage extends StatefulWidget {
  const ComponentShowcasePage({super.key});

  @override
  State<ComponentShowcasePage> createState() => _ComponentShowcasePageState();
}

class _ComponentShowcasePageState extends State<ComponentShowcasePage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isButtonLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Component Showcase',
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              InfoDialog.show(
                context: context,
                title: 'Component Showcase',
                message: 'This page demonstrates all available UI components in the Tumbuh Iman app.',
                icon: Icons.widgets,
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(AppDimensions.paddingM),
        children: [
          _buildSection(
            title: 'Colors',
            child: _buildColorsSection(),
          ),
          _buildSection(
            title: 'Typography',
            child: _buildTypographySection(),
          ),
          _buildSection(
            title: 'Buttons',
            child: _buildButtonsSection(),
          ),
          _buildSection(
            title: 'Cards',
            child: _buildCardsSection(),
          ),
          _buildSection(
            title: 'Inputs',
            child: _buildInputsSection(),
          ),
          _buildSection(
            title: 'Dialogs',
            child: _buildDialogsSection(),
          ),
          _buildSection(
            title: 'Indicators',
            child: _buildIndicatorsSection(),
          ),
          _buildSection(
            title: 'States',
            child: _buildStatesSection(),
          ),
          _buildSection(
            title: 'Misc',
            child: _buildMiscSection(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButtonCustom(
        icon: Icons.add,
        onPressed: () {
          SuccessDialog.show(
            context: context,
            title: 'FAB Clicked',
            message: 'Floating Action Button pressed!',
          );
        },
        tooltip: 'Add',
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.headline4),
        SizedBox(height: AppDimensions.spaceM),
        child,
        SizedBox(height: AppDimensions.spaceXL),
      ],
    );
  }

  // ===== COLORS SECTION =====
  Widget _buildColorsSection() {
    return Wrap(
      spacing: AppDimensions.spaceM,
      runSpacing: AppDimensions.spaceM,
      children: [
        _buildColorSwatch('Primary', AppColors.primary),
        _buildColorSwatch('Primary Dark', AppColors.primaryDark),
        _buildColorSwatch('Primary Light', AppColors.primaryLight),
        _buildColorSwatch('Accent', AppColors.accent),
        _buildColorSwatch('Cream', AppColors.cream),
        _buildColorSwatch('Success', AppColors.success),
        _buildColorSwatch('Error', AppColors.error),
        _buildColorSwatch('Warning', AppColors.warning),
        _buildColorSwatch('Info', AppColors.info),
      ],
    );
  }

  Widget _buildColorSwatch(String name, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            border: Border.all(color: AppColors.border),
          ),
        ),
        SizedBox(height: AppDimensions.spaceXS),
        Text(name, style: AppTextStyles.caption),
      ],
    );
  }

  // ===== TYPOGRAPHY SECTION =====
  Widget _buildTypographySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Headline 1', style: AppTextStyles.headline1),
        Text('Headline 2', style: AppTextStyles.headline2),
        Text('Headline 3', style: AppTextStyles.headline3),
        Text('Headline 4', style: AppTextStyles.headline4),
        Text('Headline 5', style: AppTextStyles.headline5),
        Text('Headline 6', style: AppTextStyles.headline6),
        SizedBox(height: AppDimensions.spaceM),
        Text('Subtitle 1', style: AppTextStyles.subtitle1),
        Text('Subtitle 2', style: AppTextStyles.subtitle2),
        SizedBox(height: AppDimensions.spaceM),
        Text('Body 1 - Regular body text', style: AppTextStyles.body1),
        Text('Body 2 - Smaller body text', style: AppTextStyles.body2),
        SizedBox(height: AppDimensions.spaceM),
        Text('Caption text', style: AppTextStyles.caption),
        Text('OVERLINE TEXT', style: AppTextStyles.overline),
        SizedBox(height: AppDimensions.spaceM),
        Text('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ', style: AppTextStyles.arabicLarge),
      ],
    );
  }

  // ===== BUTTONS SECTION =====
  Widget _buildButtonsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PrimaryButton(
          text: 'Primary Button',
          onPressed: () {
            _showSnackbar('Primary button pressed');
          },
        ),
        SizedBox(height: AppDimensions.spaceS),
        PrimaryButton(
          text: 'With Icon',
          icon: Icons.check,
          onPressed: () {},
        ),
        SizedBox(height: AppDimensions.spaceS),
        PrimaryButton(
          text: 'Loading',
          isLoading: _isButtonLoading,
          onPressed: () {
            setState(() => _isButtonLoading = true);
            Future.delayed(Duration(seconds: 2), () {
              setState(() => _isButtonLoading = false);
            });
          },
        ),
        SizedBox(height: AppDimensions.spaceS),
        PrimaryButton(
          text: 'Disabled',
          isDisabled: true,
          onPressed: () {},
        ),
        SizedBox(height: AppDimensions.spaceM),
        SecondaryButton(
          text: 'Secondary Button',
          onPressed: () {
            _showSnackbar('Secondary button pressed');
          },
        ),
        SizedBox(height: AppDimensions.spaceS),
        SecondaryButton(
          text: 'With Icon',
          icon: Icons.bookmark,
          onPressed: () {},
        ),
        SizedBox(height: AppDimensions.spaceM),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButtonCustom(
              text: 'Text Button',
              onPressed: () {},
            ),
            SizedBox(width: AppDimensions.spaceM),
            TextButtonCustom(
              text: 'With Icon',
              icon: Icons.info,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: AppDimensions.spaceM),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButtonCustom(
              icon: Icons.favorite,
              onPressed: () {},
            ),
            SizedBox(width: AppDimensions.spaceM),
            IconButtonCustom(
              icon: Icons.share,
              onPressed: () {},
              backgroundColor: AppColors.primaryLight,
            ),
            SizedBox(width: AppDimensions.spaceM),
            IconButtonCustom(
              icon: Icons.bookmark,
              onPressed: () {},
              color: AppColors.accent,
              backgroundColor: AppColors.accentLight,
            ),
          ],
        ),
      ],
    );
  }

  // ===== CARDS SECTION =====
  Widget _buildCardsSection() {
    return Column(
      children: [
        InfoCard(
          icon: Icons.book,
          title: 'Last Read',
          subtitle: 'Al-Fatihah, Ayah 5',
          onTap: () {
            _showSnackbar('Info card tapped');
          },
        ),
        SizedBox(height: AppDimensions.spaceM),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: 'Surahs',
                value: '15',
                icon: Icons.book,
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: AppDimensions.spaceM),
            Expanded(
              child: StatCard(
                title: 'Minutes',
                value: '45',
                icon: Icons.timer,
                color: AppColors.accent,
              ),
            ),
          ],
        ),
        SizedBox(height: AppDimensions.spaceM),
        FeatureCard(
          title: 'Quran',
          description: 'Read and listen to the Holy Quran',
          icon: Icons.book,
          gradient: AppColors.quranGradient,
          onTap: () {
            _showSnackbar('Feature card tapped');
          },
        ),
        SizedBox(height: AppDimensions.spaceM),
        Container(
          padding: EdgeInsets.all(AppDimensions.paddingM),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          child: Row(
            children: [
              ActionCard(
                icon: Icons.history,
                title: 'Last Read',
                onTap: () {},
              ),
              SizedBox(width: 12),
              ActionCard(
                icon: Icons.bookmark,
                title: 'Bookmarks',
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: AppDimensions.spaceM),
        SummaryCard(
          title: 'Today\'s Progress',
          items: [
            SummaryItem(
              icon: Icons.book,
              label: 'Surahs Read',
              value: '3',
            ),
            SummaryItem(
              icon: Icons.timer,
              label: 'Minutes',
              value: '45',
            ),
            SummaryItem(
              icon: Icons.bookmark,
              label: 'Bookmarks',
              value: '12',
            ),
          ],
          onViewAll: () {
            _showSnackbar('View all tapped');
          },
        ),
      ],
    );
  }

  // ===== INPUTS SECTION =====
  Widget _buildInputsSection() {
    return Column(
      children: [
        TextFieldCustom(
          label: 'Email',
          hint: 'Enter your email',
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: AppDimensions.spaceM),
        TextFieldCustom(
          label: 'Password',
          hint: 'Enter your password',
          prefixIcon: Icons.lock,
          obscureText: true,
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: () {},
          ),
        ),
        SizedBox(height: AppDimensions.spaceM),
        SearchField(
          hint: 'Search surah...',
          controller: _searchController,
          onChanged: (value) {},
        ),
      ],
    );
  }

  // ===== DIALOGS SECTION =====
  Widget _buildDialogsSection() {
    return Wrap(
      spacing: AppDimensions.spaceM,
      runSpacing: AppDimensions.spaceM,
      children: [
        PrimaryButton(
          text: 'Confirm Dialog',
          onPressed: () {
            ConfirmDialog.show(
              context: context,
              title: 'Delete Bookmark',
              message: 'Are you sure you want to delete this bookmark?',
              confirmText: 'Delete',
              cancelText: 'Cancel',
              icon: Icons.delete_outline,
              iconColor: AppColors.error,
              onConfirm: () {
                _showSnackbar('Confirmed');
              },
            );
          },
        ),
        SecondaryButton(
          text: 'Info Dialog',
          onPressed: () {
            InfoDialog.show(
              context: context,
              title: 'About',
              message: 'Tumbuh Iman v1.0.0\n\nA comprehensive Islamic app',
              icon: Icons.info_outline,
            );
          },
        ),
        SecondaryButton(
          text: 'Error Dialog',
          onPressed: () {
            ErrorDialog.show(
              context: context,
              title: 'Error',
              message: 'Failed to load data. Please try again.',
              onRetry: () {
                _showSnackbar('Retry tapped');
              },
            );
          },
        ),
        SecondaryButton(
          text: 'Success Dialog',
          onPressed: () {
            SuccessDialog.show(
              context: context,
              title: 'Success',
              message: 'Bookmark added successfully!',
            );
          },
        ),
        SecondaryButton(
          text: 'Bottom Sheet',
          onPressed: () {
            CustomBottomSheet.show(
              context: context,
              title: 'Filter Options',
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.filter_1),
                    title: Text('Option 1'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.filter_2),
                    title: Text('Option 2'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.filter_3),
                    title: Text('Option 3'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // ===== INDICATORS SECTION =====
  Widget _buildIndicatorsSection() {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: LoadingIndicator(
            message: 'Loading...',
          ),
        ),
        SizedBox(height: AppDimensions.spaceM),
        ProgressIndicatorCustom(
          progress: 0.65,
          label: 'Quran Progress',
        ),
        SizedBox(height: AppDimensions.spaceM),
        Text('Shimmer Loading:', style: AppTextStyles.subtitle2),
        SizedBox(height: AppDimensions.spaceS),
        Row(
          children: [
            ShimmerCircle(size: 40),
            SizedBox(width: AppDimensions.spaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerLine(width: double.infinity, height: 16),
                  SizedBox(height: AppDimensions.spaceS),
                  ShimmerLine(width: 150, height: 12),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ===== STATES SECTION =====
  Widget _buildStatesSection() {
    return Column(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          child: ErrorView(
            message: 'Failed to load data',
            onRetry: () {
              _showSnackbar('Retry tapped');
            },
          ),
        ),
        SizedBox(height: AppDimensions.spaceM),
        Container(
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          child: EmptyState(
            title: 'No Bookmarks',
            message: 'You haven\'t bookmarked any ayahs yet',
            icon: Icons.bookmark_border,
            onAction: () {
              _showSnackbar('Action tapped');
            },
            actionText: 'Browse Quran',
          ),
        ),
        SizedBox(height: AppDimensions.spaceM),
        Container(
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          child: SuccessView(
            title: 'Completed!',
            message: 'You have finished reading this surah',
            onAction: () {
              _showSnackbar('Action tapped');
            },
            actionText: 'Continue',
          ),
        ),
      ],
    );
  }

  // ===== MISC SECTION =====
  Widget _buildMiscSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Avatars:', style: AppTextStyles.subtitle2),
        SizedBox(height: AppDimensions.spaceS),
        Row(
          children: [
            Avatar(name: 'John Doe', size: 32),
            SizedBox(width: AppDimensions.spaceM),
            Avatar(name: 'Jane Smith', size: 40),
            SizedBox(width: AppDimensions.spaceM),
            Avatar(name: 'Ahmad Ali', size: 48),
            SizedBox(width: AppDimensions.spaceM),
            Avatar(name: 'Sarah Lee', size: 56),
          ],
        ),
        SizedBox(height: AppDimensions.spaceM),
        Text('Badges:', style: AppTextStyles.subtitle2),
        SizedBox(height: AppDimensions.spaceS),
        Wrap(
          spacing: AppDimensions.spaceS,
          runSpacing: AppDimensions.spaceS,
          children: [
            Badge(text: 'New', backgroundColor: AppColors.accent),
            Badge(text: 'Popular', backgroundColor: AppColors.primary),
            Badge(text: 'Featured', backgroundColor: AppColors.info),
          ],
        ),
        SizedBox(height: AppDimensions.spaceM),
        Text('Chips:', style: AppTextStyles.subtitle2),
        SizedBox(height: AppDimensions.spaceS),
        Wrap(
          spacing: AppDimensions.spaceS,
          runSpacing: AppDimensions.spaceS,
          children: [
            ChipCustom(label: 'Juz 1', isSelected: true, onTap: () {}),
            ChipCustom(label: 'Juz 2', onTap: () {}),
            ChipCustom(label: 'Juz 3', icon: Icons.check, onTap: () {}),
            ChipCustom(
              label: 'With Delete',
              onTap: () {},
              onDelete: () {
                _showSnackbar('Delete tapped');
              },
            ),
          ],
        ),
        SizedBox(height: AppDimensions.spaceM),
        Text('Dividers:', style: AppTextStyles.subtitle2),
        SizedBox(height: AppDimensions.spaceS),
        DividerCustom(),
        SizedBox(height: AppDimensions.spaceM),
        DividerCustom(text: 'OR'),
      ],
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}