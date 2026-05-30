import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

/// Fixed top navigation bar with global dark / light theme toggle.
class NavBar extends StatelessComponent {
  const NavBar({
    super.key,
    required this.isDark,
    required this.onToggle,
  });

  final bool isDark;
  final void Function() onToggle;

  // ── Heroicon paths ───────────────────────────────────────────────────────
  static const _sunPath =
      'M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364'
      '-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3'
      'm4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z';

  static const _moonPath =
      'M21.752 15.002A9.72 9.72 0 0 1 18 15.75c-5.385 0-9.75-4.365'
      '-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 0 0 3 11.25'
      'C3 16.635 7.365 21 12.75 21a9.753 9.753 0 0 0 9.002-5.998Z';

  @override
  Component build(BuildContext context) {
    final navBg    = isDark ? 'bg-neutral-950/90 border-neutral-800/60' : 'bg-white/90 border-slate-200';
    final linkCls  = isDark
        ? 'text-neutral-400 hover:text-neutral-100 hover:bg-neutral-800/60'
        : 'text-neutral-600 hover:text-neutral-900 hover:bg-slate-100';
    final brandCls = isDark ? 'text-neutral-100' : 'text-neutral-900';
    final toggleCls = isDark
        ? 'border-neutral-700 text-neutral-400 hover:text-$primaryColor-400 hover:border-neutral-500'
        : 'border-slate-300 text-neutral-500 hover:text-$primaryColor-600 hover:border-slate-400';

    return header(
      classes: 'fixed top-0 left-0 right-0 z-50 $navBg backdrop-blur-md border-b transition-colors duration-500',
      [
        div(
          classes: 'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8',
          [
            nav(
              classes: 'flex h-16 items-center justify-between',
              [
                // ── Brand ──
                a(
                  classes: 'flex items-center gap-2.5',
                  href: '#',
                  [
                    img(
                      src: '/images/logo.png',
                      classes: 'w-9 h-9 object-contain shrink-0',
                      attributes: const {'alt': 'Slate Notes logo'},
                    ),
                    span(
                      classes: 'text-xl font-bold $brandCls tracking-tight transition-colors duration-500',
                      [.text('Slate Notes')],
                    ),
                  ],
                ),

                // ── Desktop nav links ──
                ul(
                  classes: 'hidden md:flex items-center gap-1',
                  [
                    for (final item in [
                      ('Features', '#features'),
                      ('Security', '#security'),
                      ('FAQ', '#faq'),
                      ('Contact', '#contact'),
                    ])
                      li([
                        a(
                          classes:
                              'px-4 py-2 rounded-lg text-sm font-medium '
                              '$linkCls transition-all duration-200',
                          href: item.$2,
                          [.text(item.$1)],
                        ),
                      ]),
                  ],
                ),

                // ── Right-side controls ──
                div(
                  classes: 'flex items-center gap-3',
                  [
                    // Theme toggle button (sun ↔ moon)
                    button(
                      onClick: onToggle,
                      classes:
                          'w-9 h-9 rounded-full border flex items-center justify-center '
                          '$toggleCls transition-all duration-200',
                      [
                        svg(
                          classes: 'w-4 h-4',
                          viewBox: '0 0 24 24',
                          [
                            path(
                              d: isDark ? _sunPath : _moonPath,
                              attributes: const {
                                'fill': 'none',
                                'stroke': 'currentColor',
                                'stroke-width': '1.5',
                                'stroke-linecap': 'round',
                                'stroke-linejoin': 'round',
                              },
                              [],
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Download CTA
                    a(
                      classes:
                          'inline-flex items-center gap-2 px-5 py-2.5 rounded-xl '
                          'bg-$primaryColor-500 hover:bg-$primaryColor-400 text-neutral-950 '
                          'text-sm font-bold transition-all duration-200 active:scale-95 '
                          'shadow-lg shadow-$primaryColor-500/25',
                      href: '#download',
                      [.text('Download Beta')],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
