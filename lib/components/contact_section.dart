import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

typedef _ContactItem = ({
  String label,
  String value,
  String href,
  String iconPath,
  String accentColor,
  bool external,
});

const _contacts = <_ContactItem>[
  (
    label: 'Phone',
    value: '+8801677696277',
    href: 'tel:+8801677696277',
    accentColor: 'emerald',
    external: false,
    iconPath:
        'M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 0 0 2.25-2.25v-1.372'
        'c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417'
        'l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 0 1-7.143-7.143'
        'c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173'
        'L6.963 3.102a1.125 1.125 0 0 0-1.091-.852H4.5A2.25 2.25 0 0 0 2.25 4.5v2.25Z',
  ),
  (
    label: 'Email',
    value: 'mehedi05739@gmail.com',
    href: 'mailto:mehedi05739@gmail.com',
    accentColor: 'amber',
    external: false,
    iconPath:
        'M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75'
        'm19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25'
        'm19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0'
        'L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75',
  ),
  (
    label: 'LinkedIn',
    value: 'Mehedi Hasan',
    href: 'https://www.linkedin.com/in/mehedi-hasan-7b28ab15b/',
    accentColor: 'blue',
    external: true,
    iconPath:
        'M13.19 8.688a4.5 4.5 0 0 1 1.242 7.244l-4.5 4.5a4.5 4.5 0 0 1-6.364-6.364'
        'l1.757-1.757m13.35-.622 1.757-1.757a4.5 4.5 0 0 0-6.364-6.364l-4.5 4.5'
        'a4.5 4.5 0 0 0 1.242 7.244',
  ),
];

/// Contact section displaying developer info and reachable channels.
class ContactSection extends StatelessComponent {
  const ContactSection({super.key, required this.isDark});

  final bool isDark;

  @override
  Component build(BuildContext context) {
    final sectionBg   = isDark ? 'bg-neutral-950' : 'bg-white';
    final headingText = isDark ? 'text-neutral-100' : 'text-neutral-900';
    final bodyText    = isDark ? 'text-neutral-400' : 'text-neutral-600';
    final cardBg      = isDark
        ? 'bg-neutral-900 border-neutral-800/60'
        : 'bg-slate-50 border-slate-200';
    final nameCls     = isDark ? 'text-neutral-100' : 'text-neutral-900';
    final subCls      = isDark ? 'text-neutral-500' : 'text-neutral-500';

    return section(
      id: 'contact',
      classes: 'py-28 $sectionBg transition-colors duration-500',
      [
        div(
          classes: 'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8',
          [
            // ── Heading ──
            div(
              classes: 'max-w-2xl mx-auto text-center mb-16',
              [
                span(
                  classes:
                      'inline-block text-xs font-semibold tracking-widest uppercase '
                      'text-$primaryColor-400 mb-4',
                  [.text('Contact')],
                ),
                h2(
                  classes:
                      'text-3xl sm:text-4xl font-bold $headingText mb-4 '
                      'transition-colors duration-500',
                  [.text('Get in Touch')],
                ),
                p(
                  classes: 'text-base $bodyText leading-relaxed transition-colors duration-500',
                  [
                    .text(
                      'Have questions, feedback, or want to collaborate? '
                      'Reach out through any of the channels below.',
                    ),
                  ],
                ),
              ],
            ),

            // ── Developer card ──
            div(
              classes: 'max-w-2xl mx-auto',
              [
                // Name banner
                div(
                  classes:
                      '$cardBg border rounded-2xl p-8 mb-6 text-center '
                      'transition-colors duration-500',
                  [
                    // Initials avatar
                    div(
                      classes:
                          'w-20 h-20 rounded-full mx-auto mb-5 flex items-center justify-center '
                          'bg-$primaryColor-500/15 border-2 border-$primaryColor-500/30',
                      [
                        span(
                          classes: 'text-2xl font-bold text-$primaryColor-400',
                          [.text('MH')],
                        ),
                      ],
                    ),
                    h3(
                      classes:
                          'text-2xl font-bold $nameCls mb-1 '
                          'transition-colors duration-500',
                      [.text('Mehedi Hasan Shohag')],
                    ),
                    p(
                      classes: 'text-sm $subCls transition-colors duration-500',
                      [.text('Developer · Slate Notes')],
                    ),
                  ],
                ),

                // Contact channel cards
                div(
                  classes: 'grid grid-cols-1 sm:grid-cols-3 gap-4',
                  [
                    for (final item in _contacts)
                      _ContactCard(item: item, isDark: isDark),
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

class _ContactCard extends StatelessComponent {
  const _ContactCard({required this.item, required this.isDark});

  final _ContactItem item;
  final bool isDark;

  @override
  Component build(BuildContext context) {
    final cardBg  = isDark
        ? 'bg-neutral-900 border-neutral-800/60 hover:border-neutral-700'
        : 'bg-slate-50 border-slate-200 hover:border-slate-300';
    final valueCls = isDark ? 'text-neutral-200' : 'text-neutral-800';
    final iconBg = switch (item.accentColor) {
      'emerald' => 'bg-emerald-500/15 text-emerald-400',
      'amber'   => 'bg-amber-500/15 text-amber-400',
      'blue'    => 'bg-blue-500/15 text-blue-400',
      _         => 'bg-neutral-800 text-neutral-400',
    };

    final linkAttrs = item.external
        ? <String, String>{'target': '_blank', 'rel': 'noopener noreferrer'}
        : <String, String>{};

    return div(
      classes:
          '$cardBg border rounded-xl p-5 flex flex-col gap-4 '
          'transition-all duration-200',
      [
        // Icon badge
        div(
          classes: 'w-10 h-10 rounded-xl $iconBg flex items-center justify-center',
          [
            svg(
              classes: 'w-5 h-5',
              viewBox: '0 0 24 24',
              [
                path(
                  d: item.iconPath,
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
        // Label + clickable value
        div(
          classes: 'flex flex-col gap-1',
          [
            p(
              classes:
                  'text-xs text-neutral-500 uppercase tracking-widest font-semibold',
              [.text(item.label)],
            ),
            a(
              href: item.href,
              classes:
                  'text-sm font-medium $valueCls break-all '
                  'transition-colors duration-200',
              attributes: linkAttrs,
              [.text(item.value)],
            ),
          ],
        ),
      ],
    );
  }
}
