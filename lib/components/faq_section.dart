import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

typedef _FaqItem = ({String question, String answer});

const _faqs = <_FaqItem>[
  (
    question: 'Is Slate Notes really 100% offline?',
    answer:
        'Yes. Every note is written directly to a SQLite database on your '
        'device. The app does not require an internet connection to create, '
        'edit, search, or delete notes. Cloud sync is entirely optional.',
  ),
  (
    question: 'What happens if I forget my PIN?',
    answer:
        'During PIN setup you are prompted to set a security recovery question '
        'and answer. If you forget your PIN, answer the question correctly to '
        'regain access and set a new one. Biometric authentication is not '
        'recoverable through the app—use your device\'s system settings.',
  ),
  (
    question: 'How does Google Cloud sync work?',
    answer:
        'Signing in with Google authenticates your identity. Notes are then '
        'backed up to an isolated Appwrite storage bucket associated only '
        'with your account. The data is encrypted in transit and at rest. '
        'You can request a full wipeout from inside the app settings at any time.',
  ),
  (
    question: 'Can I use biometric and PIN lock at the same time?',
    answer:
        'Only one lock method can be active at a time. Enable biometric lock '
        'or PIN lock from the App Lock screen—switching to one automatically '
        'disables the other. This keeps authentication predictable and secure.',
  ),
  (
    question: 'What customisation options are available?',
    answer:
        'You can choose from multiple font families, switch between several '
        'card layout patterns, and toggle between dark and light theme—or let '
        'the app follow your system preference automatically.',
  ),
];

/// Collapsible FAQ section using native HTML details/summary.
class FaqSection extends StatelessComponent {
  const FaqSection({super.key, required this.isDark});

  final bool isDark;

  @override
  Component build(BuildContext context) {
    final sectionBg   = isDark ? 'bg-neutral-900' : 'bg-slate-50';
    final headingText = isDark ? 'text-neutral-100' : 'text-neutral-900';
    final cardCls     = isDark
        ? 'bg-neutral-950 border-neutral-800 hover:border-neutral-700'
        : 'bg-white border-slate-200 hover:border-slate-300';
    final questionCls = isDark ? 'text-neutral-100' : 'text-neutral-900';
    final answerCls   = isDark ? 'text-neutral-400' : 'text-neutral-600';
    final hoverCls    = isDark ? 'hover:text-$primaryColor-400' : 'hover:text-$primaryColor-500';

    return section(
      id: 'faq',
      classes: 'py-28 $sectionBg transition-colors duration-500',
      [
        div(
          classes: 'max-w-3xl mx-auto px-4 sm:px-6 lg:px-8',
          [
            // Header
            div(
              classes: 'text-center mb-14',
              [
                span(
                  classes:
                      'text-$primaryColor-400 text-sm font-semibold '
                      'tracking-widest uppercase',
                  [.text('Questions Answered')],
                ),
                h2(
                  classes:
                      'mt-3 text-4xl sm:text-5xl font-black '
                      '$headingText tracking-tight transition-colors duration-500',
                  [.text('FAQ')],
                ),
              ],
            ),

            // FAQ items
            div(
              classes: 'flex flex-col gap-3',
              [
                for (final item in _faqs)
                  details(
                    classes:
                        'rounded-2xl border $cardCls '
                        'transition-all duration-200 overflow-hidden',
                    [
                      summary(
                        classes:
                            'flex items-center justify-between gap-4 '
                            'cursor-pointer select-none list-none '
                            'px-6 py-5 $questionCls font-semibold text-base '
                            '$hoverCls transition-colors duration-200',
                        [
                          span([.text(item.question)]),
                          span(
                            classes:
                                'text-$primaryColor-400 text-xl font-light '
                                'transition-transform duration-300 shrink-0',
                            [.text('+')],
                          ),
                        ],
                      ),
                      div(
                        classes: 'px-6 pb-5',
                        [
                          p(
                            classes:
                                '$answerCls text-sm leading-relaxed '
                                'transition-colors duration-500',
                            [.text(item.answer)],
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
