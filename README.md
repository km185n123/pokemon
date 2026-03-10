# pokemon
app flutter
## Environment Configuration\n\nThis project uses `--dart-define-from-file` for environment configurations instead of assets-based `.env` packages.\n\nTo run the app on a specific environment, use the `.env` file respectively:\n\n### Development\n```bash\nflutter run -t lib/main_dev.dart --dart-define-from-file=.env.dev\n```\n\n### Staging\n```bash\nflutter run -t lib/main_staging.dart --dart-define-from-file=.env.staging\n```\n\n### Production\n```bash\nflutter run -t lib/main_prod.dart --dart-define-from-file=.env.prod\n```
