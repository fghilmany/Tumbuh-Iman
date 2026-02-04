# Tumbuh Iman - UI Components Documentation

Complete guide to all reusable UI components in the Tumbuh Iman app.

---

## Table of Contents

1. [Theme System](#theme-system)
2. [Buttons](#buttons)
3. [Cards](#cards)
4. [Inputs](#inputs)
5. [Dialogs](#dialogs)
6. [Indicators](#indicators)
7. [States](#states)
8. [Navigation](#navigation)
9. [Misc](#misc)
10. [Usage Examples](#usage-examples)

---

## Theme System

### Colors (`app_colors.dart`)

Based on Tumbuh Iman brand identity:

```dart
// Primary Colors
AppColors.primary           // #6B9E5E - Main green
AppColors.primaryDark       // #1B4332 - Dark green
AppColors.primaryLight      // #95C88D - Light green
AppColors.primaryVeryLight  // #D4E8D0 - Very light green

// Accent Colors
AppColors.accent            // #F4C542 - Gold/Yellow
AppColors.accentDark        // #D4A637 - Darker gold
AppColors.accentLight       // #F9E5A3 - Light gold

// Neutral Colors
AppColors.cream             // #F5E6D3 - Cream/Beige
AppColors.background        // #FAF9F6 - Off-white
AppColors.surface           // #FFFFFF - White

// Text Colors
AppColors.textPrimary       // Main text
AppColors.textSecondary     // Secondary text
AppColors.textOnPrimary     // Text on primary background

// Semantic Colors
AppColors.success           // Green
AppColors.error             // Red
AppColors.warning           // Gold
AppColors.info              // Blue
```

### Text Styles (`app_text_styles.dart`)

```dart
// Headlines
AppTextStyles.headline1     // 34px, bold
AppTextStyles.headline2     // 28px, bold
AppTextStyles.headline3     // 24px, bold
AppTextStyles.headline4     // 20px, bold
AppTextStyles.headline5     // 18px, bold
AppTextStyles.headline6     // 16px, bold

// Body
AppTextStyles.body1         // 16px, regular
AppTextStyles.body2         // 14px, regular

// Subtitles
AppTextStyles.subtitle1     // 16px, semi-bold
AppTextStyles.subtitle2     // 14px, semi-bold

// Others
AppTextStyles.button        // Button text
AppTextStyles.caption       // Small text
AppTextStyles.overline      // Uppercase small text

// Arabic (Quran)
AppTextStyles.arabicLarge   // 32px, Amiri font
AppTextStyles.arabicMedium  // 24px, Amiri font
AppTextStyles.arabicSmall   // 18px, Amiri font
```

### Dimensions (`app_dimensions.dart`)

```dart
// Spacing
AppDimensions.spaceXS       // 4dp
AppDimensions.spaceS        // 8dp
AppDimensions.spaceM        // 16dp
AppDimensions.spaceL        // 24dp
AppDimensions.spaceXL       // 32dp

// Radius
AppDimensions.radiusS       // 8dp
AppDimensions.radiusM       // 12dp
AppDimensions.radiusL       // 16dp
AppDimensions.radiusFull    // 999dp (pill shape)

// Icons
AppDimensions.iconS         // 20dp
AppDimensions.iconM         // 24dp
AppDimensions.iconL         // 32dp
AppDimensions.iconXL        // 48dp
```

---

## Buttons

### 1. PrimaryButton

Primary action button with green background.

**Usage:**
```dart
PrimaryButton(
  text: 'Continue',
  onPressed: () {},
  icon: Icons.arrow_forward,
  isLoading: false,
)
```

**Props:**
- `text` (required): Button text
- `onPressed` (required): Callback function
- `icon` (optional): Leading icon
- `isLoading` (optional): Show loading indicator
- `isDisabled` (optional): Disable button
- `width` (optional): Custom width
- `height` (optional): Custom height

---

### 2. SecondaryButton

Outlined button with green border.

**Usage:**
```dart
SecondaryButton(
  text: 'Cancel',
  onPressed: () {},
  icon: Icons.close,
)
```

**Props:** Same as PrimaryButton

---

### 3. TextButtonCustom

Text-only button without background.

**Usage:**
```dart
TextButtonCustom(
  text: 'Learn More',
  onPressed: () {},
  icon: Icons.info_outline,
  color: AppColors.primary,
)
```

---

### 4. IconButtonCustom

Icon-only button.

**Usage:**
```dart
IconButtonCustom(
  icon: Icons.favorite,
  onPressed: () {},
  color: AppColors.error,
  backgroundColor: AppColors.primaryLight,
)
```

---

### 5. FloatingActionButtonCustom

Floating action button with gold background.

**Usage:**
```dart
FloatingActionButtonCustom(
  icon: Icons.add,
  onPressed: () {},
  tooltip: 'Add Item',
)

// Extended version
FloatingActionButtonCustom(
  icon: Icons.add,
  onPressed: () {},
  isExtended: true,
  label: 'Add Surah',
)
```

---

## Cards

### 1. InfoCard

Card with icon, title, subtitle, and arrow.

**Usage:**
```dart
InfoCard(
  icon: Icons.book,
  title: 'Last Read',
  subtitle: 'Al-Fatihah, Ayah 5',
  onTap: () {},
  iconColor: AppColors.primary,
)
```

---

### 2. StatCard

Card displaying a statistic.

**Usage:**
```dart
StatCard(
  title: 'Surahs Read',
  value: '15',
  icon: Icons.check_circle,
  color: AppColors.success,
  subtitle: 'This month',
  onTap: () {},
)
```

---

### 3. FeatureCard

Large card with gradient background for features.

**Usage:**
```dart
FeatureCard(
  title: 'Quran',
  description: 'Read and listen to the Holy Quran',
  icon: Icons.book,
  gradient: AppColors.quranGradient,
  onTap: () {},
)
```

---

### 4. ActionCard

Small card for quick actions (used in groups).

**Usage:**
```dart
Row(
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
)
```

---

### 5. SummaryCard

Card with list of summary items.

**Usage:**
```dart
SummaryCard(
  title: 'Today\'s Progress',
  items: [
    SummaryItem(
      icon: Icons.book,
      label: 'Surahs',
      value: '3',
    ),
    SummaryItem(
      icon: Icons.timer,
      label: 'Minutes',
      value: '45',
    ),
  ],
  onViewAll: () {},
)
```

---

## Inputs

### 1. TextFieldCustom

Standard text input field.

**Usage:**
```dart
TextFieldCustom(
  label: 'Email',
  hint: 'Enter your email',
  controller: _emailController,
  validator: (value) {
    if (value?.isEmpty ?? true) {
      return 'Email is required';
    }
    return null;
  },
  prefixIcon: Icons.email,
  keyboardType: TextInputType.emailAddress,
)
```

---

### 2. SearchField

Search input with search icon and clear button.

**Usage:**
```dart
SearchField(
  hint: 'Search surah...',
  controller: _searchController,
  onChanged: (value) {
    // Handle search
  },
  onClear: () {
    // Handle clear
  },
)
```

---

## Dialogs

### 1. ConfirmDialog

Confirmation dialog with two buttons.

**Usage:**
```dart
ConfirmDialog.show(
  context: context,
  title: 'Delete Bookmark',
  message: 'Are you sure you want to delete this bookmark?',
  confirmText: 'Delete',
  cancelText: 'Cancel',
  icon: Icons.delete_outline,
  iconColor: AppColors.error,
  onConfirm: () {
    // Handle confirm
  },
);
```

---

### 2. InfoDialog

Information dialog with single button.

**Usage:**
```dart
InfoDialog.show(
  context: context,
  title: 'About',
  message: 'Tumbuh Iman v1.0.0',
  buttonText: 'OK',
  icon: Icons.info_outline,
);
```

---

### 3. ErrorDialog

Error dialog (red icon).

**Usage:**
```dart
ErrorDialog.show(
  context: context,
  title: 'Error',
  message: 'Failed to load data',
  onRetry: () {
    // Retry action
  },
);
```

---

### 4. SuccessDialog

Success dialog (green icon).

**Usage:**
```dart
SuccessDialog.show(
  context: context,
  title: 'Success',
  message: 'Bookmark added successfully',
);
```

---

### 5. CustomBottomSheet

Modal bottom sheet.

**Usage:**
```dart
CustomBottomSheet.show(
  context: context,
  title: 'Filter',
  child: Column(
    children: [
      // Your content here
    ],
  ),
);
```

---

## Indicators

### 1. LoadingIndicator

Centered circular loading indicator.

**Usage:**
```dart
LoadingIndicator(
  message: 'Loading surahs...',
  color: AppColors.primary,
)
```

---

### 2. ProgressIndicatorCustom

Linear progress bar with label.

**Usage:**
```dart
ProgressIndicatorCustom(
  progress: 0.65, // 0.0 to 1.0
  label: 'Quran Progress',
  color: AppColors.primary,
)
```

---

### 3. ShimmerLoading

Shimmer effect for loading skeleton.

**Usage:**
```dart
ShimmerBox(width: 100, height: 20)
ShimmerLine(width: 200, height: 16)
ShimmerCircle(size: 40)
```

---

### 4. SkeletonLoader

Pre-built skeleton loader for lists.

**Usage:**
```dart
SkeletonLoader()
```

---

## States

### 1. ErrorView

Full-screen error state.

**Usage:**
```dart
ErrorView(
  message: 'Failed to load data',
  onRetry: () {
    // Retry action
  },
  icon: Icons.error_outline,
)
```

---

### 2. EmptyState

Empty state with icon and message.

**Usage:**
```dart
EmptyState(
  title: 'No Bookmarks',
  message: 'You haven\'t bookmarked any ayahs yet',
  icon: Icons.bookmark_border,
  onAction: () {
    // Optional action
  },
  actionText: 'Browse Quran',
)
```

---

### 3. NoConnectionView

No internet connection state.

**Usage:**
```dart
NoConnectionView(
  onRetry: () {
    // Retry action
  },
)
```

---

### 4. SuccessView

Success state with green checkmark.

**Usage:**
```dart
SuccessView(
  title: 'Completed!',
  message: 'You have finished reading this surah',
  onAction: () {},
  actionText: 'Continue',
)
```

---

## Navigation

### 1. CustomAppBar

Customizable app bar.

**Usage:**
```dart
CustomAppBar(
  title: 'Quran',
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ),
  ],
)
```

---

### 2. BottomNavBar

Custom bottom navigation bar.

**Usage:**
```dart
BottomNavBar(
  currentIndex: _selectedIndex,
  onTap: (index) {
    setState(() => _selectedIndex = index);
  },
  items: [
    BottomNavItem(
      icon: Icons.book_outlined,
      activeIcon: Icons.book,
      label: 'Quran',
    ),
    // More items...
  ],
)
```

---

### 3. DrawerMenu

Navigation drawer.

**Usage:**
```dart
DrawerMenu(
  userName: 'John Doe',
  userEmail: 'john@example.com',
  items: [
    DrawerMenuItem(
      icon: Icons.settings,
      title: 'Settings',
      onTap: () {},
    ),
    DrawerMenuItem.divider(),
    DrawerMenuItem(
      icon: Icons.logout,
      title: 'Logout',
      onTap: () {},
    ),
  ],
)
```

---

## Misc

### 1. Avatar

User avatar with initials fallback.

**Usage:**
```dart
Avatar(
  imageUrl: 'https://example.com/avatar.jpg',
  name: 'John Doe',
  size: 48,
)
```

---

### 2. Badge

Small label badge.

**Usage:**
```dart
Badge(
  text: 'New',
  backgroundColor: AppColors.accent,
  textColor: AppColors.textOnAccent,
)
```

---

### 3. ChipCustom

Selectable chip.

**Usage:**
```dart
ChipCustom(
  label: 'Juz 1',
  icon: Icons.check,
  isSelected: true,
  onTap: () {},
  onDelete: () {},
)
```

---

### 4. DividerCustom

Divider with optional text.

**Usage:**
```dart
DividerCustom()

// With text
DividerCustom(text: 'OR')
```

---

### 5. LanguageSelector

Language selection popup menu.

**Usage:**
```dart
LanguageSelector()
```

---

### 6. RefreshIndicatorCustom

Pull-to-refresh wrapper.

**Usage:**
```dart
RefreshIndicatorCustom(
  onRefresh: () async {
    // Refresh logic
  },
  child: ListView(...),
)
```

---

## Usage Examples

### Complete Page Example

```dart
class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Example',
        actions: [LanguageSelector()],
      ),
      body: RefreshIndicatorCustom(
        onRefresh: () async {},
        child: ListView(
          padding: EdgeInsets.all(AppDimensions.paddingM),
          children: [
            // Feature Cards
            FeatureCard(
              title: 'Quran',
              description: 'Read the Holy Quran',
              icon: Icons.book,
              gradient: AppColors.primaryGradient,
              onTap: () {},
            ),
            SizedBox(height: AppDimensions.spaceM),
            
            // Action Cards
            Row(
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
            SizedBox(height: AppDimensions.spaceM),
            
            // Stat Cards
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
            
            // Info Cards
            InfoCard(
              icon: Icons.book,
              title: 'Last Read',
              subtitle: 'Al-Fatihah, Ayah 5',
              onTap: () {},
            ),
            
            // Buttons
            PrimaryButton(
              text: 'Continue Reading',
              onPressed: () {},
              icon: Icons.play_arrow,
            ),
            SizedBox(height: AppDimensions.spaceS),
            SecondaryButton(
              text: 'View All',
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonCustom(
        icon: Icons.add,
        onPressed: () {},
      ),
    );
  }
}
```

---

## Testing Components

To view all components, run:

```bash
flutter run lib/presentation/pages/dev/component_showcase_page.dart
```

Or navigate to **Settings > Developer > Component Showcase** in the app.

---

## Contributing

When adding new components:

1. Place in appropriate folder (`buttons/`, `cards/`, etc.)
2. Follow naming convention: `component_name.dart`
3. Use theme colors and dimensions
4. Add documentation here
5. Add to showcase page

---

**Last Updated:** January 2026