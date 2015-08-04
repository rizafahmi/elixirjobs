# ElixirJobs

To start this Phoenix application:

1. Make sure you have [RethinkDB](http://rethinkdb.com) up and running
2. Install dependencies with `mix deps.get`
3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Fixtures Data

### Devs Data

Insert this data from your [Rethinkdb admin site](http://localhost:8080).

```javascript
r.table("jobs").insert([
    {
    "name": "Steve Jobes",
    "description": "Steve Jobes is a fictional character designed to resemble someone familiar to readers.",
    "picture": "steve.jpg",
    "location": "Cupertino"
    },
    {
    "name": "Veronika Ossi",
    "description": "Living in New York who enjoys kittens, music, and partying.",
    "picture": "geek.jpg"
    }
]);

r.table("devs").insert([
    {
    "description": "Mad computer scientist who enjoy managing geeks and developers since 2011, more than 10 years of successful experience in Programming Web Applications using PHP, Python and *Elixir*, iOS Applications using Obj-C and Android Applications using  Java. Also have capabilities  handling various databases such as PostgreSQL, MySQL, Mongodb, SQLite, CouchDB. My specialty is trying crazy ideas and getting them to work." ,
    "email": "rizafahmi@gmail.com", 
    "github_url": "https://github.com/rizafahmi",
    "id":  "7211d0e4-973f-4106-b82b-f39f08c345f3" ,
    "interest_fulltime":  "on" ,
    "interest_hourly":  "on" ,
    "interest_mentoring":  "on" ,
    "interest_other":  "on" ,
    "interest_term":  "on" ,
    "interest_volunteer":  "on" ,
    "linkedin_url": "https://id.linkedin.com/in/rizafahmi",
    "location":  "Jakarta, Indonesia" ,
    "name":  "Riza Fahmi" ,
    "picture_url": "https://spdy.linkedin.com/mpr/mpr/shrinknp_400_400/p/4/000/16b/16d/0ea4677.jpg",
    "resume_url": "https://id.linkedin.com/in/rizafahmi",
    "short_desc":  "Mad Computer Scientist and Technopreneur.  My specialty is trying crazy ideas and getting them to work." ,
    "twitter_url": "https://twitter.com/rizafahmi22",
    "views": 1 ,
    "website": "http://elixirdose.com",
    }
]);
```
