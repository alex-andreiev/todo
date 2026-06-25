# Todo List

A Rails todo application for organizing work into lists and tasks. It includes user accounts, task priorities, deadlines, file attachments, localization hooks, and drag-and-drop reordering for both lists and tasks.

## Features

- User registration, login, and logout with Devise.
- Todo lists with title and description.
- Tasks grouped under todo lists.
- Task priorities, deadlines, completion state, and file attachments.
- Drag-and-drop ordering for lists and tasks.
- Turbo Stream create/update/delete flows.
- Stimulus controllers for inline UI behavior.
- Tailwind CSS styling.
- PostgreSQL-backed persistence.

## Requirements

- Ruby 4.0.2, matching `.ruby-version` and `Gemfile`.
- PostgreSQL.
- Node.js 20 or newer is recommended.
- Yarn 1.22.x or npm.
- Bundler.

Optional:

- Foreman. `bin/dev` installs it automatically if it is missing.
- Docker and Docker Compose if you prefer the provided container setup.

## Main Dependencies

Ruby/Rails:

- Rails 8.1.x
- PostgreSQL adapter (`pg`)
- Puma
- Devise
- CanCanCan
- CarrierWave
- Administrate
- Simple Form
- RSpec Rails
- RuboCop Rails

JavaScript/CSS:

- Hotwire Turbo
- Stimulus
- Tailwind CSS 4
- esbuild
- PostCSS / Autoprefixer

## Setup

Install Ruby gems:

```sh
bundle install
```

Install JavaScript packages:

```sh
yarn install
```

If you use npm instead of Yarn:

```sh
npm install
```

Configure PostgreSQL connection environment variables. The app reads these from `config/database.yml`:

```sh
export DB_HOST=localhost
export DB_PORT=5432
export DB_USER=postgres
export DB_PASSWORD=
```

Prepare the database:

```sh
bin/rails db:prepare
```

Seed sample data when useful:

```sh
bin/rails db:seed
```

The setup script can do the Ruby dependency check, database preparation, cleanup, and optionally start the app:

```sh
bin/setup
```

For setup without starting the server:

```sh
bin/setup --skip-server
```

To reset the database during setup:

```sh
bin/setup --reset
```

## Running Locally

Start the Rails server and Tailwind watcher:

```sh
bin/dev
```

`bin/dev` chooses port `3000` by default and automatically moves to the next available port if it is busy.

To choose a port explicitly:

```sh
PORT=3001 bin/dev
```

Then open:

```text
http://localhost:3000
```

or the port printed by `bin/dev`.

## Assets

Build JavaScript only:

```sh
npm run build:js
```

Build CSS only:

```sh
npm run build:css
```

Build all assets:

```sh
npm run build
```

During normal development, prefer editing files under `app/javascript` and `app/assets/stylesheets`. Generated files in `app/assets/builds` should be treated as build output.

## Tests And Quality

Run the test suite:

```sh
bundle exec rspec
```

Run RuboCop:

```sh
bin/rubocop
```

Run both before opening a pull request or handing off work.

## Useful Rails Commands

Run migrations:

```sh
bin/rails db:migrate
```

Reset local development data:

```sh
bin/rails db:reset
```

Open the Rails console:

```sh
bin/rails console
```

List routes:

```sh
bin/rails routes
```

## Docker

A basic Docker Compose setup is included with app, database, and web services:

```sh
docker compose up --build
```

The compose file maps the web service to port `80`.

## Project Structure

- `app/controllers` - Rails controllers, including reorder endpoints.
- `app/models` - Active Record models for users, todos, and tasks.
- `app/views` - ERB views and Turbo Stream templates.
- `app/javascript/controllers` - Stimulus controllers for UI behavior.
- `app/assets/stylesheets` - Tailwind input CSS.
- `app/assets/builds` - generated asset output.
- `db/migrate` - database migrations.
- `spec` - RSpec tests.

## Troubleshooting

If `/todos` redirects to sign in, log in first. The todo and task pages require authentication.

If PostgreSQL cannot connect, confirm `DB_HOST`, `DB_PORT`, `DB_USER`, and `DB_PASSWORD` match your local database.

If assets look stale, rebuild them:

```sh
npm run build
```

If a port is busy, use a different port:

```sh
PORT=3001 bin/dev
```

If tests complain about pending migrations:

```sh
bin/rails db:test:prepare
```
