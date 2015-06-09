# ElixirJobs

To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.


## Fixtures Data

### Devs Data

```r.db("test").table("jobs").insert([
  {"name":"Steve Jobes", "description": "Steve Jobes is a fictional character designed to resemble someone familiar to readers.",
    "picture": "steve.jpg", "location": "Cupertino"
         },
  {"name": "Veronika Ossi", "description": "Living in New York who enjoys kittens, music, and partying.",
    "picture": "geek.jpg"},

  ])```
