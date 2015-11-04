User.create!([
 {email: "stephen@ignitetalks.io", password: "password", encrypted_password: "$2a$10$jAwO5six230Xs83AjdY1E.Slw9.ZoIHUCVF7CyTxN9P3LMh2L2bGa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2015-10-31 10:36:02", sign_in_count: 78, current_sign_in_at: "2015-10-31 10:36:02", last_sign_in_at: "2015-10-31 10:36:02", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Stephen Lead", role_id: 2}
])
User::HABTM_Events.create!([
  {event_id: 2, user_id: 18},
  {event_id: 1, user_id: 9},
  {event_id: 2, user_id: 9}
])
Event.create!([
  {name: "Ignite Denver", url: "http://ignitedenver.org/", city: "Denver", state: "Colorado", country: "United States", latitude: 39.7392358, longitude: -104.990251, slug: "ignite-denver", status: "published", twitter_name: "ignitedenver"},
  {name: "Ignite Athens", url: "http://www.igniteathens.gr", city: "Athens", state: nil, country: "Greece", latitude: 37.983917, longitude: 23.7293599, slug: "ignite-athens", status: "published", twitter_name: "igniteathens"},
  {name: "Ignite Seattle", url: "http://www.igniteseattle.com", city: "Seattle", state: "Washington", country: "United States", latitude: 47.6062095, longitude: -122.3320708, slug: "ignite-seattle", status: "published", twitter_name: "igniteseattle"},
  {name: "Ignite Bath", url: "http://2014.bathdigitalfestival.com/event/ignite-for-good", city: "Bath", state: nil, country: "United Kingdom", latitude: 51.375801, longitude: -2.3599039, slug: "ignite-bath", status: "published", twitter_name: "ignitebath"},
  {name: "Ignite Bergen", url: "http://www.ignitebergen.no", city: "Bergen", state: "Hordaland", country: "Norway", latitude: 60.3912628, longitude: 5.3220544, slug: "ignite-bergen", status: "published", twitter_name: "ignitebergen"},
  {name: "Ignite Cincinnati", url: "http://ignitecincinnati.net", city: "Cincinnati", state: "Ohio", country: "United States", latitude: 39.1031182, longitude: -84.5120196, slug: "ignite-cincinnati", status: "published", twitter_name: "ignitecincinnati"},
  {name: "Ignite Colorado Springs", url: "http://www.ignitecoloradosprings.org", city: "Colorado Springs", state: "Colorado", country: "United States", latitude: 38.8338816, longitude: -104.8213634, slug: "ignite-colorado-springs", status: "published", twitter_name: "ignitecoloradosprings"},
  {name: "Ignite Gotham", url: "http://ignitegotham.com", city: "Gotham", state: "New York", country: "United States", latitude: 40.7127837, longitude: -74.0059413, slug: "ignite-gotham", status: "published", twitter_name: "ignitegotham"},
  {name: "Ignite Guelph", url: "http://igniteguelph.ca", city: "Guelph", state: "Ontario", country: "Canada", latitude: 43.5448048, longitude: -80.2481666, slug: "ignite-guelph", status: "published", twitter_name: "igniteguelph"},
  {name: "Ignite IT Detroit", url: "http://www.ignite-it.org", city: "Detroit", state: "Michigan", country: "United States", latitude: 42.331427, longitude: -83.0457538, slug: "ignite-it-detroit", status: "published", twitter_name: "igniteitdetroit"},
  {name: "Ignite Ithica", url: "http://www.igniteithaca.com", city: "Ithica", state: "New York", country: "United States", latitude: 42.4439614, longitude: -76.5018807, slug: "ignite-ithica", status: "published", twitter_name: "igniteithica"},
  {name: "Ignite Karachi", url: "http://www.aku.edu/aboutaku/news/Pages/ignite-II-ccit.aspx", city: "Karachi", state: "Sindh", country: "Pakistan", latitude: 24.8614622, longitude: 67.0099388, slug: "ignite-karachi", status: "published", twitter_name: "ignitekarachi"},
  {name: "Ignite Lansing", url: "http://www.ignitelansing.com", city: "Lansing", state: "Michigan", country: "United States", latitude: 42.732535, longitude: -84.5555347, slug: "ignite-lansing", status: "published", twitter_name: "ignitelansing"},
  {name: "Ignite Lincoln", url: "http://ignitelincoln.org", city: "Lincoln", state: "Nebraska", country: "United States", latitude: 40.8257625, longitude: -96.6851982, slug: "ignite-lincoln", status: "published", twitter_name: "ignitelincoln"},
  {name: "Ignite Oakland", url: "http://igniteoakland.com", city: "Oakland", state: "California", country: "United States", latitude: 37.8043637, longitude: -122.2711137, slug: "ignite-oakland", status: "published", twitter_name: "igniteoakland"},
  {name: "Ignite OKC", url: "http://igniteokc.com", city: "Oklahoma City", state: "Oklahoma", country: "United States", latitude: 35.4675602, longitude: -97.5164276, slug: "ignite-okc", status: "published", twitter_name: "igniteokc"},
  {name: "Ignite Reno", url: "http://www.ignitereno.com", city: "Reno", state: "Nevada", country: "United States", latitude: 39.5296329, longitude: -119.8138027, slug: "ignite-reno", status: "published", twitter_name: "ignitereno"},
  {name: "Ignite Salisbury", url: "http://ignitesalisbury.com", city: "Salisbury", state: nil, country: "United Kingdom", latitude: 51.068785, longitude: -1.794472, slug: "ignite-salisbury", status: "published", twitter_name: "ignitesalisbury"},
  {name: "Ignite Salt Lake", url: "http://www.ignitesaltlake.com", city: "Salt Lake", state: "Utah", country: "United States", latitude: 40.7607793, longitude: -111.8910474, slug: "ignite-salt-lake", status: "published", twitter_name: "ignitesaltlake"},
  {name: "Ignite St John (SJ)", url: "http://www.ignitesj.ca", city: "St John", state: "Newfoundland and Labrador", country: "Canada", latitude: 47.5605413, longitude: -52.7128315, slug: "ignite-st-john-sj", status: "published", twitter_name: "ignitestjohn(sj)"},
  {name: "Ignite Steamboat Springs", url: "http://ignitesteamboat.com", city: "Steamboat Springs", state: "Colorado", country: "United States", latitude: 40.4849769, longitude: -106.8317158, slug: "ignite-steamboat-springs", status: "published", twitter_name: "ignitesteamboatsprings"},
  {name: "Ignite Tampa Bay", url: "http://ignitetampa.org", city: "Tampa Bay", state: "Florida", country: "United States", latitude: 27.7495159, longitude: -82.5834947, slug: "ignite-tampa-bay", status: "published", twitter_name: "ignitetampabay"},
  {name: "Ignite Vancouver", url: "http://ignitebc.com", city: "Vancouver", state: "Washington", country: "United States", latitude: 45.6387281, longitude: -122.6614861, slug: "ignite-vancouver", status: "published", twitter_name: "ignitevancouver"},
  {name: "Ignite Tunis", url: "https://twitter.com/ignitetunis", city: "Tunis", state: "Gabes", country: "Tunisia", latitude: 33.886917, longitude: 9.537499, slug: "ignite-tunis", status: "published", twitter_name: "ignitetunis"},
  {name: "Ignite Fort Collins", url: "http://www.ignitefortcollins.com/", city: "Fort Collins", state: "Colordado", country: "United States", latitude: 40.5852602, longitude: -105.084423, slug: "ignite-fort-collins", status: "published", twitter_name: "ignitefortcollins"},
  {name: "Ignite Dublin", url: "http://ignitedublin.tumblr.com/", city: "Dublin", state: "", country: "Ireland", latitude: 53.3498053, longitude: -6.2603097, slug: "ignite-dublin", status: "published", twitter_name: "ignitedublin"},
  {name: "Ignite San Francisco", url: "http://www.ignitesanfrancisco.com", city: "San Francisco, CA", state: "California", country: "United States", latitude: 37.7749295, longitude: -122.4194155, slug: "ignite-san-francisco", status: "published", twitter_name: "ignitesanfrancisco"},
  {name: "Ignite Jeddah", url: "http://www.ignitejeddah.org/", city: "Jeddah, Saudi Arabia", state: "Makkah Province", country: "Saudi Arabia", latitude: 21.543333, longitude: 39.172778, slug: "ignite-jeddah", status: "published", twitter_name: "ignitejeddah"},
  {name: "Ignite Barcelona", url: "http://ignitebcn.es/", city: "Barcelona, Spain", state: "Catalonia", country: "Spain", latitude: 41.297445, longitude: 2.0832941, slug: "ignite-barcelona", status: "published", twitter_name: "ignitebarcelona"},
  {name: "Ignite TLV", url: "http://www.meetup.com/Ignite-TLV/", city: "Tel Aviv, Israel", state: "Tel Aviv District", country: "Israel", latitude: 32.0852999, longitude: 34.7817676, slug: "ignite-tlv", status: "published", twitter_name: "ignitetlv"},
  {name: "Ignite Berlin", url: "http://igniteberlin.com/", city: "Berlin, Germany", state: "Berlin", country: "Germany", latitude: 52.5200066, longitude: 13.404954, slug: "ignite-berlin", status: "published", twitter_name: "igniteberlin"},
  {name: "Ignite Casablanca", url: "http://www.ignite.ma/", city: "casablanca, morocco", state: "Grand Casablanca", country: "Morocco", latitude: 33.5731104, longitude: -7.5898434, slug: "ignite-casablanca", status: "published", twitter_name: "ignitecasablanca"},
  {name: "Ignite Sydney", url: "http://www.ignitesydney.com", city: "Sydney", state: "New South Wales", country: "Australia", latitude: -33.8674869, longitude: 151.2069902, slug: "ignite-sydney", status: "published", twitter_name: "ignitesydney"},
  {name: "Ignite Cardiff", url: "http://ignite.wales", city: "Cardiff", state: nil, country: "United Kingdom", latitude: 51.481581, longitude: -3.17909, slug: "ignite-cardiff", status: "published", twitter_name: "ignitecardiff"},
  {name: "Ignite Phoenix", url: "http://ignitephoenix.com", city: "Phoenix", state: "Arizona", country: "United States", latitude: 33.4483771, longitude: -112.0740373, slug: "ignite-phoenix", status: "published", twitter_name: "ignitephoenix"},
  {name: "Ignite Bristol", url: "http://ignitebristol.net/", city: "Bristol", state: nil, country: "United Kingdom", latitude: 51.454513, longitude: -2.58791, slug: "ignite-bristol", status: "published", twitter_name: "ignitebristol"},
  {name: "Ignite Anchorage", url: "http://IgniteAnchorage.com", city: "Anchorage, Alaska", state: "Alaska", country: "United States", latitude: 61.2180556, longitude: -149.9002778, slug: "ignite-anchorage", status: "published", twitter_name: "igniteanchorage"},
  {name: "Ignite Barrie", url: "http://ignitebarrie.com", city: "Barrie", state: "Ontario", country: "Canada", latitude: 44.3893556, longitude: -79.6903316, slug: "ignite-barrie", status: "published", twitter_name: "ignitebarrie"},
  {name: "Ignite Memphis", url: "http://ignitememphis.com", city: "Memphis", state: "Tennessee", country: "United States", latitude: 35.1495343, longitude: -90.0489801, slug: "ignite-memphis", status: "published", twitter_name: "ignitememphis"},
  {name: "Ignite Los Angeles", url: "", city: "Los Angeles", state: "California", country: "United States of America", latitude: 34.053717, longitude: -118.2427266, slug: "ignite-los-angeles", status: "published", twitter_name: ""},
  {name: "Ignite Baltimore", url: "http://www.ignitebaltimore.com", city: "Baltimore", state: "Maryland", country: "United States of America", latitude: 39.2908608, longitude: -76.6108073, slug: "ignite-baltimore", status: "published", twitter_name: "@ignitebaltimore"},
  {name: "Ignite Brum", url: "http://ignitebrum.com/", city: "Birmingham", state: "England", country: "United Kingdom", latitude: 52.4813679, longitude: -1.8980726, slug: "ignite-brum", status: "published", twitter_name: "ignitebrum"},
  {name: "Ignite BRC 2", url: "http://ignitebrc.tumblr.com", city: "Black Rock City, NV", state: "Nevada", country: "United States of America", latitude: 40.7838715, longitude: -119.205685, slug: "ignite-brc-2", status: "published", twitter_name: ""},
  {name: "Ignite London", url: "http://ignitelondon.net/", city: "London", state: "England", country: "United Kingdom", latitude: 51.5073219, longitude: -0.1276474, slug: "ignite-london", status: "published", twitter_name: "ignite_london"},
  {name: "Ignite Boulder", url: "http://igniteboulder.com/", city: "Boulder", state: "Colorado", country: "United States of America", latitude: 40.0149856, longitude: -105.2705456, slug: "ignite-boulder", status: "published", twitter_name: "igniteboulder"},
  {name: "Ignite London65", url: "http://igniteboulder.com/", city: "Pymble, NSW, Australia", state: "New South Wales", country: "Australia", latitude: -33.7450185, longitude: 151.1424708, slug: "ignite-london65", status: nil, twitter_name: ""}
])
Event::HABTM_Users.create!([
  {event_id: 2, user_id: 18},
  {event_id: 1, user_id: 9},
  {event_id: 2, user_id: 9}
])
Playlist.create!([

])
Playlist::HABTM_Videos.create!([
])
Role.create!([
  {name: "regular"},
  {name: "admin"},
  {name: "guru"}
])
Tag.create!([
  {name: "politics", major: nil, slug: "politics"},
  {name: "internet", major: nil, slug: "internet"}
])
Tag::HABTM_Videos.create!([

])
Upcoming.create!([
])
Video.create!([
  {title: "The Flu: From Yearly Danger to Pandemic Nightmare and what we can do to fight it", url: "https://www.youtube.com/watch?v=0XdTFUpOm0U", event_id: 41, user_id: 7, slug: "the-flu-from-yearly-danger-to-pandemic-nightmare-and-what-we-can-do-to-fight-it", speaker_name: "Zach Adams", speaker_url: "", status: "published", uid: "0XdTFUpOm0U", likes: 2, dislikes: 0, views: 72, description: "", featured: nil, hd: nil, R18: nil},
  {title: "Growing Up Assimilated", url: "https://www.youtube.com/watch?v=EMVAUl8aSqQ", event_id: 29, user_id: 1, slug: "growing-up-assimilated", speaker_name: "Gene Meier", speaker_url: "", status: "published", uid: "EMVAUl8aSqQ", likes: 1, dislikes: 0, views: 106, description: "more information to come", featured: nil, hd: nil, R18: nil},
  {title: "Why I love the valleys", url: "https://www.youtube.com/watch?v=IxmxJPPKyxQ", event_id: 3, user_id: 1, slug: "why-i-love-the-valleys", speaker_name: "Mike Jordan", speaker_url: "", status: "published", uid: "IxmxJPPKyxQ", likes: 15, dislikes: 1, views: 1294, description: "more information to come", featured: nil, hd: nil, R18: nil},
  {title: "Women with Swords or Blasters or Stakes", url: "https://www.youtube.com/watch?v=HnxzfPya7UU", event_id: 29, user_id: 1, slug: "women-with-swords-or-blasters-or-stakes", speaker_name: "Jana Knapp", speaker_url: "", status: "published", uid: "HnxzfPya7UU", likes: 0, dislikes: 0, views: 134, description: "more information to come", featured: nil, hd: nil, R18: nil},
  {title: "Is deeply offended", url: "https://www.youtube.com/watch?v=3dpXgdB8ErU", event_id: 3, user_id: 1, slug: "is-deeply-offended", speaker_name: "Jack", speaker_url: "", status: "draft", uid: "3dpXgdB8ErU", likes: 0, dislikes: 0, views: 85, description: "", featured: nil, hd: nil, R18: nil},
  {title: "And to our friends in England...please don't sue me", url: "https://www.youtube.com/watch?v=U0rZUSFX_N0", event_id: 30, user_id: 1, slug: "and-to-our-friends-in-england-please-don-t-sue-me", speaker_name: "Aoife McLysaght", speaker_url: "", status: "published", uid: "U0rZUSFX_N0", likes: 19, dislikes: 0, views: 4375, description: "more information to come", featured: nil, hd: nil, R18: nil},
  {title: "What my Uncle Paul did one summer", url: "https://www.youtube.com/watch?v=MvOp_9Q17yI", event_id: 30, user_id: 1, slug: "what-my-uncle-paul-did-one-summer", speaker_name: "Caroline Ang", speaker_url: "", status: "published", uid: "MvOp_9Q17yI", likes: 8, dislikes: 0, views: 797, description: "more information to come", featured: nil, hd: nil, R18: nil},
  {title: "Science is Real", url: "https://www.youtube.com/watch?v=vYepTH4A57I", event_id: 30, user_id: 1, slug: "science-is-real", speaker_name: "DJ Harry Moschop", speaker_url: "", status: "published", uid: "vYepTH4A57I", likes: 19, dislikes: 2, views: 1468, description: "more information to come", featured: nil, hd: nil, R18: nil},
  {title: "Beatbox and Bumper Stickers", url: "https://www.youtube.com/watch?v=GU6SdyMtJw8", event_id: 41, user_id: 7, slug: "beatbox-and-bumper-stickers", speaker_name: "Shaun Callahan and Chuck Maddox", speaker_url: "", status: "published", uid: "GU6SdyMtJw8", likes: 5, dislikes: 0, views: 126, description: "", featured: nil, hd: nil, R18: nil},
  {title: "The life of a skinny girl", url: "https://www.youtube.com/watch?v=qtTvTJdlbLY", event_id: 28, user_id: 1, slug: "the-life-of-a-skinny-girl", speaker_name: "Yasmine Mejri", speaker_url: "", status: "published", uid: "qtTvTJdlbLY", likes: 0, dislikes: 0, views: 95, description: "more information to come", featured: nil, hd: nil, R18: nil},
  {title: "Save the planet, eat a bug", url: "https://www.youtube.com/watch?v=QSs27t8nPlM", event_id: 1, user_id: 1, slug: "save-the-planet-eat-a-bug", speaker_name: "Virginia Emery", speaker_url: "", status: "published", uid: "QSs27t8nPlM", likes: 4, dislikes: 0, views: 71, description: "more information to come", featured: nil, hd: nil, R18: nil},
  {title: "Why the '8-Hour' Work Day is Total B.S.", url: "https://www.youtube.com/watch?v=SftL2UAaVmY", event_id: 29, user_id: 1, slug: "why-the-8-hour-work-day-is-total-b-s", speaker_name: "Nick Armstrong", speaker_url: "http://wtfmarketing.com/", status: "published", uid: "SftL2UAaVmY", likes: 24, dislikes: 0, views: 1784, description: "more information to come", featured: nil, hd: nil, R18: nil},
  {title: "Out of the Blocks: Penn/North", url: "https://www.youtube.com/watch?v=zVi8x0FiSkQ", event_id: 41, user_id: 7, slug: "out-of-the-blocks-penn-north", speaker_name: "Aaron Henkin & Wendel Patrick", speaker_url: "", status: "published", uid: "zVi8x0FiSkQ", likes: 0, dislikes: 0, views: 43, description: "", featured: nil, hd: nil, R18: nil},
  {title: "Images of An Uprising", url: "https://www.youtube.com/watch?v=r_Q3SCHaWKQ", event_id: 41, user_id: 7, slug: "images-of-an-uprising", speaker_name: "Joseph M. Giordano", speaker_url: "", status: "published", uid: "r_Q3SCHaWKQ", likes: 3, dislikes: 1, views: 80, description: "", featured: nil, hd: nil, R18: nil},
  {title: "American Apartheid: The Struggle for Black Space", url: "https://www.youtube.com/watch?v=PmXm65m7ukA", event_id: 41, user_id: 7, slug: "american-apartheid-the-struggle-for-black-space", speaker_name: "Dr. Lawrence Brown", speaker_url: "", status: "published", uid: "PmXm65m7ukA", likes: 3, dislikes: 0, views: 97, description: "", featured: nil, hd: nil, R18: nil},
  {title: "A meat-loving Frenchman who became vegetarian", url: "https://www.youtube.com/watch?v=RmFdfhgW5Bs", event_id: 2, user_id: 1, slug: "a-meat-loving-frenchman-who-became-vegetarian", speaker_name: "Xavier Desmet", speaker_url: "", status: "published", uid: "RmFdfhgW5Bs", likes: 4, dislikes: 0, views: 53, description: "more information to come", featured: nil, hd: nil, R18: nil},
  {title: "Who Are Our Doctors?", url: "https://www.youtube.com/watch?v=vqkfe20ca1k", event_id: 41, user_id: 7, slug: "who-are-our-doctors", speaker_name: "Tyler Mains", speaker_url: "", status: "published", uid: "vqkfe20ca1k", likes: 1, dislikes: 0, views: 41, description: "", featured: nil, hd: nil, R18: nil},
  {title: "Around the World...In Almost Eighty Days", url: "https://www.youtube.com/watch?v=CuyWYuEX1HU", event_id: 41, user_id: 7, slug: "around-the-world-in-almost-eighty-days", speaker_name: "Dr. Polly Bart", speaker_url: "", status: "draft", uid: "CuyWYuEX1HU", likes: 0, dislikes: 0, views: 25, description: "", featured: nil, hd: nil, R18: nil},
  {title: "Budget and Police Data", url: "https://www.youtube.com/watch?v=fp5WhvguHaw", event_id: 41, user_id: 7, slug: "budget-and-police-data", speaker_name: "Myra Margolin", speaker_url: "", status: "published", uid: "fp5WhvguHaw", likes: 5, dislikes: 0, views: 137, description: "Budget and police data", featured: nil, hd: nil, R18: nil},
  {title: "Love to Spare", url: "https://www.youtube.com/watch?v=l38Ip_FbctI", event_id: 41, user_id: 7, slug: "love-to-spare", speaker_name: "Sarah Ceponis", speaker_url: "", status: "published", uid: "l38Ip_FbctI", likes: 0, dislikes: 0, views: 40, description: "", featured: nil, hd: nil, R18: nil},
  {title: "Aim for the nose", url: "https://www.youtube.com/watch?v=iRxCFTHPlOk", event_id: 2, user_id: 1, slug: "aim-for-the-nose", speaker_name: "Rocky Heckman", speaker_url: "", status: "published", uid: "iRxCFTHPlOk", likes: 2, dislikes: 0, views: 285, description: "What can snipers, jet engines, and 500lb bombs teach us about effective communication?", featured: true, hd: nil, R18: nil},
  {title: "Flash Mob Gone Wrong", url: "https://www.youtube.com/watch?v=RyMdOT8YJgY", event_id: 44, user_id: 1, slug: "flash-mob-gone-wrong", speaker_name: "Tom Scott", speaker_url: "", status: "published", uid: "RyMdOT8YJgY", likes: 1622, dislikes: 68, views: 325747, description: "Tom talks about an imagined flashmob gone very wrong, highlighting potential downsides to technology and social media", featured: true, hd: nil, R18: nil},
  {title: "Granny was a hacker", url: "https://www.youtube.com/watch?v=eS9bI7KDmeU", event_id: 2, user_id: 1, slug: "granny-was-a-hacker", speaker_name: "Kris Howard", speaker_url: "http://www.web-goddess.org/", status: "published", uid: "eS9bI7KDmeU", likes: 7, dislikes: 0, views: 413, description: "It turns out that knitting shares more in common with coding than you'd imagine. And your granny may have used this fact to help spy on the enemy.", featured: true, hd: nil, R18: nil},
  {title: "Buy-A-Doll, Give-A-Doll, Empower-A-Woman", url: "https://www.youtube.com/watch?v=AlkKPojdVAk", event_id: 29, user_id: 1, slug: "buy-a-doll-give-a-doll-empower-a-woman", speaker_name: "Olivea Borden", speaker_url: "http://www.olibobolly.com/", status: "published", uid: "AlkKPojdVAk", likes: 11, dislikes: 0, views: 2809, description: "asdf", featured: false, hd: nil, R18: nil},
  {title: "Down in Denver, Down in Denver, all I did was die", url: "https://www.youtube.com/watch?v=Y3a8tAon8P8", event_id: 32, user_id: 1, slug: "down-in-denver-down-in-denver-all-i-did-was-die", speaker_name: "Kia Ruiz", speaker_url: "", status: "published", uid: "Y3a8tAon8P8", likes: 2, dislikes: 0, views: 198, description: "adsf", featured: false, hd: nil, R18: nil},
  {title: "The summer that I was arrested", url: "https://www.youtube.com/watch?v=CKi--vymZWo", event_id: 31, user_id: 5, slug: "the-summer-that-i-was-arrested", speaker_name: "Conor Houghton", speaker_url: "", status: "draft", uid: "CKi--vymZWo", likes: 11, dislikes: 0, views: 1017, description: "asdf", featured: false, hd: nil, R18: nil},
  {title: "Our Lives Defined by Beats", url: "https://www.youtube.com/watch?v=z9BnUPUlYmo", event_id: 32, user_id: 1, slug: "our-lives-defined-by-beats", speaker_name: "Aaron Templer", speaker_url: "", status: "published", uid: "z9BnUPUlYmo", likes: 1, dislikes: 0, views: 78, description: "asdf", featured: false, hd: nil, R18: nil},
  {title: "Influences", url: "https://www.youtube.com/watch?v=Jk68o6QAvvo", event_id: 30, user_id: 1, slug: "influences", speaker_name: "Shirley Temple Bar", speaker_url: "", status: "published", uid: "Jk68o6QAvvo", likes: 12, dislikes: 0, views: 1831, description: "adsf", featured: false, hd: nil, R18: nil},
  {title: "The alchemy of parenting", url: "https://www.youtube.com/watch?v=2A855D48tFI", event_id: 30, user_id: 1, slug: "the-alchemy-of-parenting", speaker_name: "Jools Gilson", speaker_url: "", status: "published", uid: "2A855D48tFI", likes: 8, dislikes: 0, views: 845, description: "adsf", featured: false, hd: nil, R18: nil},
  {title: "Protest and the Power of Storytelling", url: "https://www.youtube.com/watch?v=tDDnOtEljGU", event_id: 41, user_id: 7, slug: "protest-and-the-power-of-storytelling", speaker_name: "DeRay Mckesson", speaker_url: "", status: "published", uid: "tDDnOtEljGU", likes: 2, dislikes: 0, views: 47, description: "adf", featured: false, hd: nil, R18: nil},
  {title: "Everything that's gone wrong in my life (in five minutes)", url: "https://www.youtube.com/watch?v=4cj88oEUZMA", event_id: 2, user_id: 1, slug: "everything-that-s-gone-wrong-in-my-life-in-five-minutes", speaker_name: "Nic Newling", speaker_url: "https://twitter.com/newlz", status: "published", uid: "4cj88oEUZMA", likes: 10, dislikes: 0, views: 1552, description: "Nic bravely shares the story of his troubled family life, including his own struggles with mental illness - and how he broke through it.", featured: true, hd: nil, R18: nil},
  {title: "The pomodoro technique", url: "https://www.youtube.com/watch?v=cH-z5kmVhzU", event_id: 20, user_id: 1, slug: "the-pomodoro-technique", speaker_name: "Greg Head", speaker_url: "", status: "published", uid: "cH-z5kmVhzU", likes: 771, dislikes: 5, views: 122919, description: "Greg explains how he uses this technique to enable short bursts of useful concentration amidst his busy, distracted and multitasking life", featured: true, hd: nil, R18: nil},
  {title: "Be a maker, not just a consumer", url: "https://www.youtube.com/watch?v=tRycNcDOBcE", event_id: 2, user_id: 1, slug: "be-a-maker-not-just-a-consumer", speaker_name: "David Lockwood", speaker_url: "", status: "published", uid: "tRycNcDOBcE", likes: 0, dislikes: 0, views: 76, description: "The Raspberry Pi is an awesome, tiny computer which is perfect for learning how to make cool things, rather than consuming them. David explains why you should pick one up and get hacking.", featured: true, hd: nil, R18: nil},
  {title: "Why you should care about your local government", url: "https://www.youtube.com/watch?v=Mme2iqk1IYU", event_id: 45, user_id: 1, slug: "why-you-should-care-about-your-local-government", speaker_name: "Becky Boone", speaker_url: "", status: "published", uid: "Mme2iqk1IYU", likes: 37, dislikes: 7, views: 4287, description: "\"I do not represent the city of Boulder. All these ideas are my own. I don't want a strongly worded email to City Council tomorrow about the things I'm about to say.\"\r\n\r\nBecky Boone implores the tech-industry to get involved in local government, especially around the housing and development issues that have become so contentious in Boulder.", featured: true, hd: nil, R18: nil},
  {title: "We need to burn the Mona Lisa", url: "https://www.youtube.com/watch?v=1v-SQwLch3c", event_id: 2, user_id: 8, slug: "we-need-to-burn-the-mona-lisa", speaker_name: "Mark Avery", speaker_url: "http://www.mrbashful.com", status: "published", uid: "1v-SQwLch3c", likes: 4, dislikes: 0, views: 310, description: "We value the Mona Lisa because it's old, and rare. But the painting we all know is nothing like the artwork that Da Vinci painted, or intended us to see. We need to burn the Mona Lisa because it represents the corruption of an art world which values things only because they're collectible.", featured: false, hd: nil, R18: nil},
  {title: "Secrets of drag revealed", url: "https://www.youtube.com/watch?v=_Um4Ka8n_sQ", event_id: 2, user_id: 8, slug: "secrets-of-drag-revealed", speaker_name: "Ben Grill", speaker_url: "", status: "published", uid: "_Um4Ka8n_sQ", likes: 4, dislikes: 0, views: 248, description: "If you've ever wanted to know how to dress up in drag, this is just the talk you've been waiting for.", featured: true, hd: nil, R18: nil},
  {title: "Honest Confidence and the Lies of the Best", url: "https://www.youtube.com/watch?v=THA51biA1Fs", event_id: 29, user_id: 1, slug: "honest-confidence-and-the-lies-of-the-best", speaker_name: "Cori Wong", speaker_url: "http://coriwong.com/", status: "published", uid: "THA51biA1Fs", likes: 13, dislikes: 0, views: 576, description: "People like confident people - but so many of us struggle with being confident.", featured: true, hd: nil, R18: nil},
  {title: "Eating Goat Testicles and Other Feminist Activities", url: "https://www.youtube.com/watch?v=fu64-tmTdtg", event_id: 1, user_id: 1, slug: "eating-goat-testicles-and-other-feminist-activities", speaker_name: "Morgan Beach", speaker_url: "", status: "published", uid: "fu64-tmTdtg", likes: 2, dislikes: 1, views: 249, description: "During a trip to Azerbaja Morgan Beach had an experience that gave her a new perspective on truth, feminism, equality and America. Her story asks big questions about where the culture of Seattle, and the U.S,. are today and where it needs to go. Filmed live at Ignite Seattle 26.", featured: nil, hd: nil, R18: nil},
  {title: "Eating Fat Does Not Make You Fat ", url: "https://www.youtube.com/watch?v=9Oans3KgVOY", event_id: 2, user_id: 1, slug: "eating-fat-does-not-make-you-fat", speaker_name: "Boris Bajanovic", speaker_url: "", status: "published", uid: "9Oans3KgVOY", likes: 3, dislikes: 0, views: 133, description: "Fat has been getting a bad rap in the media and medical circles for a few decades. But what it fat isn't the evil it's been portrayed as, and eating fat doesn't actually make you fat?", featured: true, hd: nil, R18: nil},
  {title: "Finding a Roommate on Craigslist", url: "https://www.youtube.com/watch?v=AdlQkQK218o", event_id: 41, user_id: 7, slug: "finding-a-roommate-on-craigslist", speaker_name: "Raj Ghoshal", speaker_url: "", status: "published", uid: "AdlQkQK218o", likes: 2, dislikes: 0, views: 160, description: "Racial Discrimination and Housing Segregation", featured: nil, hd: nil, R18: nil},
  {title: "When the user works for you", url: "https://www.youtube.com/watch?v=3a5ZRdxGxtM", event_id: 2, user_id: 1, slug: "when-the-user-works-for-you", speaker_name: " Rose Matthews", speaker_url: "", status: "published", uid: "3a5ZRdxGxtM", likes: 0, dislikes: 0, views: 343, description: "Some big websites are terrible, and you wonder why they don't just fix them. We're looking at you, airlines. Rose explains that sometimes it's in the company's best interests to have a complicated user experience.", featured: true, hd: nil, R18: nil},
  {title: "The Cheater's Guide to Saying Thank You", url: "https://www.youtube.com/watch?v=oOPZqVF61Kc", event_id: 1, user_id: 1, slug: "the-cheater-s-guide-to-saying-thank-you", speaker_name: "Carly Slater", speaker_url: "https://www.linkedin.com/in/carlyslater", status: "published", uid: "oOPZqVF61Kc", likes: 22, dislikes: 0, views: 1067, description: "We get thanked a lot these days.\r\n\r\n\"Thank you\" appears in our lives everywhere from shopping bags to subway platforms to bus drivers.  This simple saying is now a part of our everyday experience - and unfortunately, it's losing most of its meaning along the way.\r\n\r\nThe Cheater's Guide to Saying Thank You will reveal how to escape the \"Platitude of Gratitude\" and show you 2 simple, easy-to-remember methods for communicating your appreciation to the people in your life.\r\n\r\nYou'll never have to say \"I don't have words...\" again!", featured: nil, hd: nil, R18: nil},
  {title: "Notes from a grateful dickhead", url: "https://www.youtube.com/watch?v=8Td8zLMWU4Y", event_id: 2, user_id: 1, slug: "notes-from-a-grateful-dickhead", speaker_name: "Stephen Lead", speaker_url: "http://www.stephenlead.com", status: "published", uid: "8Td8zLMWU4Y", likes: 44, dislikes: 5, views: 4568, description: "Why it's stupid to generalize about a large population of diverse people, such as cyclists. With graphs to prove it.", featured: true, hd: nil, R18: nil},
  {title: "How to Get 5 Million People to Read Your Web comic", url: "https://www.youtube.com/watch?v=QYyJZOHgpco", event_id: 1, user_id: 9, slug: "how-to-get-5-million-people-to-read-your-web-comic", speaker_name: "Matthew Inman", speaker_url: "http://www.theoatmeal.com", status: "published", uid: "QYyJZOHgpco", likes: 2000, dislikes: 55, views: 447594, description: "The Oatmeal is one of the top webcomics out there. Matthew talks about creating the site, his ideas and how he drove traffic to it. While sharing his favorite comic strips, he offers up some advice on how to create successful viral marketing campaigns.\r\n\r\nCheck out his site, http://TheOatmeal.com. It was filmed at Ignite Seattle. Watch more Ignite talks at http://igniteshow.com.", featured: true, hd: nil, R18: true},
  {title: "Why you (might not) have a mental illness", url: "https://www.youtube.com/watch?v=l_iAzo-f1lc", event_id: 2, user_id: 1, slug: "why-you-might-not-have-a-mental-illness", speaker_name: "Emma Tseris", speaker_url: "", status: "published", uid: "l_iAzo-f1lc", likes: 2, dislikes: 0, views: 136, description: "Video created by Hunting With Pixels. http://www.huntingwithpixels.com\r\nHunting With Pixels is a Sydney and Melbourne based social video strategy and production agency.", featured: false, hd: nil, R18: nil},
  {title: "Vaccinate!", url: "https://www.youtube.com/watch?v=NeaXlpQUxrY", event_id: 41, user_id: 7, slug: "vaccinate", speaker_name: "Nina Martin", speaker_url: "", status: "published", uid: "NeaXlpQUxrY", likes: 1, dislikes: 0, views: 234, description: "Unless you've been trained as a doctor, you probably don't have the right to expound on vaccination theories. This talk will help you to understand why you should vaccinate.", featured: true, hd: nil, R18: nil},
  {title: "Pinky Gonzales- The Certified Customer and the Future of Product", url: "https://www.youtube.com/watch?v=YPx_akB94cE", event_id: 37, user_id: 19, slug: "pinky-gonzales-the-certified-customer-and-the-future-of-product", speaker_name: "asdf", speaker_url: "", status: nil, uid: "YPx_akB94cE", likes: 1, dislikes: 0, views: 290, description: "asdf", featured: false, hd: nil, R18: nil},
  {title: "Elicia Putnam- Emcee for Ignite V6", url: "https://www.youtube.com/watch?v=FQNpuQfH6wg", event_id: 37, user_id: 19, slug: "elicia-putnam-emcee-for-ignite-v6", speaker_name: "asdf", speaker_url: "", status: nil, uid: "FQNpuQfH6wg", likes: 0, dislikes: 0, views: 118, description: "adsf", featured: false, hd: nil, R18: nil},
  {title: "The shitbox rally", url: "https://www.youtube.com/watch?v=BVi2huXgugI", event_id: 1, user_id: nil, slug: "the-shitbox-rally", speaker_name: "adf", speaker_url: "", status: nil, uid: "BVi2huXgugI", likes: 2, dislikes: 0, views: 130, description: "tadf", featured: false, hd: nil, R18: nil},
  {title: "The internet of TV", url: "https://www.youtube.com/watch?v=eBK8z3UrEUs", event_id: 4, user_id: 10, slug: "the-internet-of-tv", speaker_name: "Craig Sharkie", speaker_url: "", status: nil, uid: "eBK8z3UrEUs", likes: 1, dislikes: 0, views: 100, description: "Video created by Hunting With Pixels. http://www.huntingwithpixels.com\r\nHunting With Pixels is a Sydney and Melbourne based social video strategy and production agency.", featured: false, hd: nil, R18: nil},
  {title: "Richard Delamore : Esperanto -- a Created Language", url: "https://www.youtube.com/watch?v=ZXmsO1MsWn8", event_id: 2, user_id: 10, slug: "richard-delamore-esperanto-a-created-language", speaker_name: "asdf", speaker_url: "", status: nil, uid: "ZXmsO1MsWn8", likes: 10, dislikes: 0, views: 376, description: "Video created by Hunting With Pixels. http://www.huntingwithpixels.com\r\nHunting With Pixels is a Sydney and Melbourne based social video strategy and production agency.", featured: false, hd: nil, R18: nil},
  {title: "IgniteSydney #13 in 40 seconds", url: "https://www.youtube.com/watch?v=oGBz_4bBNsA", event_id: 2, user_id: 10, slug: "ignitesydney-13-in-40-seconds", speaker_name: "Svetlana Zhukova", speaker_url: "", status: nil, uid: "oGBz_4bBNsA", likes: 0, dislikes: 0, views: 168, description: "Filmed with a GoPro taking pics at 10 second intervals", featured: false, hd: nil, R18: nil},
  {title: "Ignite Sydney Marketing  - opening titles", url: "https://www.youtube.com/watch?v=MnSHp3Ee1H8", event_id: 37, user_id: 10, slug: "ignite-sydney-marketing-opening-titles", speaker_name: "a", speaker_url: "", status: nil, uid: "MnSHp3Ee1H8", likes: 0, dislikes: 0, views: 137, description: "Credits designed by http://TheManInBlue.com", featured: false, hd: nil, R18: nil},
  {title: "Lilly Kolle speaks at Ignite Sydney", url: "https://www.youtube.com/watch?v=pur9MMxBTfQ", event_id: 37, user_id: 10, slug: "lilly-kolle-speaks-at-ignite-sydney", speaker_name: "Lilly Kolle", speaker_url: "", status: nil, uid: "pur9MMxBTfQ", likes: 5, dislikes: 0, views: 320, description: "Video created by Hunting With Pixels. http://www.huntingwithpixels.com\r\nHunting With Pixels is a Sydney and Melbourne based social video strategy and production agency.", featured: false, hd: true, R18: nil},
  {title: "Joe Ortenzi : Standing for attention", url: "https://www.youtube.com/watch?v=-NYIHsDW16M", event_id: 37, user_id: 10, slug: "joe-ortenzi-standing-for-attention", speaker_name: "a", speaker_url: "", status: nil, uid: "-NYIHsDW16M", likes: 0, dislikes: 0, views: 94, description: "Video created by Hunting With Pixels. http://www.huntingwithpixels.com\r\nHunting With Pixels is a Sydney and Melbourne based social video strategy and production agency.", featured: false, hd: true, R18: nil},
  {title: "Sara Shields - How Jizziotherapy can save your agency", url: "https://www.youtube.com/watch?v=jYairpRdMlc", event_id: 37, user_id: 10, slug: "sara-shields-how-jizziotherapy-can-save-your-agency", speaker_name: "a", speaker_url: "", status: nil, uid: "jYairpRdMlc", likes: 4, dislikes: 0, views: 397, description: "Sara Shields presents at Ignite Marketing. Video by www.huntingwithpixels.com.au\r\n\r\nSara Shields (Banjo Advertising) discusses how Jizziotherapy can save your agency.\r\n\r\nWhen people are happy, they work harder and generally are more motivated. And my guess is that just a little bit of clam jousting goes a long way.\r\n\r\nSarah's Twitter Handle: @SaraAnn2", featured: false, hd: true, R18: nil},
  {title: "Manhattan to Matraville", url: "https://www.youtube.com/watch?v=KiXRsxW94qU", event_id: 2, user_id: 1, slug: "manhattan-to-matraville", speaker_name: "Joel Meares", speaker_url: "https://twitter.com/joelmeares", status: "published", uid: "KiXRsxW94qU", likes: 9, dislikes: 0, views: 383, description: "Joel left Sydney with great fanfare to head to New York City - and returned a few years later with his tail between his legs. In this talk, Joel explains what he learnt along the journey.", featured: true, hd: nil, R18: true}
])
Video::HABTM_Tags.create!([
])
Video::HABTM_Playlists.create!([
])
