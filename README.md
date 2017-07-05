[![Dependency Status](https://gemnasium.com/artemdwo/aglet.svg)](https://gemnasium.com/artemdwo/aglet)
[![Code Climate](https://codeclimate.com/github/artemdwo/aglet/badges/gpa.svg)](https://codeclimate.com/github/artemdwo/aglet)
[![Test Coverage](https://codeclimate.com/github/artemdwo/aglet/badges/coverage.svg)](https://codeclimate.com/github/artemdwo/aglet)

# Aglet showcase

**Aglet** is Cucumber-based test automation framework [kind of all-in-one]

## How to start?
Grab a copy
```bash
git clone https://github.com/artemdwo/aglet.git
```

## What's inside?
### Configuration

`../config/config.yml` - Contains range of default `timeouts` and `environment configurations` where `site_root` (aka `base_url`) is defined.
### Features and Step Definitions

`../features/*.feature` - each `*.feature` file contains a range of `Scenarios` (aka `Test Cases`) describing expected behaviour and assertions in **Behavioural** format (supporting **BDD**).

[Google Keep Scenarios](https://github.com/artemdwo/aglet-yldf-showcase/blob/master/features/keep.feature)

`../features/step_definitions/*_steps.rb` - each `*_steps.rb ` file contains background scripting (coding) of the `Steps` that comprise `Scenarios`, which transform `Behaviour` into `Action`. That's the place where **magic** happens.
### Page Object Models and content

`../lib/model/domain/*_details.rb` - content (test data) container classes

`../lib/model/page/*.rb` -  page object models (elements and methods)

`../lib/model/section/*.rb` - page object models (elements and methods) of repetitive blocks to prevent duplication across pages

`../lib/model/aglet.rb` - project object that combines everything together

## How to run?

Ensure you have following installed:
 - **Ruby** _2.2.0+_ (use `rvm`)
 - **Bundler** _latest_ (`gem install bundler`)
 - **Selenium WebDriver** _latest_ (http://docs.seleniumhq.org/download/)
 - **Chromedriver** _latest_ - to run Google Chrome (`$ brew install chromedriver`)
 - **Geckodriver** _latest_ - to run Firefox (`$ brew install geckodriver`)

### List of available Rake Tasks
Check what's already available
```bash
# rake -T
```
### Run particular Rake task
Run `RAKE_TASK`
```bash
# rake cuke:[RAKE_TASK]
```

**RAKE_TASK** available from:
 - `$ rake -T`
 - config/cucumber.yml

#### Example: @smoke suite
Run `smoke` predefined suite
```bash
# rake cuke:smoke
```
#### Use 'specific' Rake task to run tests by @TAG
Run suite that will be filtered by `@tag`
```bash
# rake cuke:specific TAGS=@tag
```
### Additional parameters
To run tests under specific browser

```bash
# ... BROWSER=browser_alias
```

**browser_alias**:
 - _selenium_chrome_ for Google Chrome
 - _selenium_firefox_ for Firefoz

To run tests against specific environment

```bash
# ... CONFIG=environment_alias
```

See config/config.yml, for example _default_env_, _environment_name_

### Reporting
Test reports in JSON format:

```bash
# ... JSON_OUTPUT=cucumber.json
```

Test reports in JUNIT format:

```bash
# ... JUNIT_OUTPUT=results/
```
