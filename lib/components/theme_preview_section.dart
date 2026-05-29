import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

/// Interactive light/dark theme preview.
/// StatefulComponent nested inside @client App — no separate @client needed.
class ThemePreviewSection extends StatefulComponent {
  const ThemePreviewSection({super.key, required this.pageIsDark});

  final bool pageIsDark;

  @override
  State<ThemePreviewSection> createState() => _ThemePreviewSectionState();
}

class _ThemePreviewSectionState extends State<ThemePreviewSection> {
  bool _isPreviewDark = true;

  // ── Preview theme token helpers ──────────────────────────────────────────

  String get _cardBg       => _isPreviewDark ? 'bg-neutral-900 border-neutral-800'   : 'bg-white border-slate-200';
  String get _noteBg       => _isPreviewDark ? 'bg-neutral-800 border-neutral-700'   : 'bg-slate-50 border-slate-200';
  String get _headerBg     => _isPreviewDark ? 'bg-neutral-950 border-neutral-800'   : 'bg-slate-50 border-slate-200';
  String get _headingText  => _isPreviewDark ? 'text-neutral-100' : 'text-neutral-900';
  String get _bodyText     => _isPreviewDark ? 'text-neutral-400' : 'text-neutral-600';
  String get _mutedText    => _isPreviewDark ? 'text-neutral-600' : 'text-neutral-400';
  String get _pillActive   => _isPreviewDark ? 'bg-neutral-100 text-neutral-900'    : 'bg-neutral-900 text-neutral-100';
  String get _pillInactive => _isPreviewDark ? 'border-neutral-700 text-neutral-500' : 'border-slate-300 text-slate-500';
  String get _toggleBg    => _isPreviewDark ? 'bg-neutral-800' : 'bg-slate-200';

  String _btnClass(bool isThisActive) {
    if (isThisActive) {
      return 'px-5 py-2.5 rounded-xl bg-$primaryColor-500 text-neutral-950 font-semibold text-sm shadow-lg transition-all duration-300';
    }
    return _isPreviewDark
        ? 'px-5 py-2.5 rounded-xl text-neutral-400 text-sm font-medium transition-all duration-300 hover:text-neutral-200'
        : 'px-5 py-2.5 rounded-xl text-neutral-600 text-sm font-medium transition-all duration-300 hover:text-neutral-900';
  }

  @override
  Component build(BuildContext context) {
    // Outer section follows the page theme; preview card follows internal toggle.
    final sectionBg    = component.pageIsDark ? 'bg-neutral-950'   : 'bg-slate-50';
    final sectionHead  = component.pageIsDark ? 'text-neutral-100' : 'text-neutral-900';
    final sectionBody  = component.pageIsDark ? 'text-neutral-400' : 'text-neutral-600';

    return section(
      id: 'theme',
      classes: '$sectionBg py-28 transition-colors duration-500',
      [
        div(
          classes: 'max-w-5xl mx-auto px-4 sm:px-6 lg:px-8',
          [
            // ── Section header ──
            div(
              classes: 'text-center mb-12',
              [
                h2(
                  classes:
                      'text-4xl sm:text-5xl font-black tracking-tight '
                      '$sectionHead transition-colors duration-500',
                  [.text('Light. Dark. Always Beautiful.')],
                ),
                p(
                  classes:
                      'mt-4 $sectionBody text-lg transition-colors duration-500',
                  [
                    .text(
                      'Slate Notes adapts to your environment with a fully '
                      'reactive theme system. Toggle modes in a single tap.',
                    ),
                  ],
                ),
              ],
            ),

            // ── Toggle control ──
            div(
              classes: 'flex justify-center mb-10',
              [
                div(
                  classes:
                      'flex items-center gap-1.5 p-1.5 rounded-2xl '
                      '$_toggleBg transition-colors duration-500',
                  [
                    for (final opt in [
                      (label: 'Dark Mode', isDarkOpt: true),
                      (label: 'Light Mode', isDarkOpt: false),
                    ])
                      button(
                        classes: _btnClass(opt.isDarkOpt == _isPreviewDark),
                        onClick: () => setState(() => _isPreviewDark = opt.isDarkOpt),
                        [span([.text(opt.label)])],
                      ),
                  ],
                ),
              ],
            ),

            // ── App preview card ──
            div(
              classes:
                  'rounded-3xl border overflow-hidden shadow-2xl '
                  '$_cardBg transition-all duration-500',
              [
                // Mock app title bar
                div(
                  classes:
                      'flex items-center justify-between px-6 py-4 '
                      'border-b $_headerBg transition-colors duration-500',
                  [
                    // Window chrome dots
                    div(
                      classes: 'flex items-center gap-2',
                      [
                        div(classes: 'w-3 h-3 rounded-full bg-red-400/70', []),
                        div(classes: 'w-3 h-3 rounded-full bg-amber-400/70', []),
                        div(classes: 'w-3 h-3 rounded-full bg-green-400/70', []),
                      ],
                    ),
                    h3(
                      classes:
                          'text-base font-bold $_headingText transition-colors duration-500',
                      [.text('Notes  7')],
                    ),
                    div(
                      classes: 'flex gap-4',
                      [
                        span(
                          classes: '$_mutedText text-sm',
                          [.text('Search')],
                        ),
                        span(
                          classes: '$_mutedText text-sm',
                          [.text('Menu')],
                        ),
                      ],
                    ),
                  ],
                ),

                // Tab bar
                div(
                  classes:
                      'flex gap-2 px-6 py-3 border-b $_headerBg '
                      'transition-colors duration-500',
                  [
                    span(
                      classes:
                          'px-4 py-1.5 rounded-full $_pillActive '
                          'text-xs font-bold transition-colors duration-500',
                      [.text('All 7')],
                    ),
                    span(
                      classes:
                          'px-4 py-1.5 rounded-full border $_pillInactive '
                          'text-xs transition-colors duration-500',
                      [.text('Bookmarked')],
                    ),
                  ],
                ),

                // Notes grid
                div(
                  classes: 'grid grid-cols-2 md:grid-cols-4 gap-4 p-6',
                  [
                    for (final note in [
                      ('Meeting Recap',    'Discussed Q4 targets and the upcoming roadmap...', '21H AGO'),
                      ('1914 Translation', 'But I must explain how all this mistaken idea...', '22H AGO'),
                      ('Project Ideas',    'New UI concepts for the dashboard sprint...', '22H AGO'),
                      ('Lorem Ipsum',      'Lorem ipsum dolor sit amet, consectetur...', '1D AGO'),
                    ])
                      div(
                        classes:
                            'rounded-2xl border p-4 $_noteBg '
                            'transition-all duration-500',
                        [
                          div(
                            classes: 'flex justify-between items-start mb-2',
                            [
                              span(
                                classes:
                                    'text-sm font-semibold $_headingText '
                                    'leading-tight transition-colors duration-500',
                                [.text(note.$1)],
                              ),
                              span(
                                classes: '$_mutedText text-base',
                                [.text('☆')],
                              ),
                            ],
                          ),
                          p(
                            classes:
                                'text-xs $_bodyText leading-relaxed mb-3 '
                                'transition-colors duration-500',
                            [.text(note.$2)],
                          ),
                          span(
                            classes:
                                'text-[10px] $_mutedText uppercase tracking-wide',
                            [.text(note.$3)],
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),

            // Caption
            p(
              classes:
                  'text-center mt-6 text-sm $sectionBody transition-colors duration-500',
              [
                .text('Theme changes apply instantly across your entire library.'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
