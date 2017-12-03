# fluent-plugin-dedot_filter

[![Gem Version](https://badge.fury.io/rb/fluent-plugin-dedot_filter.svg)](https://badge.fury.io/rb/fluent-plugin-dedot_filter)
[![Build Status](https://travis-ci.org/lunardial/fluent-plugin-dedot_filter.svg?branch=master)](https://travis-ci.org/lunardial/fluent-plugin-dedot_filter)
[![Code Climate](https://codeclimate.com/github/lunardial/fluent-plugin-dedot_filter/badges/gpa.svg)](https://codeclimate.com/github/lunardial/fluent-plugin-dedot_filter)
[![Coverage Status](https://coveralls.io/repos/github/lunardial/fluent-plugin-dedot_filter/badge.svg)](https://coveralls.io/github/lunardial/fluent-plugin-dedot_filter)
[![downloads](https://img.shields.io/gem/dt/fluent-plugin-dedot_filter.svg)](https://rubygems.org/gems/fluent-plugin-dedot_filter)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

Fluentd Filter plugin to de-dot field name for elasticsearch.

## Requirements

| fluent-plugin-dedot_filter  | fluentd |
|-----------------------------|---------|
| >= 1.0.0 | >= v0.14.0 |
|  < 1.0.0 | >= v0.12.0 |

## Installation

Add this line to your application's Gemfile:

```bash
# for fluentd v0.12
gem install fluent-plugin-dedot_filter -v "< 1.0.0"

# for fluentd v0.14 or higher
gem install fluent-plugin-dedot_filter

# for td-agent2
td-agent-gem install fluent-plugin-dedot_filter -v "< 1.0.0"

# for td-agent3
td-agent-gem install fluent-plugin-dedot_filter
```

## Usage

```xml
<filter access.apache>
  @type             dedot
  de_dot            true
  de_dot_separator  _
  de_dot_nested     false
</filter>
```

## parameters

* `de_dot` (default: true)
* `de_dot_separator` (default: '_')
* `de_dot_nested` (default: false)

`de_dot_separator` cannot be or contain '.'.
`de_dot_nested` will cause the plugin to recurse through nested structures (hashes and arrays), and remove dots in those key-names too.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

