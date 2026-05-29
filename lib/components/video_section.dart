import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

/// App-demo section — YouTube Shorts inside a clean portrait phone bezel.
class VideoSection extends StatelessComponent {
  const VideoSection({super.key, required this.isDark});

  final bool isDark;

  static const _embedUrl =
      'https://www.youtube.com/embed/SF1_ULaG-rE'
      '?autoplay=1&mute=1&loop=1&playlist=SF1_ULaG-rE'
      '&rel=0&playsinline=1';

  // Phone dimensions — 9 : 16 ratio for the video area
  static const _videoW = 252; // px
  static const _videoH = 448; // 252 × 16/9 ≈ 448
  static const _notchH = 44;  // px  — notch bar height

  @override
  Component build(BuildContext context) {
    final sectionBg   = isDark ? 'bg-neutral-950' : 'bg-white';
    final headingText = isDark ? 'text-neutral-100' : 'text-neutral-900';
    final bodyText    = isDark ? 'text-neutral-400' : 'text-neutral-600';
    final hlTitle     = isDark ? 'text-neutral-100' : 'text-neutral-900';
    final hlBody      = isDark ? 'text-neutral-500' : 'text-neutral-600';
    final iconBg      = isDark
        ? 'bg-$primaryColor-500/15 group-hover:bg-$primaryColor-500/25'
        : 'bg-$primaryColor-500/10 group-hover:bg-$primaryColor-500/20';

    return section(
      id: 'demo',
      classes: 'py-28 $sectionBg overflow-hidden transition-colors duration-500',
      [
        div(
          classes: 'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8',
          [
            // ── Section header ──────────────────────────────────────────────
            div(
              classes: 'text-center mb-16',
              [
                span(
                  classes:
                      'text-$primaryColor-400 text-sm font-semibold '
                      'tracking-widest uppercase',
                  [.text('See It In Action')],
                ),
                h2(
                  classes:
                      'mt-3 text-4xl sm:text-5xl font-black '
                      '$headingText tracking-tight transition-colors duration-500',
                  [.text('Feel the Difference.')],
                ),
                p(
                  classes:
                      'mt-4 $bodyText text-lg max-w-xl mx-auto '
                      'transition-colors duration-500',
                  [
                    .text(
                      'Watch how Slate Notes keeps your thoughts organised, '
                      'secured, and always within reach.',
                    ),
                  ],
                ),
              ],
            ),

            // ── Two-column layout ────────────────────────────────────────────
            div(
              classes:
                  'flex flex-col lg:flex-row items-center '
                  'justify-center gap-16 lg:gap-20',
              [
                // ════ Phone mockup ════════════════════════════════════════════
                div(
                  classes: 'relative shrink-0 flex flex-col items-center',
                  [
                    // Ambient glow behind the device
                    div(
                      classes:
                          'absolute inset-0 -z-10 scale-90 blur-3xl '
                          'rounded-full bg-$primaryColor-500/20',
                      [],
                    ),

                    // ── Outer shell (the physical frame) ──
                    div(
                      classes:
                          'relative rounded-[3.2rem] bg-neutral-800 '
                          'p-[10px] shadow-2xl '
                          'ring-1 ring-neutral-700/60 '
                          'ring-offset-0',
                      [
                        // ── Inner screen surface — clips everything flush ──
                        div(
                          classes:
                              'rounded-[2.5rem] overflow-hidden '
                              'bg-black flex flex-col',
                          styles: Styles(width: _videoW.px),
                          [
                            // Notch bar
                            div(
                              classes:
                                  'flex items-center justify-center '
                                  'bg-black shrink-0',
                              styles: Styles(height: _notchH.px),
                              [
                                // Pill-shaped dynamic island
                                div(
                                  classes:
                                      'w-24 h-[18px] rounded-full '
                                      'bg-neutral-900 border border-neutral-700',
                                  [],
                                ),
                              ],
                            ),

                            // Video viewport — exact 9:16
                            div(
                              classes: 'relative shrink-0',
                              styles: Styles(
                                width: _videoW.px,
                                height: _videoH.px,
                              ),
                              [
                                iframe(
                                  src: _embedUrl,
                                  classes:
                                      'absolute inset-0 w-full h-full',
                                  allow:
                                      'accelerometer; autoplay; '
                                      'clipboard-write; encrypted-media; '
                                      'gyroscope; picture-in-picture; '
                                      'web-share',
                                  attributes: const {
                                    'frameborder': '0',
                                    'allowfullscreen': '',
                                  },
                                  [],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Home-bar indicator below shell
                    div(
                      classes:
                          'mt-2 w-24 h-[5px] rounded-full bg-neutral-600',
                      [],
                    ),
                  ],
                ),

                // ════ Feature highlights ══════════════════════════════════════
                div(
                  classes: 'flex flex-col gap-8 max-w-sm w-full',
                  [
                    for (final hl in [
                      (
                        icon: 'M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z',
                        title: 'Instant Launch',
                        body:
                            'Notes open in under a second straight from '
                            'your lock screen—no login delay.',
                      ),
                      (
                        icon:
                            'M16.5 10.5V6.75a4.5 4.5 0 1 0-9 0v3.75'
                            'm-.75 11.25h10.5a2.25 2.25 0 0 0 2.25-2.25v-6.75'
                            'a2.25 2.25 0 0 0-2.25-2.25H6.75a2.25 2.25 0 0 0'
                            '-2.25 2.25v6.75a2.25 2.25 0 0 0 2.25 2.25z',
                        title: 'Biometric & PIN',
                        body:
                            'Protect every thought with fingerprint auth '
                            'or a 4-digit PIN with secure recovery.',
                      ),
                      (
                        icon:
                            'M2.25 15a4.5 4.5 0 0 0 4.5 4.5H18'
                            'a3.75 3.75 0 0 0 1.332-7.257 3 3 0 0 0-3.758-3.848'
                            ' 5.25 5.25 0 0 0-10.233 2.33A4.502 4.502 0 0 0 2.25 15Z',
                        title: 'Optional Cloud Backup',
                        body:
                            'Sign in with Google to back up notes to an '
                            'isolated Appwrite bucket—fully encrypted.',
                      ),
                      (
                        icon:
                            'M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0'
                            '-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 0 0 3.09-3.09'
                            'L9 5.25l.813 2.846a4.5 4.5 0 0 0 3.09 3.09L15.75 12'
                            'l-2.846.813a4.5 4.5 0 0 0-3.09 3.09Z',
                        title: 'Custom Themes & Fonts',
                        body:
                            'Switch between dark and light mode, choose card '
                            'patterns, and pick your favourite font—all live.',
                      ),
                    ])
                      div(
                        classes: 'flex items-start gap-4 group',
                        [
                          div(
                            classes:
                                'shrink-0 w-11 h-11 rounded-xl '
                                'text-$primaryColor-400 $iconBg '
                                'flex items-center justify-center '
                                'transition-colors duration-300',
                            [
                              svg(
                                classes: 'w-5 h-5',
                                viewBox: '0 0 24 24',
                                [
                                  path(
                                    d: hl.icon,
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
                          div(
                            classes: 'flex flex-col gap-1',
                            [
                              h4(
                                classes:
                                    'text-sm font-bold $hlTitle '
                                    'transition-colors duration-500',
                                [.text(hl.title)],
                              ),
                              p(
                                classes:
                                    'text-sm $hlBody leading-relaxed '
                                    'transition-colors duration-500',
                                [.text(hl.body)],
                              ),
                            ],
                          ),
                        ],
                      ),

                    // YouTube external link
                    a(
                      classes:
                          'inline-flex items-center gap-2 text-sm '
                          'text-$primaryColor-400 hover:text-$primaryColor-300 '
                          'font-medium transition-colors duration-200',
                      href: 'https://youtube.com/shorts/SF1_ULaG-rE',
                      target: Target.blank,
                      [
                        span([.text('Watch on YouTube Shorts')]),
                        span(classes: 'text-lg', [.text('↗')]),
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
