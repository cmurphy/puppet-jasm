# jasm - Just Another SSH Module

#### Table of Contents

1. [Overview](#overview)
2. [Setup](#setup)
3. [Testing](#testing)

## Overview

Just Another SSH module is a practice module to demonstrate different strategies for
designing and testing modules. It uses sshd as an example service. It should
not be used to configure sshd in a production environment. This code was used
in my introductory talk on [writing and publishing Puppet modules](http://www.slideshare.net/PuppetLabs/triageathon-june-2014-writing-and-publishing-puppet-modules)

## Setup

This module is not on the forge. To use it, clone it into your version control
system or directly into your modulepath. Run the module with `puppet apply
-e "include jasm"` or write a manifest or node definition to use this module.

The jasm module has a number of branches demonstrating different ways to approach
the design of this module. The best example of an ssh module is
[saz's](https://github.com/saz/puppet-ssh), but the simplistic approaches
demonstrated here can give you ideas for designing a module for your service.

### Testing

This module demonstrates rspec-puppet and beaker-rspec. Before running any tests, run

```
bundle install
```

#### rspec-puppet

Relevant files are `spec/spec\_helper.rb` `and spec/classes/\*`.

```
bundle exec rake spec
```

#### beaker-rspec

Relevant files are `spec/spec\_helper\_acceptance.rb` and `spec/acceptance/\*`, Requires vagrant

```
bundle exec rspec spec/acceptance
```

#### puppet-lint

bundle exec rake lint
