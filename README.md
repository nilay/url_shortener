# URL Shortener

Small Ruby on Rails application to shorten the url

Things you may want to cover:

* Ruby version: 2.3.1


### Get shortended url
```
POST /
param: url
response: shortended url
```


### use shortended url to redirect to original url
```
GET <shortended url>`
it will redirect to original url
```

## Run Unit Test
`$ rspec`


## Rubocop
```shell
MacBook-Pro:url_shortener nilayanand$ rubocop
Inspecting 37 files
.....................................

37 files inspected, no offenses detected

```