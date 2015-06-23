User.create!([
  {email: "admin@ignitetalks.io", password: "password", admin: "true"}
  {email: "test@ignitetalks.io", password: "password"}
])
Event.create!([
  {name: "Ignite Seattle", url: "http://igniteseattle.com", city: "Seattle", state: "Washington", country: "United States", latitude: 47.6062095, longitude: -122.3320708, slug: "ignite-seattle", user_id: 1, status: 'published'},
  {name: "Ignite Sydney", url: "http://www.ignitesydney.com", city: "Sydney", state: "New South Wales", country: "Australia", latitude: -33.8674869, longitude: 151.2069902, slug: "ignite-sydney", user_id: 1, status: 'published'}
])
Tag.create!([
  {name: "technology", major: true},
  {name: "health", major: true},
  {name: "politics", major: true}
])

Upcoming.create!([
  {name: "Ignite Sydney 15", event_id: 1, date: "2018-06-01", user_id: 1, status: 'published'},
  {name: "Ignite Seattle 27", event_id: 2, date: "2018-08-16", user_id: 1, status: 'published'}
])
  
Video.create!([
  {title: "How to get 5 million people to read your web comic", url: "https://www.youtube.com/watch?v=QYyJZOHgpco", event_id: 1, user_id: 1, slug: "how-to-get-5-million-people-to-read-your-comic", speaker_name: "Matthew Inman", speaker_url: "http://www.theoatmeal.com", status: 'published'},
  {title: "Save the planet, eat a bug", url: "https://www.youtube.com/watch?v=QSs27t8nPlM", event_id: 1, user_id: 1, slug: "save-the-planet-eat-a-bug", speaker_name: "Virginia Emery", speaker_url: "", status: 'published'},
  {title: "What if you say Yes to everything?", url: "https://www.youtube.com/watch?v=InYTkTKSBfo", event_id: 1, user_id: 1, slug: "what-if-you-say-yes-to-everything", speaker_name: "Jen Kellum Nausin", speaker_url: "", status: 'published'},
  {title: "Life lessons from industrial design", url: "https://www.youtube.com/watch?v=pur9MMxBTfQ", event_id: 2, user_id: 1, slug: "life-lessons-from-industrial-design", speaker_name: "Lily Kolle", speaker_url: "", status: 'draft'},
  {title: "Notes from a grateful dickhead", url: "https://www.youtube.com/watch?v=8Td8zLMWU4Y", event_id: 2, user_id: 1, slug: "notes-from-a-grateful-dickhead", speaker_name: "Stephen Lead", speaker_url: "http://www.stephenlead.com", status: 'published'}
])

Tag::HABTM_Videos.create!([
  {video_id: 1, tag_id: 3},
  {video_id: 1, tag_id: 2},
  {video_id: 2, tag_id: 1},
  {video_id: 3, tag_id: 1},
  {video_id: 4, tag_id: 3},
  {video_id: 4, tag_id: 1},
  {video_id: 5, tag_id: 1}      
])
