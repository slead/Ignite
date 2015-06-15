User.create!([
  {email: "admin@gmail.com", encrypted_password: "$2a$10$YP4tOExzk9LIF989Tftil.ZjFRdUxwPFcmb7noUYf9UChhTvEz8mO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2015-06-15 01:17:31", sign_in_count: 5, current_sign_in_at: "2015-06-15 01:17:31", last_sign_in_at: "2015-06-14 07:05:34", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
Event.create!([
  {name: "Ignite Athens", url: "http://www.igniteathens.gr", city: "Athens", state: nil, country: "Greece", latitude: 37.983917, longitude: 23.7293599, slug: "ignite-athens", user_id: nil},
  {name: "Ignite Barrie", url: "http://ignitebarrie.com", city: "Barrie", state: "Ontario", country: "Canada", latitude: 44.38935559999999, longitude: -79.6903316, slug: "ignite-barrie", user_id: nil},
  {name: "Ignite Bath", url: "http://2014.bathdigitalfestival.com/event/ignite-for-good", city: "Bath", state: nil, country: "United Kingdom", latitude: 51.375801, longitude: -2.3599039, slug: "ignite-bath", user_id: nil},
  {name: "Ignite Bergen", url: "http://www.ignitebergen.no", city: "Bergen", state: "Hordaland", country: "Norway", latitude: 60.39126279999999, longitude: 5.3220544, slug: "ignite-bergen", user_id: nil},
  {name: "Ignite Cardiff", url: "http://ignite.wales", city: "Cardiff", state: nil, country: "United Kingdom", latitude: 51.48158100000001, longitude: -3.17909, slug: "ignite-cardiff", user_id: nil},
  {name: "Ignite Cincinnati", url: "http://ignitecincinnati.net", city: "Cincinnati", state: "Ohio", country: "United States", latitude: 39.1031182, longitude: -84.5120196, slug: "ignite-cincinnati", user_id: nil},
  {name: "Ignite Colorado Springs", url: "http://www.ignitecoloradosprings.org", city: "Colorado Springs", state: "Colorado", country: "United States", latitude: 38.8338816, longitude: -104.8213634, slug: "ignite-colorado-springs", user_id: nil},
  {name: "Ignite Gotham", url: "http://ignitegotham.com", city: "Gotham", state: "New York", country: "United States", latitude: 40.7127837, longitude: -74.0059413, slug: "ignite-gotham", user_id: nil},
  {name: "Ignite Guelph", url: "http://igniteguelph.ca", city: "Guelph", state: "Ontario", country: "Canada", latitude: 43.5448048, longitude: -80.24816659999999, slug: "ignite-guelph", user_id: nil},
  {name: "Ignite IT Detroit", url: "http://www.ignite-it.org", city: "Detroit", state: "Michigan", country: "United States", latitude: 42.331427, longitude: -83.0457538, slug: "ignite-it-detroit", user_id: nil},
  {name: "Ignite Ithica", url: "http://www.igniteithaca.com", city: "Ithica", state: "New York", country: "United States", latitude: 42.4439614, longitude: -76.5018807, slug: "ignite-ithica", user_id: nil},
  {name: "Ignite Karachi", url: "http://www.aku.edu/aboutaku/news/Pages/ignite-II-ccit.aspx", city: "Karachi", state: "Sindh", country: "Pakistan", latitude: 24.8614622, longitude: 67.0099388, slug: "ignite-karachi", user_id: nil},
  {name: "Ignite Lansing", url: "http://www.ignitelansing.com", city: "Lansing", state: "Michigan", country: "United States", latitude: 42.732535, longitude: -84.5555347, slug: "ignite-lansing", user_id: nil},
  {name: "Ignite Lincoln", url: "http://ignitelincoln.org", city: "Lincoln", state: "Nebraska", country: "United States", latitude: 40.8257625, longitude: -96.6851982, slug: "ignite-lincoln", user_id: nil},
  {name: "Ignite Memphis", url: "http://ignitememphis.com", city: "Memphis", state: "Tennessee", country: "United States", latitude: 35.1495343, longitude: -90.0489801, slug: "ignite-memphis", user_id: nil},
  {name: "Ignite Oakland", url: "http://igniteoakland.com", city: "Oakland", state: "California", country: "United States", latitude: 37.8043637, longitude: -122.2711137, slug: "ignite-oakland", user_id: nil},
  {name: "Ignite OKC", url: "http://igniteokc.com", city: "Oklahoma City", state: "Oklahoma", country: "United States", latitude: 35.4675602, longitude: -97.5164276, slug: "ignite-okc", user_id: nil},
  {name: "Ignite Phoenix", url: "http://www.ignitephoenixafterhours.com", city: "Phoenix", state: "Arizona", country: "United States", latitude: 33.4483771, longitude: -112.0740373, slug: "ignite-phoenix", user_id: nil},
  {name: "Ignite Reno", url: "http://www.ignitereno.com", city: "Reno", state: "Nevada", country: "United States", latitude: 39.5296329, longitude: -119.8138027, slug: "ignite-reno", user_id: nil},
  {name: "Ignite Salisbury", url: "http://ignitesalisbury.com", city: "Salisbury", state: nil, country: "United Kingdom", latitude: 51.068785, longitude: -1.794472, slug: "ignite-salisbury", user_id: nil},
  {name: "Ignite Salt Lake", url: "http://www.ignitesaltlake.com", city: "Salt Lake", state: "Utah", country: "United States", latitude: 40.7607793, longitude: -111.8910474, slug: "ignite-salt-lake", user_id: nil},
  {name: "Ignite Seattle", url: "http://igniteseattle.com", city: "Seattle", state: "Washington", country: "United States", latitude: 47.6062095, longitude: -122.3320708, slug: "ignite-seattle", user_id: nil},
  {name: "Ignite St John (SJ)", url: "http://www.ignitesj.ca", city: "St John", state: "Newfoundland and Labrador", country: "Canada", latitude: 47.5605413, longitude: -52.71283150000001, slug: "ignite-st-john-sj", user_id: nil},
  {name: "Ignite Steamboat Springs", url: "http://ignitesteamboat.com", city: "Steamboat Springs", state: "Colorado", country: "United States", latitude: 40.4849769, longitude: -106.8317158, slug: "ignite-steamboat-springs", user_id: nil},
  {name: "Ignite Tampa Bay", url: "http://ignitetampa.org", city: "Tampa Bay", state: "Florida", country: "United States", latitude: 27.7495159, longitude: -82.5834947, slug: "ignite-tampa-bay", user_id: nil},
  {name: "Ignite Vancouver", url: "http://ignitebc.com", city: "Vancouver", state: "Washington", country: "United States", latitude: 45.6387281, longitude: -122.6614861, slug: "ignite-vancouver", user_id: nil},
  {name: "Ignite Sydney", url: "http://www.ignitesydney.com", city: "Sydney", state: "New South Wales", country: "Australia", latitude: -33.8674869, longitude: 151.2069902, slug: "ignite-sydney", user_id: nil}
])
Tag.create!([
  {name: "technology"},
  {name: "health"},
  {name: "politics"}
])
Tag::HABTM_Videos.create!([
  {video_id: 8, tag_id: 3},
  {video_id: 8, tag_id: 2},
  {video_id: 8, tag_id: 1},
  {video_id: 10, tag_id: 3},
  {video_id: 11, tag_id: 3},
  {video_id: 1, tag_id: 1},
  {video_id: 12, tag_id: 3},
  {video_id: 5, tag_id: 3},
  {video_id: 2, tag_id: 2},
  {video_id: 3, tag_id: 1},
  {video_id: 5, tag_id: 2},
  {video_id: 2, tag_id: 3},
  {video_id: 3, tag_id: 3},
  {video_id: 4, tag_id: 1}
])
Upcoming.create!([
  {name: "Ignite Sydney 15", event_id: 28, date: "2015-06-01", user_id: 1},
  {name: "Ignite Seattle 27", event_id: 22, date: "2015-08-16", user_id: 1},
  {name: "Ignite Athens 12", event_id: 1, date: "2015-09-12", user_id: 1},
  {name: "Ignite Bergen 5", event_id: 4, date: "2015-08-14", user_id: 1},
  {name: "Ignite Ithica 7", event_id: 11, date: "2015-09-16", user_id: 1},
  {name: "Ignite Cincinati 9", event_id: 6, date: "2015-08-27", user_id: 1},
  {name: "Ignite Guelph 2", event_id: 9, date: "2015-10-14", user_id: 1},
  {name: "Ignite Lincoln 2", event_id: 14, date: "2015-12-12", user_id: 1},
  {name: "Ignite Sydney 16", event_id: 28, date: "2015-12-25", user_id: 1}
])
Video.create!([
  {title: "How to get 5 million people to read your web comic", url: "https://www.youtube.com/embed/QYyJZOHgpco", event_id: 22, user_id: 1, slug: "how-to-get-5-million-people-to-read-your-comic", speaker_name: "Matthew Inman", speaker_url: "http://www.theoatmeal.com"},
  {title: "Save the planet, eat a bug", url: "https://www.youtube.com/embed/QSs27t8nPlM", event_id: 22, user_id: 1, slug: "save-the-planet-eat-a-bug", speaker_name: "Virginia Emery", speaker_url: ""},
  {title: "What if you say Yes to everything?", url: "https://www.youtube.com/embed/InYTkTKSBfo", event_id: 22, user_id: 1, slug: "what-if-you-say-yes-to-everything", speaker_name: "Jen Kellum Nausin", speaker_url: ""},
  {title: "Life lessons from industrial design", url: "https://www.youtube.com/embed/pur9MMxBTfQ", event_id: 28, user_id: 1, slug: "life-lessons-from-industrial-design", speaker_name: "Lily Kolle", speaker_url: ""},
  {title: "Notes from a grateful dickhead", url: "https://www.youtube.com/embed/8Td8zLMWU4Y", event_id: 28, user_id: 1, slug: "notes-from-a-grateful-dickhead", speaker_name: "Stephen Lead", speaker_url: "http://www.stephenlead.com"}
])
Video::HABTM_Tags.create!([
  {video_id: 8, tag_id: 3},
  {video_id: 8, tag_id: 2},
  {video_id: 8, tag_id: 1},
  {video_id: 10, tag_id: 3},
  {video_id: 11, tag_id: 3},
  {video_id: 1, tag_id: 1},
  {video_id: 12, tag_id: 3},
  {video_id: 5, tag_id: 3},
  {video_id: 2, tag_id: 2},
  {video_id: 3, tag_id: 1},
  {video_id: 5, tag_id: 2},
  {video_id: 2, tag_id: 3},
  {video_id: 3, tag_id: 3},
  {video_id: 4, tag_id: 1}
])
