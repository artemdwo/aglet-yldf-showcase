[![Dependency Status](https://gemnasium.com/artemdwo/aglet.svg)](https://gemnasium.com/artemdwo/aglet)

# Aglet

**Aglet** is test automation framework [kind of all-in-one]

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

### List of available Rake Tasks 

```bash
# rake -T
```
### List of available Rake Tasks 

```bash
# rake cuke:[RAKE_TASK]
```
#### Specific by @TAG

```bash
# rake cuke:specific TAGS=@tag
```

#### @smoke suite

```bash
# rake cuke:smoke
```

### Additional parameters

To run tests under specific browser

```bash
# ... BROWSER=browser_alias
```

To run tests against specific environment

```bash
# ... CONFIG=environment_alias
```

## Reporting

To run tests against specific environment

```bash
# ... JSON_OUTPUT=cucumber.json
```

To run specific tests by TAG

```bash
# ... JUNIT_OUTPUT=results/
```