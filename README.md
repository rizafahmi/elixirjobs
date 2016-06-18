# ElixirJobs

To start this Phoenix application:

1. Make sure you have [RethinkDB](http://rethinkdb.com) up and running
2. Install dependencies with `mix deps.get && npm install`
3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Fixtures Data

### Devs Data

Insert this data from your [Rethinkdb admin site](http://localhost:8080). Otherwise, the app will not gonna worked.

```javascript
r.tableCreate("users");
r.tableCreate("jobs");
r.tableCreate("devs");

r.table("jobs").insert([
    {
    "company":  "ElixirDose" ,
    "date_created": 1434440234 ,
    "description":  "## Job Descriptions

    This is job desc area

    ",
    "email": "rizafahmi@gmail.com",
    "job_status":  "" ,
    "job_type":  "" ,
    "location":  "" ,
    "logo": "http://jobs.elixirdose.com/images/elixirjobs-logo.png",
    "posted_by": "rizafahmi@gmail.com",
    "title":  "Writer's Needed" ,
    "views": 7
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
