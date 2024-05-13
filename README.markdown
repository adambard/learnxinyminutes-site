## [LearnXInYMinutes.com](https://learnxinyminutes.com/)

This is the [Middleman](https://middlemanapp.com) site behind the magic.

To build the site, first install Git and Ruby 3+, then

```sh
git clone https://github.com/adambard/learnxinyminutes-site.git
cd learnxinyminutes-site
git clone https://github.com/adambard/learnxinyminutes-docs.git source/docs

gem install bundler
bundle install
bundle exec middleman serve
```

You need to check out the [learnxinyminutes-docs](https://github.com/adambard/learnxinyminutes-docs)
repo as `source/docs`. All the code that builds the site is in config.rb
