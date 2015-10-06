r1 = Role.create({name: "regular"})
r2 = Role.create({name: "admin"})
r2 = Role.create({name: "guru"})

User.create!([
  {email: "admin@ignitetalks.io", password: "password", role_id: r2.id},
  {email: "test@ignitetalks.io", password: "password", role_id: r1.id}
])
Event.create!([
  {name: "Ignite Seattle", url: "http://igniteseattle.com", city: "Seattle", state: "Washington", country: "United States", latitude: 47.6062095, longitude: -122.3320708, slug: "ignite-seattle", user_id: 1, twitter_name: nil},
  {name: "Ignite Sydney", url: "http://www.ignitesydney.com", city: "Sydney", state: "New South Wales", country: "Australia", latitude: -33.8674869, longitude: 151.2069902, slug: "ignite-sydney", user_id: 1, twitter_name: "ignitesydney"},
  {name: "Ignite Los Angles", url: "http://www.asdfasdf.com", city: "los angeles", state: "California", country: "United States of America", latitude: 34.053717, longitude: -118.2427266, slug: "ignite-los-angles", user_id: 1, twitter_name: ""}
])
Post.create!([
  {title: "first post", content: "Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Vestibulum id ligula porta felis euismod semper. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.\r\n\r\nMaecenas sed diam eget risus varius blandit sit amet non magna. Maecenas faucibus mollis interdum. Etiam porta sem malesuada magna mollis euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n\r\nMaecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam quis risus eget urna mollis ornare vel eu leo.\r\n\r\nEtiam porta sem malesuada magna mollis euismod. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Donec id elit non mi porta gravida at eget metus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec sed odio dui.", user_id: 1, slug: "first-post"}
])
Tag.create!([
  {name: "technology", major: true},
  {name: "health", major: true},
  {name: "politics", major: true},
  {name: "test1", major: nil},
  {name: "test2", major: nil},
  {name: "testing a longer tag", major: nil}
])
Tag::HABTM_Videos.create!([
  {video_id: 2, tag_id: 1},
  {video_id: 3, tag_id: 1},
  {video_id: 4, tag_id: 3},
  {video_id: 4, tag_id: 1},
  {video_id: 5, tag_id: 1},
  {video_id: 18, tag_id: 2}
])
Upcoming.create!([
  {name: "Ignite Sydney 15", event_id: 1, date: "2018-06-01", user_id: 1},
  {name: "Ignite Seattle 27", event_id: 2, date: "2018-08-16", user_id: 1}
])
Video.create!([
  {title: "Save the planet, eat a bug", url: "https://www.youtube.com/watch?v=QSs27t8nPlM", event_id: 1, user_id: 1, slug: "save-the-planet-eat-a-bug", speaker_name: "Virginia Emery", speaker_url: "", uid: "QSs27t8nPlM", likes: 4, dislikes: 0, views: 63, description: 'lorem ipsum'},
  {title: "What if you say Yes to everything?", url: "http://www.youtube.com/watch?v=InYTkTKSBfo", event_id: 1, user_id: 1, slug: "what-if-you-say-yes-to-everything", speaker_name: "Jen Kellum Nausin", speaker_url: "", uid: "InYTkTKSBfo", likes: 5, dislikes: 0, views: 188, description: 'lorem ipsum'},
  {title: "Life lessons from industrial design", url: "https://www.youtube.com/watch?v=pur9MMxBTfQ", event_id: 2, user_id: 1, slug: "life-lessons-from-industrial-design", speaker_name: "Lily Kolle", speaker_url: "", uid: "pur9MMxBTfQ", likes: 5, dislikes: 0, views: 306, description: 'lorem ipsum'},
  {title: "Notes from a grateful dickhead", url: "https://www.youtube.com/watch?v=8Td8zLMWU4Y", event_id: 2, user_id: 1, slug: "notes-from-a-grateful-dickhead", speaker_name: "Stephen Lead", speaker_url: "http://www.stephenlead.com", uid: "8Td8zLMWU4Y", likes: 44, dislikes: 5, views: 4490, description: 'lorem ipsum'},
  {title: "testing validation of YouTube URL", url: "https://www.youtube.com/watch?v=eS9bI7KDmeU&list=PLNCkBYNm9NxlFCCkq0FKl3B1CfiH_SY3N&index=1", event_id: 1, user_id: 1, slug: "testing-validation-of-youtube-url", speaker_name: "test person", speaker_url: "", uid: "eS9bI7KDmeU", likes: 3, dislikes: 0, views: 168, description: 'lorem ipsum'},
  {title: "blah", url: "https://www.youtube.com/watch?v=z9BnUPUlYmo", event_id: 1, user_id: 1, slug: "blah", speaker_name: "asdfsdaf", speaker_url: "", uid: "z9BnUPUlYmo", likes: 0, dislikes: 0, views: 0, description: 'lorem ipsum'},
  {title: "test", url: "http://www.youtube.com/watch?v=InYTkTKSBfo", event_id: 1, user_id: 1, slug: "test", speaker_name: "test", speaker_url: "", uid: "InYTkTKSBfo", likes: 5, dislikes: 0, views: 197, description: 'lorem ipsum'},
  {title: "test", url: "http://www.youtube.com/watch?v=InYTkTKSBfo", event_id: 1, user_id: 1, slug: "test-a3f2ecd9-452a-4656-8cd6-554b9aa2d381", speaker_name: "test", speaker_url: "", uid: "InYTkTKSBfo", likes: nil, dislikes: nil, views: nil, description: 'lorem ipsum'},
  {title: "here is a video with a really long title Donec id elit non mi porta gravida at eget metus.", url: "https://www.youtube.com/watch?v=l_iAzo-f1lc", event_id: 2, user_id: 1, slug: "here-is-a-video-with-a-really-long-title-donec-id-elit-non-mi-porta-gravida-at-eget-metus", speaker_name: "Emma", speaker_url: "", uid: "l_iAzo-f1lc", likes: 2, dislikes: 0, views: 119, description: "Video created by Hunting With Pixels. http://www.huntingwithpixels.com\r\nHunting With Pixels is a Sydney and Melbourne based social video strategy and production agency."},
  {title: "Emma Tseris @ Ignite Sydney - Why you (might not) have a mental illness", url: "https://www.youtube.com/watch?v=l_iAzo-f1lc", event_id: 1, user_id: 1, slug: "emma-tseris-ignite-sydney-why-you-might-not-have-a-mental-illness", speaker_name: "test", speaker_url: "", uid: "l_iAzo-f1lc", likes: 2, dislikes: 0, views: 119, description: "Video created by Hunting With Pixels. http://www.huntingwithpixels.com\r\nHunting With Pixels is a Sydney and Melbourne based social video strategy and production agency."},
  {title: "How to give a kick-ass demo", url: "https://www.youtube.com/watch?v=Cxl_3ANnE0A&list=PL7A1D371037166365&index=1", event_id: 2, user_id: 1, slug: "how-to-give-a-kick-ass-demo", speaker_name: "Stephen Lead", speaker_url: "", uid: "Cxl_3ANnE0A", likes: 11, dislikes: 1, views: 2664, description: "Most technical presentations contain a live software demo at some point. Unfortunately, most software demos aren't very good. Find out how to give a kick-ass software demo in 5 minutes..."}
])
Video::HABTM_Tags.create!([
  {video_id: 2, tag_id: 1},
  {video_id: 3, tag_id: 1},
  {video_id: 4, tag_id: 3},
  {video_id: 4, tag_id: 1},
  {video_id: 5, tag_id: 1},
  {video_id: 18, tag_id: 2}
])
