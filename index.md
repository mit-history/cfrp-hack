---
layout: default
---

# Bienvenue!

This is a starter kit to help you start a project for the CFRP hackathon quickly. Feel free to use as much or as little of these resources and ideas as you find useful.

> _Please note, this website is itself a [github repository](https://github.com/jamiefolsom/cfrp-hack/), and we would welcome your input on it. If you have ideas or questions, or you find problems, please [open a ticket](https://github.com/jamiefolsom/cfrp-hack/issues), or better yet, fork it, fix it, and open a [pull request](https://github.com/jamiefolsom/cfrp-hack/pulls)!_

Some suggested first steps.

## 1. Get familiar with the data

The project has generated a lot of different sorts of data 

1. [Read the listing of data tables and definitions](/data)
2. [Explore](/tools)
3. Ask questions about how data are structured

## 2. Choose and define a project

On Friday afternoon, we'll have a chance to talk with researchers and other developers about possible project ideas. Choose one that interests you. Ask historians and developers any questions you have about how to proceed. In the meantime, have a look at some [suggested project categories](/ideas).

## 3. Hack!

### Set up
- Fork [this site](https://github.com/jamiefolsom/cfrp-hack/)
- Clone this repo locally; then:
- `git branch your-project`
- `cp project-template.html yourpage.html` Or you can create a new `_layout/template-name.html` including tools of your choosing.
- If there is a request in Postman that serves your purposes, you can click "Generate Code" to get a copy/pasteable API client in your language of choice.

### Run this site locally

- If you have ruby installed:
- `gem install bundler`
- `bundle install`
- `jekyll serve`

### Add your project to the site

- `git add .`
- `git commit -m "Created hackathon project"`
- `git push`
- Open a Pull request against the upstream repo.
