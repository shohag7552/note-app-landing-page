import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

/// Hero section — headline, dual CTAs, and a real phone screenshot.
class HeroSection extends StatelessComponent {
  const HeroSection({super.key, required this.isDark});

  final bool isDark;

  @override
  Component build(BuildContext context) {
    // ── Page theme tokens ──────────────────────────────────────────────────
    final sectionBg   = isDark ? 'bg-neutral-950' : 'bg-white';
    final headingText = isDark ? 'text-neutral-100' : 'text-neutral-900';
    final bodyText    = isDark ? 'text-neutral-400' : 'text-neutral-600';
    final borderSep   = isDark ? 'border-neutral-800/60' : 'border-slate-200';
    final secBtnCls   = isDark
        ? 'border-neutral-700 text-neutral-300 hover:border-neutral-500 hover:text-neutral-100'
        : 'border-slate-300 text-neutral-700 hover:border-slate-400 hover:text-neutral-900';

    // ── Phone bezel tokens ─────────────────────────────────────────────────
    final phoneBg    = isDark ? 'bg-neutral-800' : 'bg-neutral-300';
    final phoneRing  = isDark ? 'ring-neutral-700/50' : 'ring-neutral-400/40';
    final notchBg    = isDark ? 'bg-neutral-950' : 'bg-neutral-50';
    final notchPill  = isDark ? 'bg-neutral-900 border-neutral-700' : 'bg-neutral-200 border-neutral-300';
    final homeBar    = isDark ? 'bg-neutral-500' : 'bg-neutral-400';

    // Switch screenshot based on page theme
    final screenshot = isDark
        ? '/images/app-home-dark.jpeg'
        : '/images/app-home-light.jpeg';

    return section(
      id: 'hero',
      classes:
          'relative min-h-screen pt-16 flex items-center '
          'overflow-hidden $sectionBg transition-colors duration-500',
      [
        // Background glow decorations
        div(
          classes:
              'absolute top-1/3 right-1/4 w-96 h-96 '
              'bg-$primaryColor-500/8 rounded-full blur-3xl pointer-events-none',
          [],
        ),
        div(
          classes:
              'absolute bottom-1/4 left-1/3 w-72 h-72 '
              'bg-$primaryColor-500/5 rounded-full blur-3xl pointer-events-none',
          [],
        ),

        div(
          classes: 'relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20 w-full',
          [
            div(
              classes: 'grid grid-cols-1 lg:grid-cols-2 gap-16 items-center',
              [
                // ════════════════════ Left column ════════════════════
                div(
                  classes: 'flex flex-col gap-8',
                  [
                    // Badge
                    div(
                      classes:
                          'w-fit px-3 py-1.5 rounded-full '
                          'border border-$primaryColor-500/30 bg-$primaryColor-500/10',
                      [
                        span(
                          classes:
                              'text-$primaryColor-400 text-xs font-semibold '
                              'tracking-widest uppercase',
                          [.text('Local-First · Always Private')],
                        ),
                      ],
                    ),

                    // Headline
                    h1(
                      classes:
                          'text-5xl sm:text-6xl font-black $headingText '
                          'leading-[1.1] tracking-tight transition-colors duration-500',
                      [
                        .text('Your Thoughts.'),
                        br(),
                        span(
                          classes: 'text-$primaryColor-400',
                          [.text('Secured locally.')],
                        ),
                        br(),
                        .text('Backed up safely.'),
                      ],
                    ),

                    // Subheading
                    p(
                      classes:
                          'text-lg $bodyText leading-relaxed max-w-lg '
                          'transition-colors duration-500',
                      [
                        .text(
                          'A lightning-fast note companion powered by a local SQLite '
                          'database. Works 100% offline, launches instantly, and locks '
                          'every thought behind biometric or PIN protection.',
                        ),
                      ],
                    ),

                    // CTAs
                    div(
                      classes: 'flex flex-col sm:flex-row gap-4',
                      [
                        a(
                          id: 'download',
                          classes:
                              'inline-flex items-center justify-center gap-2 '
                              'px-7 py-4 rounded-2xl '
                              'bg-$primaryColor-500 hover:bg-$primaryColor-400 '
                              'text-neutral-950 text-sm font-bold transition-all duration-200 '
                              'active:scale-[0.98] shadow-xl shadow-$primaryColor-500/20',
                          href: '#download',
                          [.text('Get it on Google Play')],
                        ),
                        a(
                          classes:
                              'inline-flex items-center justify-center gap-2 '
                              'px-7 py-4 rounded-2xl border $secBtnCls '
                              'text-sm font-semibold transition-all duration-200',
                          href: '#demo',
                          [.text('Watch Preview')],
                        ),
                      ],
                    ),

                    // Stats row
                    div(
                      classes:
                          'flex gap-10 pt-4 mt-2 border-t $borderSep '
                          'transition-colors duration-500',
                      [
                        for (final s in [
                          ('100%', 'Offline Ready'),
                          ('0ms', 'Cold Start'),
                          ('AES-256', 'Data Safety'),
                        ])
                          div(
                            classes: 'flex flex-col gap-1',
                            [
                              span(
                                classes:
                                    'text-2xl sm:text-3xl font-extrabold '
                                    'text-$primaryColor-400 tracking-tight',
                                [.text(s.$1)],
                              ),
                              span(
                                classes: 'text-xs text-neutral-500 font-medium',
                                [.text(s.$2)],
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),

                // ════════════════════ Right column – Real phone screenshot ════════════════════
                div(
                  classes: 'flex justify-center lg:justify-end',
                  [
                    div(
                      classes: 'relative',
                      [
                        // Ambient glow behind the phone
                        div(
                          classes:
                              'absolute inset-0 -z-10 scale-75 blur-3xl '
                              'rounded-full bg-$primaryColor-500/20',
                          [],
                        ),

                        // ── Phone shell ──
                        div(
                          classes:
                              'rounded-[3rem] $phoneBg p-[10px] '
                              'shadow-2xl ring-2 $phoneRing '
                              'transition-colors duration-500',
                          [
                            // Dynamic island / notch bar
                            div(
                              classes:
                                  'flex justify-center items-center '
                                  'py-3 rounded-t-[2.5rem] $notchBg '
                                  'transition-colors duration-500',
                              [
                                div(
                                  classes:
                                      'w-24 h-[18px] rounded-full '
                                      '$notchPill border',
                                  [],
                                ),
                              ],
                            ),

                            // Screenshot viewport
                            div(
                              classes: 'overflow-hidden rounded-b-[2.5rem]',
                              styles: Styles(
                                width: 260.px,
                                height: 520.px,
                              ),
                              [
                                img(
                                  src: screenshot,
                                  classes:
                                      'w-full h-full object-cover object-top '
                                      'transition-all duration-500',
                                  attributes: {
                                    'alt': isDark
                                        ? 'Slate Notes dark mode'
                                        : 'Slate Notes light mode',
                                    'loading': 'eager',
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Home bar
                        div(
                          classes:
                              'absolute -bottom-4 left-1/2 -translate-x-1/2 '
                              'w-24 h-[5px] rounded-full $homeBar '
                              'transition-colors duration-500',
                          [],
                        ),
                      ],
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
