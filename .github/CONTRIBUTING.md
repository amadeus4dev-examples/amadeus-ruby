## Development and Testing

To run the project locally, clone the repository and install the dependencies.

```
git clone https://github.com/amadeusdev/amadeus-ruby.git
cd amadeus-ruby
bundle
```

### Running tests

To run tests, simply run `rake` or `guard` to keep watching the source for changes and test accordingly.

We are trying to keep 100% coverage, so keep an eye on the `coverage` folder for an overview of the coverage.

### Using a library locally

#### Method 1

To use a library locally as a dependency, simply link to this library in your project by path:

```ruby
gem 'amadeus', path: '../path/to/clone'
```

To install quickly and get playing with your code we have added a console that automatically includes the gem into the gem path.

```sh
rake console
> amadeus = Amadeus::Client.new
```

Alternatively you can use Amadeus in your script as follows.

```sh
ruby -r amadeus -I ./lib script.rb
```

#### Method 2

Add all your files to your git repo:

```sh
git add --all
```

This is required because the files that are packaged in the library (edited) can only be packaged if they are added to the git repo
(not commited).

Then run the following 3 commands to generate the gem locally and install it in the amadeus-ruby project:

```sh
build amadeus.gemspec
```

```sh
gem uninstall amadeus
```

```sh
gem install amadeus-1.0.0.gem
```



### Releasing

To make a new release, follow the following steps:

- [ ] Update the version in `version.rb` using semver rules
- [ ] Update the `CHANGELOG.md` with the new version
- [ ] Push all changes and ensure all tests pass on Travis
- [ ] Tag your release in git using `git --tag vX.X.X`
- [ ] Push the new tag `git push --tags`
- [ ] Update the [Releases](https://github.com/amadeus4dev/amadeus-ruby/releases) tab on GitHub with a new release for the tag, copying the description from the `CHANGELOG.md`

Travis will bow build the gem and release it to RubyGems.

## How to contribute to the Amadeus Ruby Gem

#### **Did you find a bug?**

* **Ensure the bug was not already reported** by searching on GitHub under [Issues](https://github.com/amadeusdev/amadeus-ruby/issues).

* If you're unable to find an open issue addressing the problem, [open a new one](https://github.com/amadeusdev/amadeus-ruby/issues/new). Be sure to include a **title and clear description**, as much relevant information as possible, and a **code sample** or an **executable test case** demonstrating the expected behavior that is not occurring.

#### **Did you write a patch that fixes a bug?**

* Open a new GitHub pull request with the patch.

* Ensure the PR description clearly describes the problem and solution. Include the relevant issue number if applicable.

#### **Do you intend to add a new feature or change an existing one?**

* Suggest your change [in a new issue](https://github.com/amadeusdev/amadeus-ruby/issues/new) and start writing code.

* Make sure your new code does not break any tests and include new tests.

* With good code comes good documentation. Try to copy the existing documentation and adapt it to your needs.

* Close the issue or mark it as inactive if you decide to discontinue working on the code.

#### **Do you have questions about the source code?**

* Ask any question about how to use the library by [raising a new issue](https://github.com/amadeusdev/amadeus-ruby/issues/new).

#### **Do you want to contribute to the documentation?**

Excellent, to get start developing this library ensure you have Ruby 2.2+ installed and clone the repository.

Then, you should be able to run the tests.

```sh
bundle install # ensure all gems are installed
guard # watches for changes and runs all tests and updates docs
```
