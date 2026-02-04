## Assets Management

This project uses **flutter_gen** for type-safe asset management.

### Usage

```dart
import 'package:tumbuh_iman/gen/assets.gen.dart';

// Images
Assets.images.splashLogo.image()
Assets.images.homeBackground.path

// SVG Icons
Assets.icons.quran.svg(width: 24, height: 24)
Assets.icons.bookmark.path

// All available assets have auto-completion
Assets.  // ← Press Ctrl+Space to see all
```

### Adding New Assets

1. Add file to `assets/images/` or `assets/icons/`
2. Run: `flutter packages pub run build_runner build`
3. Use: `Assets.images.yourNewImage.image()`

### Generator Commands

```bash
# One-time generation
flutter packages pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate on file changes)
flutter packages pub run build_runner watch
```