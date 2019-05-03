puts "\nSeeding\n"

# Create Users
puts "Creating users"
[
  {email: "emailaddress", password: "strong_ass_password"},
].map do |user_attrs|
  User.create!(user_attrs.merge(password_confirmation: user_attrs[:password]))
end

puts "Creating wards"
[
  {
    attrs: {
      name: "Inverclyde", show_on_homepage: true, url_slug: "inverclyde",
    },
    file_path: "public/inverclyde-whole.json", filename: "inverclyde-whole.json",
  },
  {
    attrs: {
      name: "East Central", show_on_homepage: false, url_slug: "east-central",
    },
    file_path: "public/inverclyde-east-central.json", filename: "inverclyde-east-central.json",
  },
  {
    attrs: {
      name: "East", show_on_homepage: false, url_slug: "east",
    },
    file_path: "public/inverclyde-east.json", filename: "inverclyde-east.json",
  },
  {
    attrs: {
      name: "North", show_on_homepage: false, url_slug: "north",
    },
    file_path: "public/inverclyde-north.json", filename: "inverclyde-north.json",
  },
  {
    attrs: {
      name: "South West", show_on_homepage: false, url_slug: "south-west",
    },
    file_path: "public/inverclyde-south-west.json", filename: "inverclyde-south-west.json",
  },
  {
    attrs: {
      name: "South", show_on_homepage: false, url_slug: "south",
    },
    file_path: "public/inverclyde-south.json", filename: "inverclyde-south.json",
  },
  {
    attrs: {
      name: "West", show_on_homepage: false, url_slug: "west",
    },
    file_path: "public/inverclyde-west.json", filename: "inverclyde-west.json",
  },
  {
    attrs: {
      name: "Central", show_on_homepage: false, url_slug: "central",
    },
    file_path: "public/inverclyde-central.json", filename: "inverclyde-central.json",
  },
  {
    attrs: {
      name: "Test", show_on_homepage: false, url_slug: "test",
    },
    file_path: "public/inverclyde-ward-test.json", filename: "inverclyde-ward-test.json",
  },
].map do |ward_data|
  ward = Ward.create!(ward_data[:attrs])
  ward.outline_json.attach(io: File.open(ward_data[:file_path]), filename: ward_data[:filename], content_type: "application/javascript")
  ward.save
end
Councillor.create(name: "Councillor Stephen McCabe", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7091/Stephen%20McCabe.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/4", ward_id: 3)
Councillor.create(name: "Councillor Curley, Christopher", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/index/7085/Christopher%20Curley.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/21", ward_id: 3)
Councillor.create(name: "Councillor David Wilson", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7102/David%20Wilson.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/1", ward_id: 3)
Councillor.create(name: "Councillor Jim MacLeod", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7090/Jim%20MacLeod.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/3", ward_id: 2)
Councillor.create(name: "Councillor Drew McKenzie", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7095/Drew%20McKenzie.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/23", ward_id: 2)
Councillor.create(name: "Councillor Robert Moran", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7097/Robert%20Moran.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/7", ward_id: 2)
Councillor.create(name: "Councillor Colin Jackson", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7089/Colin%20Jackson.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/24", ward_id: 8)
Councillor.create(name: "Councillor Michael McCormick", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7092/Michael%20McCormick.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/6", ward_id: 8)
Councillor.create(name: "Councillor Jim McEleny", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7094/Jim%20McEleny.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/30", ward_id: 8)
Councillor.create(name: "Councillor Martin Brennan", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7083/Martin%20Brennan.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/10", ward_id: 4)
Councillor.create(name: "Councillor Graeme Brooks", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7081/Graeme%20Brooks.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/25", ward_id: 4)
Councillor.create(name: "Councillor Jim Clocherty", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7087/Jim%20Clocherty.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/8", ward_id: 4)
Councillor.create(name: "Councillor Elizabeth Robertson", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7101/Elizabeth%20Robertson.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/26", ward_id: 4)
Councillor.create(name: "Councillor Ronnie Ahlfeld", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7082/Ronnie%20Ahlfeld.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/16", ward_id: 7)
Councillor.create(name: "Councillor Chris McEleny", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7093/Chris%20McEleny%202.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/15", ward_id: 7)
Councillor.create(name: "Councillor Lynne Quinn", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7099/Lynne%20Quinn.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/22", ward_id: 7)
Councillor.create(name: "Councillor Gerry Dorrian", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7088/Gerry%20Dorrian.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/18", ward_id: 5)
Councillor.create(name: "Councillor Innes Nelson", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7098/Innes%20Nelson%202.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/19", ward_id: 5)
Councillor.create(name: "Councillor Ciano Rebecchi", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7100/Ciano%20Rebecchi.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/20", ward_id: 5)
Councillor.create(name: "Councillor John Crowther", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7086/John%20Crowther.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/27", ward_id: 6)
Councillor.create(name: "Councillor Tommy McVey", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7096/Tommy%20McVey.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/28", ward_id: 6)
Councillor.create(name: "Councillor Natasha Murphy", photo_url: "https://www.inverclyde.gov.uk/images_databasedirectory/pageside/7084/Natasha%20Murphy.png", council_url: "https://www.inverclyde.gov.uk/meetings/councillors/29", ward_id: 6)


Post.create(title: "The Trust starts development of an ebike hire scheme", body: "We have been successful in gaining funding from the innovation foundation Nesta to create a new e-bike hire scheme, which will include developing an online system of GPS tracking, registration, booking and collaboration with users on how best to expand the network.We have 30 years’ experience providing a range of services and support to the people of Inverclyde, contributing to the overall economic development of the community by providing or creating jobs for people from disadvantaged groups and areas.We manage and develop programmes in heritage and culture, volunteering and employability; as such, we have a very well-developed network with local groups, community hubs and centres, schools and other third sector partners. We are an existing bike repair project with ten e-bikes, and we’re exploring how we can facilitate behaviour change to help people make more low-carbon journeys. E-bikes help people get out of unhealthy and environmentally damaging cars and taxis, but they are very expensive to buy and difficult to try out to see if they suit you. We plan to extend the availability of e-bikes to a variety of groups who may have limited access to cycling generally, and help meet the challenge caused by the fact that Inverclyde is an exceptionally hilly part of the country. Through ShareLab Scotland, we’ll be exploring how to create an e-bike scheme that addresses our social aims, and learning what works and what doesn’t. In particular, Inverclyde e-bike hire scheme will be used to establish: how to accelerate uptake and use of e-bikes in the Inverclyde community; how to better understand the barriers holding back e-bike use in Inverclyde, and how to create a scheme that is self-sustainable. We hope to develop a self-sustainable e-bike hire scheme that can be expanded across Inverclyde, and possibly beyond. ")




#
# Dev only seed data
#
return unless Rails.env.development?

puts "\nvvv Dev only seed data vvv\n"

puts "Creating fake event data"
40.times do
  name = Faker::Name.name
  attrs = {
    name: Faker::Lorem.sentence(3),
    organisation: Faker::Company.name,
    description: Faker::Lorem.paragraph,
    contact: name,
    email: Faker::Internet.email(name),
    phone: Faker::PhoneNumber.phone_number,
    website: Faker::Internet.url,
    user_id: User.order("RANDOM()").first,
    time: Faker::Time.between(2.months.ago, 2.months.from_now, :day),
  }
  Event.create(attrs)
end
