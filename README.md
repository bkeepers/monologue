This is a demo application to accompany my talk [The Plight of Pinocchio: JavaScript's quest to become a real language](http://opensoul.org/blog/archives/2012/05/16/the-plight-of-pinocchio/)

## Running the Tests

The integration tests use Cucumber and the unit tests use jasmine-headless-webkit, both of which are Ruby projects.

1. Install Ruby

2. Install bundler

        gem install bundler

3. From the directory that this file is in, run:

        bundle

4. Run the cucumber tests with:

        bundle exec cucumber

5. Install qt (a jasmine-headless-webkit dependency, see its [instructions if you don't have OS X & homebrew](http://johnbintz.github.com/jasmine-headless-webkit/))

        brew install qt --build-from-source

6. Run the unit tests with:

        bundle exec jasmine-headless-webkit

7. You can also run the unit tests continuously with:

        bundle exec guard