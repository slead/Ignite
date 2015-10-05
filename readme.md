#IgniteTalks.io

##Purpose of this site

  * to promote the Ignite brand
  * to showcase examples of the best videos
  * to allow people to find their nearest Ignite, including showing upcoming events
  * to help people to set up an Ignite if they want to start one

####Out of scope for the site:
  * to be a repository for every Ignite video
  * to promote any particular city’s Ignite
  * to host the videos (they should be on YouTube)

The site needs to be low-maintenance and largely self-supporting, without onerous demands once it’s set up. To that that end, there is no user registration (aside from administrators), no voting, no comments, no speaker bios, etc.

##Videos

Only the best videos should be listed on the Global Ignite site. They will be chosen by the moderators, including from submissions by each city. 

The videos on the site should be uploaded and hosted by each individual city on their own YouTube page, and linked on the Global Ignite page. This way, maintenance/moderation of the videos is the responsibility of the original city. This approach will also preserve any page views already existing on each video.

####Videos must be in HD format

Only videos at 720p or 1080p resolution should be loaded. This is becuase the video thumbnails assume HD resolution (and we should only be promoting high quallity videos anyway.)

##Site code

To recreate the site on your local machine:

 * ensure that Rails 4.x is installed (http://guides.rubyonrails.org/getting_started.html)
 * clone the site from GitHub, and change to this directory on your local machine
 * run _rake db:migrate_ to create the database
 * run _rake db:reset_ to populate the database with some sample events and videos
 * run _rails server_ to start the server
 * open [http://localhost:3000](http://localhost:3000) to view the site

##Site administration

The default admin username is _admin@ignitetalks.io_ with password _password_. This allows full access to the Admin console at [http://localhost:3000/admin](http://localhost:3000/admin)

From this panel, the administrator can add, edit and delete the Videos, Events (e.g. Ignite Seattle) and Upcoming Events (e.g. Ignite Seattle 27).

The admin user may create other users, who will then have the ability to create new Videos and Upcomings. The new users will only have write permission to the events to which they have been granted access (TODO)

##Deploy to Heroku

To publish the site on Heroku, follow the instructions at https://devcenter.heroku.com/articles/getting-started-with-rails4

To deploy the Heroku site to http://www.ignitetalks.io/ follow the instructions at http://stackoverflow.com/a/25925332/906814

