import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/navbar.dart';
import 'components/hero_section.dart';
import 'components/features_section.dart';
import 'components/video_section.dart';
import 'components/faq_section.dart';
import 'components/theme_preview_section.dart';
import 'components/footer_section.dart';

/// Root component. Owns the global isDark flag and broadcasts it downward.
@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isDark = true;

  @override
  Component build(BuildContext context) {
    final pageBg = _isDark ? 'bg-neutral-950' : 'bg-white';

    return div(
      classes: '$pageBg min-h-screen font-sans antialiased transition-colors duration-500',
      [
        NavBar(isDark: _isDark, onToggle: () => setState(() => _isDark = !_isDark)),
        main_([
          HeroSection(isDark: _isDark),
          FeaturesSection(isDark: _isDark),
          VideoSection(isDark: _isDark),
          FaqSection(isDark: _isDark),
          ThemePreviewSection(pageIsDark: _isDark),
        ]),
        FooterSection(isDark: _isDark),
      ],
    );
  }
}
