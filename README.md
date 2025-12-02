# Whiteside Advisory - Jekyll Site

Personal blog and website for Whiteside Advisory, featuring perspectives on security leadership, governance, risk management, and real-world compliance challenges.

Based on the Strata Reloaded Jekyll theme, adapted from Strata by HTML5 UP.

## Site Information

- **URL**: https://wh.itesi.de
- **Author**: Jeff Whiteside
- **Email**: jeff@wh.itesi.de
- **Repository**: [git@github.com:heffrey/strata-jekyll-whiteside.git](https://github.com/heffrey/strata-jekyll-whiteside)

## Features

* Parallax background effect
* Lightbox gallery
* Pre-styled components
* Blog with pagination
* Configurable footer
* RSS/Atom feed
* SEO tags
* Future-dated posts support

## Development

### Prerequisites

This site is built with [Jekyll](http://jekyllrb.com/) version 3.3.1.

### Setup

1. Install dependencies with [Bundler](http://bundler.io/):
   ```bash
   bundle install
   ```

2. Run Jekyll locally:
   ```bash
   bundle exec jekyll serve
   ```

3. View the site at `http://localhost:4000`

### Configuration

- Site and author details are configured in `_config.yml`
- Social profiles can be added in `_data/social.yml`
- Post defaults are set in `_posts/_defaults.md`

## Deployment

### Automated Deployment

The site is automatically deployed via cron job (see the [deployment repository](https://github.com/heffrey/root-whiteside) for details).

### Manual Deployment

To manually deploy the site:

```bash
./deploy.sh
```

This script will:
1. Install dependencies if needed
2. Build the site with Jekyll
3. Copy the built site to `/var/www/html/`

### Scheduled Posts

Posts scheduled for future publication should be placed in `~/future-posts/`. The automated cron job will:
- Run every other week on Sunday at midnight
- Move posts from `~/future-posts/` to `_posts/` with today's date prefix
- Trigger a site rebuild and deployment

## Project Structure

```
.
├── _config.yml          # Site configuration
├── _data/               # Data files (social profiles, etc.)
├── _drafts/             # Draft posts (not published)
├── _includes/           # Reusable components
├── _layouts/            # Page templates
├── _posts/              # Blog posts
├── _site/               # Generated site (not in git)
├── css/                 # Stylesheets
├── images/              # Images and assets
├── js/                  # JavaScript files
├── deploy.sh            # Deployment script
└── Gemfile              # Ruby dependencies
```

## Related Repositories

- **Deployment Scripts**: [git@github.com:heffrey/root-whiteside.git](https://github.com/heffrey/root-whiteside)
  - Contains deployment scripts, cron configuration, and workspace settings

## Editing

### Posts

* Add new posts in the `_posts/` directory
* Filename format: `YYYY-MM-DD-post-title.md`
* Change defaults for new posts in `_posts/_defaults.md`
* Draft posts can be placed in `_drafts/` (not published until moved to `_posts/`)

### Footer

* Footer content is configured in `_data/social.yml`

### Layouts

* Main layouts are in `_layouts/`
* `default.html` - Base layout for pages
* `post.html` - Layout for blog posts
* `consulting_site_layout.html` - Specialized layout for consulting pages

## License

Free for personal and commercial use under the CCA 3.0 license. See LICENSE file for additional information and terms of use.

This theme was adapted from Strata by HTML5 UP for use with Jekyll.
