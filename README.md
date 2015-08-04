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
r.db("test").table("jobs").insert([
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
```
