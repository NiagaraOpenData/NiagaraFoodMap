Prototype: Niagara Food Maps
================

This is a web app prototype created on International Open Data Day (#NiagaraFoodMap) 

View Food Banks in the Niagara Region.


Source of Data
---------------

Data was [Scraped](https://en.wikipedia.org/wiki/Web_scraping) from (https://niagara.cioc.ca/bresults.asp?STerms=food+banks)

Then converted into JSON at https://github.com/NiagaraOpenData/niagara-food-banks/blob/master/index.json

---

Developer API
-------------

This project has an API (Application Programming Interface) allows that developers can use to build their own mobile and web apps. This was demonstrated by an iOS app created at #NiagaraFoodMap using this API as it's source of data.

### Using the API:

**GET /api/v1/foodbanks**

http://niagara-foodbanks.herokuapp.com/api/v1/foodbanks

Retrieve all the Foodbanks in the database.

**GET /api/v1/foodbanks_nearby**

http://niagara-foodbanks.herokuapp.com/api/v1/foodbanks_nearby?latitude=43.2439250&longitude=-79.0685790

Retrieve all the Foodbanks ordered by closest distance to a given location. Response contains the distance in kilometers.

Params: 

* `latitude` (example: 43.2439250)
* `longitude` (example: -79.0685790)

---

Contributing
-------------

* Continue working on Open Data Initiatives
* Developers may submit pull requests with code changes/additions

Contributing: Developers
-------------

### Working with Rails App

This application requires:

- Ruby 2.2.3
- Rails 4.2.4

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).




#### Seeding Database

Development environment uses Sqlite3 for it's data store.

Run this in your browser to sync data: http://localhost:3000/foodbanks_import.json

This route will sync your database with the scraped JSON file at https://github.com/NiagaraOpenData/niagara-food-banks/blob/master/index.json.


---

License
-------

Open! 

[official license coming soon]