[![Dependency Status](https://gemnasium.com/artemdwo/aglet.svg)](https://gemnasium.com/artemdwo/aglet)
[![Code Climate](https://codeclimate.com/github/artemdwo/aglet/badges/gpa.svg)](https://codeclimate.com/github/artemdwo/aglet)
[![Test Coverage](https://codeclimate.com/github/artemdwo/aglet/badges/coverage.svg)](https://codeclimate.com/github/artemdwo/aglet)

# Aglet

**Aglet** is Cucumber-based test automation framework [kind of all-in-one]

## Audience
**Aglet** especially for you, if you're:

 - interesting in quality of your project
 - looking for something simple to follow BDD approach
 - not going to create testing tool from scratch
 
## How to start?
Grab a copy
```bash
git clone https://github.com/artemdwo/aglet.git
```
## How to run ?

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
