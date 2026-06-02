import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

@client
class PrivacyPolicyPage extends StatefulComponent {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  bool _isDark = true;

  // ── Sun / Moon icon paths (matching NavBar) ──────────────────────────────
  static const _sunPath =
      'M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364'
      '-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3'
      'm4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z';

  static const _moonPath =
      'M21.752 15.002A9.72 9.72 0 0 1 18 15.75c-5.385 0-9.75-4.365'
      '-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 0 0 3 11.25'
      'C3 16.635 7.365 21 12.75 21a9.753 9.753 0 0 0 9.002-5.998Z';

  // ── Invariant Tailwind classes ────────────────────────────────────────────
  static const _linkCls =
      'text-amber-400 hover:text-amber-300 underline underline-offset-2 transition-colors duration-200';
  static const _accentBadge = 'bg-amber-500/15 text-amber-400';

  // ── Theme-dependent style helpers ────────────────────────────────────────
  String get _bg => _isDark ? 'bg-neutral-950' : 'bg-white';
  String get _navBg =>
      _isDark ? 'bg-neutral-950/90 border-neutral-800/60' : 'bg-white/90 border-slate-200';
  String get _brand => _isDark ? 'text-neutral-100' : 'text-neutral-900';
  String get _heading => _isDark ? 'text-neutral-100' : 'text-neutral-900';
  String get _body => _isDark ? 'text-neutral-300' : 'text-neutral-700';
  String get _muted => _isDark ? 'text-neutral-500' : 'text-neutral-500';
  String get _card =>
      _isDark ? 'bg-neutral-900/60 border-neutral-800' : 'bg-slate-50 border-slate-200';
  String get _divider => _isDark ? 'border-neutral-800' : 'border-slate-200';
  String get _contactBox =>
      _isDark ? 'bg-neutral-900 border-neutral-800' : 'bg-slate-100 border-slate-200';
  String get _callout =>
      _isDark ? 'bg-neutral-900/80 border-amber-500/20' : 'bg-amber-50/60 border-amber-200';
  String get _innerCard =>
      _isDark ? 'bg-neutral-800/80 border-neutral-700' : 'bg-white border-slate-200';
  String get _neutralBadge =>
      _isDark ? 'bg-neutral-800 text-neutral-400' : 'bg-neutral-200 text-neutral-600';
  String get _toggleBtn =>
      _isDark
          ? 'border-neutral-700 text-neutral-400 hover:text-amber-400 hover:border-neutral-500'
          : 'border-slate-300 text-neutral-500 hover:text-amber-600 hover:border-slate-400';
  String get _footerBg =>
      _isDark ? 'bg-neutral-950 border-neutral-800/60' : 'bg-slate-100 border-slate-200';
  String get _footerText => _isDark ? 'text-neutral-600' : 'text-neutral-500';
  String get _footerHover =>
      _isDark ? 'hover:text-neutral-400' : 'hover:text-neutral-700';

  @override
  Component build(BuildContext context) {
    return div(
      classes: '$_bg min-h-screen font-sans antialiased transition-colors duration-500',
      [
        _buildNav(),
        main_([_buildContent()]),
        _buildFooter(),
      ],
    );
  }

