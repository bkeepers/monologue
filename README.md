This is a demo application to accompany my talk [The Plight of Pinocchio: JavaScript's quest to become a real language](http://opensoul.org/blog/archives/2012/05/16/the-plight-of-pinocchio/)

## Running the Tests

The integration tests use Cucumber and the unit tests use Evergreen, both of which are Ruby projects.

1. Install Ruby

2. Install bundler

        gem install bundler

3. From the directory that this file is in, run:

        bundle

4. Run the cucumber tests with:

        bundle exec cucumber

5. Run the unit tests with:

        bundle exec evergreen run
