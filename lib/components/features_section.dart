import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

/// Feature data record.
typedef _Feature = ({
  String title,
  String description,
  String badge,
  String accentColor, // emerald | violet | amber | blue
  String iconPath,    // Heroicons v2 outline SVG path
});

const _features = <_Feature>[
  (
    title: 'Local-First Database',
    description:
        'Every note is persisted to a high-performance SQLite database '
        'directly on your device. Zero internet required—ever. '
        'Data starts instantly and remains 100% yours.',
    badge: 'Privacy Core',
    accentColor: 'emerald',
    iconPath:
        'M20.25 6.375c0 2.278-3.694 4.125-8.25 4.125S3.75 8.653 3.75 6.375'
        'm16.5 0c0-2.278-3.694-4.125-8.25-4.125S3.75 4.097 3.75 6.375'
        'm16.5 0v11.25c0 2.278-3.694 4.125-8.25 4.125s-8.25-1.847-8.25-4.125'
        'V6.375m16.5 5.625c0 2.278-3.694 4.125-8.25 4.125s-8.25-1.847-8.25-4.125',
  ),
  (
    title: 'Pro-Tier Security Lock',
    description:
        'Choose your shield: a secure 4-digit PIN with recovery question '
        'backup, or your device\'s native biometric fingerprint '
        'authentication. Only one lock can be active at a time.',
    badge: 'Security',
    accentColor: 'violet',
    iconPath:
        'M16.5 10.5V6.75a4.5 4.5 0 1 0-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 0 0 '
        '2.25-2.25v-6.75a2.25 2.25 0 0 0-2.25-2.25H6.75a2.25 2.25 0 0 0-2.25 2.25v6.75'
        'a2.25 2.25 0 0 0 2.25 2.25z',
  ),
  (
    title: 'Font & Theme System',
    description:
        'Hand-pick your font style, choose from modular card patterns, '
        'and let the app follow your system\'s light or dark mode '
        'automatically—or lock it manually.',
    badge: 'Personalization',
    accentColor: 'amber',
    iconPath:
        'M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0-3.09-3.09L2.25 12'
        'l2.846-.813a4.5 4.5 0 0 0 3.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 0 0'
        ' 3.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 0 0-3.09 3.09Z'
        'M18.259 8.715 18 9.75l-.259-1.035a3.375 3.375 0 0 0-2.455-2.456'
        'L14.25 6l1.036-.259a3.375 3.375 0 0 0 2.455-2.456L18 2.25l.259 1.035'
        'a3.375 3.375 0 0 0 2.456 2.456L21.75 6l-1.035.259a3.375 3.375 0 0 0-2.456 2.456Z',
  ),
  (
    title: 'Secured Google Cloud Sync',
    description:
        'Optionally authenticate with Google and back up to isolated '
        'Appwrite cloud storage. Notes are encrypted end-to-end—'
        'not even our servers can read them.',
    badge: 'Cloud Backup',
    accentColor: 'blue',
    iconPath:
        'M2.25 15a4.5 4.5 0 0 0 4.5 4.5H18a3.75 3.75 0 0 0 1.332-7.257'
        ' 3 3 0 0 0-3.758-3.848 5.25 5.25 0 0 0-10.233 2.33'
        'A4.502 4.502 0 0 0 2.25 15Z',
  ),
];

/// 2 × 2 responsive feature card grid.
class FeaturesSection extends StatelessComponent {
  const FeaturesSection({super.key, required this.isDark});

  final bool isDark;

  @override
  Component build(BuildContext context) {
    final sectionBg   = isDark ? 'bg-neutral-900' : 'bg-slate-50';
    final headingText = isDark ? 'text-neutral-100' : 'text-neutral-900';
    final bodyText    = isDark ? 'text-neutral-400' : 'text-neutral-600';

    return section(
      id: 'features',
      classes: 'py-28 $sectionBg transition-colors duration-500',
      [
        div(
          classes: 'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8',
          [
            // Section header
            div(
              classes: 'text-center mb-16',
              [
                span(
                  classes:
                      'text-$primaryColor-400 text-sm font-semibold '
                      'tracking-widest uppercase',
                  [.text('Built Different')],
                ),
                h2(
                  classes:
                      'mt-3 text-4xl sm:text-5xl font-black '
                      '$headingText tracking-tight transition-colors duration-500',
                  [.text('Everything You Need.')],
                ),
                p(
                  classes:
                      'mt-4 $bodyText text-lg max-w-2xl mx-auto leading-relaxed '
                      'transition-colors duration-500',
                  [
                    .text(
                      'Slate Notes is engineered from the ground up for '
                      'speed, privacy, and deep personalisation.',
                    ),
                  ],
                ),
              ],
            ),

            // 2-column responsive grid
            div(
              id: 'security',
              classes: 'grid grid-cols-1 md:grid-cols-2 gap-6',
              [
                for (final f in _features)
                  _FeatureCard(feature: f, isDark: isDark),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessComponent {
  const _FeatureCard({required this.feature, required this.isDark});

  final _Feature feature;
  final bool isDark;

  @override
  Component build(BuildContext context) {
    final cardBg = isDark
        ? 'bg-neutral-950 border-neutral-800 hover:border-neutral-700 hover:shadow-black/40'
        : 'bg-white border-slate-200 hover:border-slate-300 hover:shadow-slate-200/60';
    final titleCls = isDark ? 'text-neutral-100' : 'text-neutral-900';
    final bodyCls  = isDark ? 'text-neutral-400' : 'text-neutral-600';

    final iconBg = switch (feature.accentColor) {
      'emerald' => 'bg-$primaryColor-500/15 text-$primaryColor-400',
      'violet'  => 'bg-violet-500/15 text-violet-400',
      'amber'   => 'bg-amber-500/15 text-amber-400',
      'blue'    => 'bg-blue-500/15 text-blue-400',
      _         => 'bg-neutral-800 text-neutral-400',
    };
    final badgeCls = switch (feature.accentColor) {
      'emerald' => 'border-$primaryColor-500/30 text-$primaryColor-400',
      'violet'  => 'border-violet-500/30 text-violet-400',
      'amber'   => 'border-amber-500/30 text-amber-400',
      'blue'    => 'border-blue-500/30 text-blue-400',
      _         => 'border-neutral-700 text-neutral-400',
    };

    return div(
      classes:
          'group flex flex-col gap-6 p-7 rounded-2xl border $cardBg '
          'transition-all duration-300 hover:shadow-2xl',
      [
        // Icon + badge
        div(
          classes: 'flex items-center justify-between',
          [
            div(
              classes:
                  'w-12 h-12 rounded-xl $iconBg flex items-center justify-center',
              [
                svg(
                  classes: 'w-6 h-6',
                  viewBox: '0 0 24 24',
                  [
                    path(
                      d: feature.iconPath,
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
            span(
              classes:
                  'px-3 py-1 rounded-full border $badgeCls text-xs font-semibold',
              [.text(feature.badge)],
            ),
          ],
        ),

        // Text content
        div(
          classes: 'flex flex-col gap-2',
          [
            h3(
              classes:
                  'text-xl font-bold $titleCls transition-colors duration-500',
              [.text(feature.title)],
            ),
            p(
              classes:
                  '$bodyCls text-sm leading-relaxed transition-colors duration-500',
              [.text(feature.description)],
            ),
          ],
        ),
      ],
    );
  }
}