  // ── Navigation ────────────────────────────────────────────────────────────
  Component _buildNav() {
    return header(
      classes:
          'fixed top-0 left-0 right-0 z-50 $_navBg backdrop-blur-md border-b transition-colors duration-500',
      [
        div(
          classes: 'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8',
          [
            nav(
              classes: 'flex h-16 items-center justify-between',
              [
                Link(
                  to: '/',
                  child: div(classes: 'flex items-center gap-2.5 cursor-pointer', [
                    img(
                      src: '/images/logo.png',
                      classes: 'w-9 h-9 object-contain shrink-0',
                      attributes: const {'alt': 'Slate Notes logo'},
                    ),
                    span(
                      classes:
                          'text-xl font-bold $_brand tracking-tight transition-colors duration-500',
                      [.text('Slate Notes')],
                    ),
                  ]),
                ),
                button(
                  onClick: () => setState(() => _isDark = !_isDark),
                  classes:
                      'w-9 h-9 rounded-full border flex items-center justify-center '
                      '$_toggleBtn transition-all duration-200',
                  [
                    svg(
                      classes: 'w-4 h-4',
                      viewBox: '0 0 24 24',
                      [
                        path(
                          d: _isDark ? _sunPath : _moonPath,
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
              ],
            ),
          ],
        ),
      ],
    );
  }

  // ── Main content ──────────────────────────────────────────────────────────
  Component _buildContent() {
    return div(
      classes: 'max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 pt-24 pb-24',
      [
        // Page heading
        div(classes: 'mb-14', [
          span(
            classes:
                'text-xs font-semibold tracking-widest uppercase text-amber-400 block mb-3',
            [.text('Legal')],
          ),
          h1(
            classes:
                'text-4xl sm:text-5xl font-black $_heading mb-4 transition-colors duration-500',
            [
              .text('Privacy '),
              span(classes: 'text-amber-400', [.text('Policy')]),
            ],
          ),
          p(
            classes: 'text-sm $_muted font-medium transition-colors duration-500',
            [.text('Last Updated: May 21, 2026')],
          ),
        ]),

        div(classes: 'flex flex-col gap-10', [
          // Intro card
          div(classes: 'p-6 rounded-2xl border $_card transition-colors duration-500', [
            p(
              classes:
                  'text-[1.05rem] leading-relaxed $_body mb-4 transition-colors duration-500',
              [
                strong([.text('Mehedi Hasan Shohag')]),
                .text(' ("we," "our," or "us") operates the '),
                strong([.text('Slate Notes')]),
                .text(
                    ' mobile application (the "App"). We are committed to protecting '
                    'your privacy and securing your personal and note-taking data.'),
              ],
            ),
            p(
              classes:
                  'text-[1.05rem] leading-relaxed $_body transition-colors duration-500',
              [
                .text(
                    'This Privacy Policy explains how data is collected, used, and '
                    'safeguarded when you use our App. By downloading and using the App, '
                    'you agree to the practices outlined in this policy.'),
              ],
            ),
          ]),

          // 1. Data Collection and Usage
          _section('1. Data Collection and Usage', [
            p(
              classes: 'leading-relaxed $_body mb-5 transition-colors duration-500',
              [
                .text(
                    'We prioritize local-first data architecture. The type of information '
                    'handled depends entirely on how you interact with the App\'s features.'),
              ],
            ),
            div(classes: 'flex flex-col gap-6', [
              _subSection('A. Local Note Storage & Customization', [
                li(classes: '$_body leading-relaxed', [
                  strong([.text('Note Content: ')]),
                  .text(
                      'All text, lists, and content you write within the App are stored '
                      'directly in a secure local database (sqflite) on your physical device.'),
                ]),
                li(classes: '$_body leading-relaxed', [
                  strong([.text('App Customization: ')]),
                  .text(
                      'Your choices regarding note card layouts, patterns, custom fonts, and '
                      'system themes (Light/Dark mode) are stored strictly on your local device.'),
                ]),
                li(classes: '$_body leading-relaxed', [
                  strong([.text('Access: ')]),
                  .text('We have no access to your locally stored notes or UI customization options.'),
                ]),
              ]),
              _subSection('B. Security and Authentication Data', [
                li(classes: '$_body leading-relaxed', [
                  strong([.text('4-Digit PIN & Security Questions: ')]),
                  .text(
                      'If you choose to lock the App via a 4-Digit PIN, the PIN code and '
                      'answers to your security recovery questions are hashed and stored '
                      'locally on your device. This data never leaves your device.'),
                ]),
                li(classes: '$_body leading-relaxed', [
                  strong([.text('Biometric Authentication (Fingerprint): ')]),
                  .text(
                      'If you enable biometric verification, the authentication process is '
                      'handled directly by your device\'s native OS secure subsystem. The App '
                      'never accesses, views, or collects your fingerprint or biometric data.'),
                ]),
              ]),
              _subSection('C. Cloud Synchronization & Backup (Google Login)', [
                li(classes: '$_body leading-relaxed', [
                  strong([.text('Google Authentication: ')]),
                  .text(
                      'If you opt to use the online backup and synchronization feature, the '
                      'App authenticates your identity using Google Sign-In. We collect your '
                      'Google Email Address and a unique User ID token provided by Google to '
                      'establish and secure your account.'),
                ]),
                li(classes: '$_body leading-relaxed', [
                  strong([.text('Cloud Database Storage: ')]),
                  .text(
                      'When synchronization is active, your notes are transmitted securely to '
                      'our cloud database. This data is protected; it is securely isolated and '
                      'cannot be accessed by any other user. It is retrieved and rendered only '
                      'when you successfully log into the App using the exact same Google account.'),
                ]),
              ]),
            ]),
          ]),

          // 2. Data Transmission and Security
          _section('2. Data Transmission and Security', [
            ul(classes: 'list-disc list-inside space-y-3', [
              li(classes: '$_body leading-relaxed', [
                strong([.text('Encryption in Transit: ')]),
                .text(
                    'All communications between the App and our cloud sync databases are '
                    'strictly encrypted using industry-standard Transport Layer Security '
                    '(TLS/HTTPS) protocols.'),
              ]),
              li(classes: '$_body leading-relaxed', [
                strong([.text('Access Restriction: ')]),
                .text(
                    'Your cloud-hosted backup data is structurally isolated via '
                    'access-control rules. No third parties or other users can query, '
                    'view, or modify your stored notes.'),
              ]),
            ]),
          ]),

          // 3. Data Retention and Account Deletion
          _section('3. Data Retention and Account Deletion', [
            p(
              classes: 'leading-relaxed $_body mb-4 transition-colors duration-500',
              [.text('We believe you should have total control over your digital footprint.')],
            ),
            ul(classes: 'list-disc list-inside space-y-3', [
              li(classes: '$_body leading-relaxed', [
                strong([.text('Local Data: ')]),
                .text(
                    'Uninstalling the App from your mobile device immediately and permanently '
                    'purges all local SQLite records, customization profiles, and configuration '
                    'data from your device storage.'),
              ]),
              li(classes: '$_body leading-relaxed', [
                strong([.text('Cloud Data & Account Deletion: ')]),
                .text(
                    'If you have enabled cloud sync via Google Login, you have the right to '
                    'delete your account at any time directly inside the App\'s Settings menu, '
                    'or by contacting us via email at '),
                a(
                  href: 'mailto:mehedi05739@gmail.com',
                  classes: _linkCls,
                  [.text('mehedi05739@gmail.com')],
                ),
                .text('.'),
              ]),
              li(classes: '$_body leading-relaxed', [
                strong([.text('Scope of Deletion: ')]),
                .text(
                    'Upon receiving an account deletion request, your user profile, Google '
                    'authentication mapping tokens, and all synced cloud notes will be '
                    'permanently and irreversibly wiped from our production cloud servers '
                    'within 7 business days.'),
              ]),
            ]),
          ]),

          // 4. Third-Party Services
          _section('4. Third-Party Services', [
            p(
              classes: 'leading-relaxed $_body mb-4 transition-colors duration-500',
              [.text('The App integrates the following third-party infrastructure components:')],
            ),
            ul(classes: 'list-disc list-inside space-y-3', [
              li(classes: '$_body leading-relaxed', [
                strong([.text('Google Sign-In API: ')]),
                .text(
                    'Used solely to securely authenticate your account identity for the cloud '
                    'backup system. This interaction is bound by the Google Privacy Policy.'),
              ]),
            ]),
          ]),

          // 5. Children's Privacy
          _section('5. Children\'s Privacy', [
            p(
              classes: 'leading-relaxed $_body transition-colors duration-500',
              [
                .text(
                    'Our App does not knowingly collect or solicit personal information from '
                    'children under the age of 13. If you believe a child has initiated a cloud '
                    'sync account containing personal data, please contact us immediately, and '
                    'we will take immediate steps to delete that account from our server records.'),
              ],
            ),
          ]),

          // 6. Changes to This Privacy Policy
          _section('6. Changes to This Privacy Policy', [
            p(
              classes: 'leading-relaxed $_body transition-colors duration-500',
              [
                .text(
                    'We may update our Privacy Policy periodically to reflect shifts in '
                    'Google Play store compliance guidelines or app feature enhancements. '
                    'We will notify you of any material changes by updating the '
                    '"Last Updated" date at the top of this page.'),
              ],
            ),
          ]),

          // 7. Contact Us
          _section('7. Contact Us', [
            p(
              classes: 'leading-relaxed $_body mb-4 transition-colors duration-500',
              [
                .text(
                    'If you have questions, feedback, or need assistance executing your '
                    'right to account data deletion, contact us at:'),
              ],
            ),
            div(
              classes:
                  'p-4 rounded-xl border $_contactBox flex flex-col gap-2 transition-colors duration-500',
              [
                p(classes: _body, [
                  strong([.text('Email: ')]),
                  a(
                    href: 'mailto:mehedi05739@gmail.com',
                    classes: _linkCls,
                    [.text('mehedi05739@gmail.com')],
                  ),
                ]),
                p(classes: _body, [
                  strong([.text('Developer: ')]),
                  .text('Mehedi Hasan Shohag'),
                ]),
              ],
            ),
          ]),

          // Google Play Data Safety callout
          div(
            classes:
                'p-6 rounded-2xl border $_callout transition-colors duration-500',
            [
              div(classes: 'flex items-center gap-3 mb-4', [
                span(classes: 'text-xl leading-none', [.text('ℹ️')]),
                h3(
                  classes:
                      'text-base font-bold $_heading transition-colors duration-500',
                  [.text('Google Play Console "Data Safety" Section Help')],
                ),
              ]),
              p(
                classes:
                    'text-sm leading-relaxed $_body mb-4 transition-colors duration-500',
                [
                  .text(
                      'When filling out the mandatory Data Safety Form inside your Google '
                      'Play Console, use these exact parameters based on your app\'s architecture:'),
                ],
              ),
              ul(classes: 'text-sm list-disc list-inside space-y-2 $_body mb-6', [
                li(classes: 'leading-relaxed', [
                  strong([.text('Data Collection: ')]),
                  .text('Mark '),
                  strong([.text('Yes')]),
                  .text(' (because of the Google Sync functionality).'),
                ]),
                li(classes: 'leading-relaxed', [
                  strong([.text('Data Encrypted in Transit: ')]),
                  .text('Mark '),
                  strong([.text('Yes')]),
                  .text(' (assuming you use standard HTTPS endpoints to communicate with your cloud backend).'),
                ]),
                li(classes: 'leading-relaxed', [
                  strong([.text('Account Deletion: ')]),
                  .text('Mark '),
                  strong([.text('Yes')]),
                  .text(', and provide a dedicated account deletion URL in your App\'s Settings.'),
                ]),
              ]),
              div(
                classes:
                    'p-4 rounded-xl border $_innerCard transition-colors duration-500',
                [
                  h4(
                    classes:
                        'text-sm font-semibold $_heading mb-3 transition-colors duration-500',
                    [.text('Data Declared:')],
                  ),
                  ul(classes: 'text-sm list-disc list-inside space-y-3 $_body', [
                    li(classes: 'leading-relaxed', [
                      strong([.text('Personal Info → Email Address & User IDs: ')]),
                      .text('Declare this as '),
                      span(
                        classes:
                            'inline-block px-1.5 py-0.5 rounded text-xs font-semibold $_neutralBadge mx-0.5',
                        [.text('Collected')],
                      ),
                      .text(', '),
                      span(
                        classes:
                            'inline-block px-1.5 py-0.5 rounded text-xs font-semibold $_neutralBadge mx-0.5',
                        [.text('Not Shared')],
                      ),
                      .text(', and used for '),
                      span(
                        classes:
                            'inline-block px-1.5 py-0.5 rounded text-xs font-semibold $_accentBadge mx-0.5',
                        [.text('Account Management')],
                      ),
                      .text(' and '),
                      span(
                        classes:
                            'inline-block px-1.5 py-0.5 rounded text-xs font-semibold $_accentBadge mx-0.5',
                        [.text('App Functionality')],
                      ),
                      .text('.'),
                    ]),
                    li(classes: 'leading-relaxed', [
                      strong([.text('App Activity → User-Generated Content: ')]),
                      .text('Declare note content as '),
                      span(
                        classes:
                            'inline-block px-1.5 py-0.5 rounded text-xs font-semibold $_neutralBadge mx-0.5',
                        [.text('Collected')],
                      ),
                      .text(', '),
                      span(
                        classes:
                            'inline-block px-1.5 py-0.5 rounded text-xs font-semibold $_neutralBadge mx-0.5',
                        [.text('Not Shared')],
                      ),
                      .text(', and used for '),
                      span(
                        classes:
                            'inline-block px-1.5 py-0.5 rounded text-xs font-semibold $_accentBadge mx-0.5',
                        [.text('App Functionality / Cloud Backup')],
                      ),
                      .text('.'),
                    ]),
                  ]),
                ],
              ),
            ],
          ),
        ]),
      ],
    );
  }

  Component _section(String heading, List<Component> children) {
    return div(classes: 'flex flex-col gap-4', [
      h2(
        classes:
            'text-2xl font-bold $_heading pb-3 border-b $_divider transition-colors duration-500',
        [.text(heading)],
      ),
      ...children,
    ]);
  }

  Component _subSection(String heading, List<Component> items) {
    return div([
      h3(
        classes:
            'text-base font-semibold $_heading mb-3 transition-colors duration-500',
        [.text(heading)],
      ),
      ul(classes: 'list-disc list-inside space-y-2.5', items),
    ]);
  }

  // ── Footer ────────────────────────────────────────────────────────────────
  Component _buildFooter() {
    return footer(
      classes:
          '$_footerBg border-t py-8 transition-colors duration-500',
      [
        div(
          classes:
              'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col sm:flex-row '
              'items-center justify-between gap-3 text-xs $_footerText transition-colors duration-500',
          [
            span([.text('© 2025 Slate Notes. All rights reserved.')]),
            Link(
              to: '/',
              child: span(
                classes:
                    '$_footerHover transition-colors duration-200 cursor-pointer',
                [.text('← Back to Home')],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
