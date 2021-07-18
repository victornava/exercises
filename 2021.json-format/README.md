# JSON Format

Decodes and formats JSON Objects nicely.

I was playing with some API a while a go that returned JSON files the other, usually the json returned by APIs is formated in a compact way:

    {"artist":"Tool","album":"Lateralus","year":2001,"is_explicit":true,"tags":[
    "rock","progresive"],"musicians":{"Adam":"Guitar","Daney":"Drums","Justin":"
    Base","Maynard":"Vocals"}}

Which is fine when you are transmitting/receiving them because it saves space. However, when you are actually looking at these json files, you want them to look this instead:

    {
      "artist": "Tool",
      "album": "Lateralus",
      "year": 2001,
      "is_explicit": true,
      "tags": [
        "rock",
        "progresive"
      ],
      "musicians": {
        "Adam": "Guitar",
        "Daney": "Drums",
        "Justin": "Base",
        "Maynard": "Vocals"
      }
    }

There are plenty of tools that do this: JQ, or JSON.pretty_generate in Ruby. 

> But how does json formatting work?

This little project is an experiment to find that out.

## Usage

Let's say you have a json string like:

    json_str = '{"artist":"Tool","album":"Lateralus","year":2001,"is_explicit":true,"tags":["rock","progresive"],"musicians":{"Adam":"Guitar","Daney":"Drums","Justin":"Base","Maynard":"Vocals"}}'

First, convert it to a JSON Object:

    json_obj = JSON.parse(json_str)

Then calling `JSONFormat.format`:

    puts JSONFormat.format(json_obj) 

Outputs:

    {
      "artist": "Tool",
      "album": "Lateralus",
      "year": 2001,
      "is_explicit": true,
      "tags": [
        "rock",
        "progresive"
      ],
      "musicians": {
        "Adam": "Guitar",
        "Daney": "Drums",
        "Justin": "Base",
        "Maynard": "Vocals"
      }
    }

