# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://communitytracks.net"

SitemapGenerator::Sitemap.create do
  add root_path
  add about_path
  add activities_path
  add contact_path

  Ward.where(show_on_homepage: false).each do |ward|
    add ward_path(slug: ward.url_slug)
  end
end
