# fluent-plugin-dedot_filter

Fluentd Filter plugin to de-dot field name for elasticsearch 2.x.

## Installation

Add this line to your application's Gemfile:

```bash
# for fluentd
gem install fluent-plugin-dedot_filter

# for td-agent2
td-agent-gem install fluent-plugin-dedot_filter
```

## Usage

```xml
<filter access.apache>
  @type             dedot
  de_dot            true
  de_dot_separator  _
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

