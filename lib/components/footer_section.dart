import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

/// Footer with link columns, copyright, and data-rights disclaimer.
class FooterSection extends StatelessComponent {
  const FooterSection({super.key, required this.isDark});

  final bool isDark;

  @override
  Component build(BuildContext context) {
    final footerBg    = isDark ? 'bg-neutral-950 border-neutral-800/60' : 'bg-slate-100 border-slate-200';
    final brandText   = isDark ? 'text-neutral-100' : 'text-neutral-900';
    final descText    = isDark ? 'text-neutral-500' : 'text-neutral-600';
    final socialCls   = isDark
        ? 'text-neutral-500 hover:text-$primaryColor-400'
        : 'text-neutral-500 hover:text-$primaryColor-600';
    final dividerCls  = isDark ? 'border-neutral-800/60' : 'border-slate-200';
    final copyText    = isDark ? 'text-neutral-600' : 'text-neutral-500';
    final copyHover   = isDark ? 'hover:text-neutral-400' : 'hover:text-neutral-700';

    return footer(
      classes: '$footerBg border-t transition-colors duration-500',
      [
        div(
          classes: 'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8',
          [
            // ── Top grid ──
            div(
              classes: 'py-16 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-10',
              [
                // Brand column
                div(
                  classes: 'col-span-1 sm:col-span-2 lg:col-span-1 flex flex-col gap-5',
                  [
                    // Logo
                    div(
                      classes: 'flex items-center gap-2.5',
                      [
                        img(
                          src: '/images/logo.png',
                          classes: 'w-10 h-10 object-contain shrink-0',
                          attributes: const {'alt': 'Slate Notes logo'},
                        ),
                        span(
                          classes: 'text-lg font-bold $brandText transition-colors duration-500',
                          [.text('Slate Notes')],
                        ),
                      ],
                    ),
                    p(
                      classes: '$descText text-sm leading-relaxed max-w-xs transition-colors duration-500',
                      [
                        .text(
                          'A local-first, privacy-respecting note-taking '
                          'companion. Your thoughts—secured, organised, '
                          'and always within reach.',
                        ),
                      ],
                    ),
                    // Social / contact placeholder
                    div(
                      classes: 'flex gap-4',
                      [
                        for (final lnk in [
                          ('GitHub', '#'),
                          ('Twitter', '#'),
                          ('Email', '#'),
                        ])
                          a(
                            classes:
                                'text-xs $socialCls '
                                'transition-colors duration-200 font-medium',
                            href: lnk.$2,
                            [.text(lnk.$1)],
                          ),
                      ],
                    ),
                  ],
                ),

                // Product links
                _LinkColumn(
                  heading: 'Product',
                  isDark: isDark,
                  links: [
                    ('Features', '#features'),
                    ('Security', '#security'),
                    ('Changelog', '#'),
                    ('Download Beta', '#download'),
                  ],
                ),

                // Company links
                _LinkColumn(
                  heading: 'Company',
                  isDark: isDark,
                  links: [
                    ('About', '#'),
                    ('Blog', '#'),
                    ('Careers', '#'),
                    ('Contact', '#'),
                  ],
                ),

                // Legal links
                _LinkColumn(
                  heading: 'Legal',
                  isDark: isDark,
                  links: [
                    ('Privacy Policy', '#'),
                    ('Terms of Service', '#'),
                    ('Cookie Policy', '#'),
                    ('GDPR', '#'),
                  ],
                ),
              ],
            ),

            hr(classes: dividerCls),

            // ── Data-rights disclaimer ──
            div(
              classes:
                  'py-6 rounded-2xl my-6 px-6 '
                  'bg-$primaryColor-500/5 border border-$primaryColor-500/15',
              [
                div(
                  classes: 'flex items-start gap-4',
                  [
                    // Shield icon
                    div(
                      classes: 'shrink-0 mt-0.5',
                      [
                        svg(
                          classes: 'w-5 h-5 text-$primaryColor-400',
                          viewBox: '0 0 24 24',
                          [
                            path(
                              d:
                                  'M9 12.75 11.25 15 15 9.75m-3-7.036A11.959 11.959 0 0 1 3.598 6 '
                                  '11.99 11.99 0 0 0 3 9.749c0 5.592 3.824 10.29 9 11.623 '
                                  '5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152'
                                  'c-3.196 0-6.1-1.248-8.25-3.285Z',
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
                        p(
                          classes: 'text-$primaryColor-400 text-sm font-semibold',
                          [.text('Your data. Your rights. Always.')],
                        ),
                        p(
                          classes: 'text-neutral-400 text-xs leading-relaxed',
                          [
                            .text(
                              'You retain total ownership of every note you create. '
                              'If you choose to enable cloud backup, you can request '
                              'a full wipeout of all remote data directly within your '
                              'Settings menu at any time—no support ticket required.',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            // ── Bottom bar ──
            div(
              classes:
                  'flex flex-col sm:flex-row items-center justify-between '
                  'gap-3 py-6 text-xs $copyText transition-colors duration-500',
              [
                span([
                  .text('© 2025 Slate Notes. All rights reserved.'),
                ]),
                div(
                  classes: 'flex gap-6',
                  [
                    for (final item in [
                      ('Privacy', '#'),
                      ('Terms', '#'),
                      ('Cookies', '#'),
                    ])
                      a(
                        classes: '$copyHover transition-colors duration-200',
                        href: item.$2,
                        [.text(item.$1)],
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

class _LinkColumn extends StatelessComponent {
  const _LinkColumn({
    required this.heading,
    required this.links,
    required this.isDark,
  });

  final String heading;
  final List<(String, String)> links;
  final bool isDark;

  @override
  Component build(BuildContext context) {
    final headingCls = isDark ? 'text-neutral-200' : 'text-neutral-800';
    final linkCls    = isDark
        ? 'text-neutral-500 hover:text-neutral-200'
        : 'text-neutral-500 hover:text-neutral-800';

    return div(
      classes: 'flex flex-col gap-4',
      [
        h4(
          classes:
              'text-sm font-semibold $headingCls tracking-wider uppercase '
              'transition-colors duration-500',
          [.text(heading)],
        ),
        ul(
          classes: 'flex flex-col gap-3',
          [
            for (final lnk in links)
              li([
                a(
                  classes:
                      'text-sm $linkCls '
                      'transition-colors duration-200',
                  href: lnk.$2,
                  [.text(lnk.$1)],
                ),
              ]),
          ],
        ),
      ],
    );
  }
}
