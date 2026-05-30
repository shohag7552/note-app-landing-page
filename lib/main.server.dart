/// Server entrypoint for Slate Notes landing page.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(Document(
    title: 'Slate Notes – Your Thoughts. Secured Locally. Backed Up Safely.',
    styles: [
      css('html, body').styles(
        width: 100.percent,
        padding: .zero,
        margin: .zero,
      ),
    ],
    head: [
      meta(name: 'viewport', content: 'width=device-width, initial-scale=1.0'),
      meta(
        name: 'description',
        content:
            'Slate Notes is a local-first, privacy-focused note-taking app with '
            'biometric security, PIN lock, and optional Google cloud sync.',
      ),
      // Google Fonts – Inter
      link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
      link(
        href: 'https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap',
        rel: 'stylesheet',
      ),
      // Favicon
      link(rel: 'icon', href: 'favicon.png', attributes: const {'type': 'image/png'}),
      link(rel: 'apple-touch-icon', href: 'icons/Icon-192.png'),
      link(rel: 'manifest', href: 'manifest.json'),
      script(src: 'flutter_bootstrap.js', async: true),
      // Tailwind CSS Play CDN
      script(src: 'https://cdn.tailwindcss.com'),
      // Smooth anchor scrolling with fixed-nav offset
      script(
        content: r'''
          (function () {
            var s = document.createElement('style');
            s.textContent = 'html{scroll-behavior:smooth;scroll-padding-top:80px}';
            document.head.appendChild(s);
          })();
        ''',
      ),
      // Tailwind config (runs after CDN loads; safelist ensures dynamic classes compile)
      script(
        content: r'''
          tailwind.config = {
            theme: {
              extend: {
                fontFamily: { sans: ['Inter', 'sans-serif'] },
                animation: {
                  'fade-in': 'fadeIn 0.6s ease-out',
                },
                keyframes: {
                  fadeIn: { '0%': { opacity: '0', transform: 'translateY(16px)' }, '100%': { opacity: '1', transform: 'translateY(0)' } },
                },
              },
            },
            safelist: [
              // Backgrounds (light mode)
              'bg-white', 'bg-slate-50', 'bg-slate-100', 'bg-slate-200',
              'bg-neutral-50', 'bg-neutral-200', 'bg-neutral-300', 'bg-neutral-950',
              // Borders (light mode)
              'border-slate-200', 'border-slate-300', 'border-slate-400',
              'border-neutral-200', 'border-neutral-300', 'border-neutral-400',
              'border-neutral-800/60',
              // Text (light mode)
              'text-neutral-900', 'text-neutral-800', 'text-neutral-700',
              'text-neutral-600', 'text-neutral-500', 'text-neutral-400',
              'text-slate-500', 'text-slate-600', 'text-white',
              // Hover states
              'hover:text-neutral-900', 'hover:text-neutral-800',
              'hover:text-neutral-700', 'hover:text-emerald-500',
              'hover:text-emerald-600', 'hover:border-slate-300',
              'hover:border-slate-400', 'hover:bg-slate-100',
              // Ring / misc
              'ring-neutral-400/40',
            ],
          };
        ''',
      ),
    ],
    body: const App(),
  ));
}
