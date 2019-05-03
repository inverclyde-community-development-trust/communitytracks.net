# README

## Seed Data

The seed data lives in `db/seeds.rb`. Users, Wards and MayLayers are seeded in all environments whilst Events (randomly generated) are only seeded in development.

The seed data doesn't remove any existing data, so to start from a fresh db:

`rails db:drop db:create db:migrate db:seed`

## Secrets
Secrets are managed using Rails credentials, which allows us to check them into
git encrypted. To edit these, run `rails credentials:edit`. You will need to have the rails master key,
which can be stored locally either in `config/master.key` or exported as an environment
variable named `RAILS_MASTER_KEY`.

## Emails

Emails are sent using mailgun in production. The relevant config is in
`config/production.rb` and secrets are in rails credentials.

For local debugging, we use [mailcatcher](https://mailcatcher.me/) and have configured the
development environment for doing so. Once mailcatcher is running (separate from
the rails server), you'll be able to go to http://127.0.0.1:1080 to see any
emails that have been sent (they don't actually get sent in dev, of course).

## Sitemap

Config is in `config/sitemap.rb` - docs for editing [here](https://github.com/kjvarga/sitemap_generator#rails)

After editing, run `rails sitemap:refresh` to update the file and ping search engines. Run `rails sitemap:refresh:no_ping` to skip pinging search engines.

## SCSS

We're using [Bootstrap 4](https://getbootstrap.com/) as the basis of our styling / layout. Our stylesheets are scss.

## Javascript

Javascript is separated into two parts.

- JS for bootstrap, turbolinks etc. is loaded in `app/assets/javascript.js`.
- JS for React (map area) is in `app/javascript`

The react code is transpiled by the webpacker gem automatically. We're using the `react-rails` gem to load components from `app/javascript/components` into our normal html pages (see `app/views/page/home.html.erb` for an example).

## Map data

The map data is split across two models: `Ward` and `MapLayer`. Wards have many MapLayers.

### IMPORTANT: Using map data in development

To load KML layers, we pass the URL of the KML file to google, who then make the request for the file. For this to work, our development environment needs to be accessible from outside our network. To do this you should use something like [ngrok](https://ngrok.io). You'll need to update the URL in `config/initializers/assets.rb` to correspond to your public URL and then restart rails.

### Wards

The main part of the ward is the outline json. This defines the polygon used for the map sillhouette. The format of this json file is as follows:

```json
{
  "coordinates": [
    { "lat": 55.5, "lng": -4.3 },
    { "lat": 55.5, "lng": -4.3 },
    { "lat": 55.5, "lng": -4.3 },
    ...
  ]
}
```

**Note** The locations in the coordinates, which define the polygon, must be in clockwise order in order to create the 'hole' in google maps.

### MapLayers

The MapLayer can belong to a single Ward. It has an attached KML file which defines features to be shown on the map. This just uses the KMLLayer part of the google maps API, so any valid KML file should work.

## Admin

We use the `administrate` gem for the admin area and `sorcery` for authentication. Administrate has the concept of 'dashboards' which correspond to models, they live in `app/dashboards`.

To add a new dashboard the steps are (assume we created a Person model):

1. `rails g administrate:dashboard Person`
2. Open `app/dashboards/person_dashboard.rb` and add/remove fields as desired from the arrays that correspond to each of the dashboard pages.
3. Add the dashboard to `config/routes.rb` - in this case `resources :people` would go under `namespace :admin`
