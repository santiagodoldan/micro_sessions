# Micro Sessions

[![Build Status](https://secure.travis-ci.org/santiagodoldan/micro_sessions.png?branch=master)](http://travis-ci.org/santiagodoldan/micro_sessions)

**DEPRECATION WARNING: micro_session 0.4.0 includes breaking changes, for previous versions see [Readme](https://github.com/santiagodoldan/micro_sessions/wiki/micro_sessions---=-0.3.0-%5BREADME%5D).**

In terms of passing data amongst HTTP requests there are really two options:
* Param or form data passing
* Storing in cookies
* Storing in server-side session, keyed off an ID stored as a cookie.

For a certain application where you're using number 3, this comes at a cost - the session is "global".  In other words, in a single browser window with multiple tabs, the server side cannot distinguish between individual "sessions" *within* that browser session. This gem introduces a fourth, more granular method:
* Storing in server-side session, keyed off an ID stored as a cookie *and* keyed off a request parameter.

This could be useful in instances such as a very complex wizard where transmitting the entire history of data RESTfully via param passing may not be feasible, yet you'd still like to support multiple tabs within the same browser window separately.

## Installation

Include the gem in your Gemfile:

```ruby
gem "micro_sessions"
```

## Usage

Simply include MicroSessionable in your controller:

```ruby
class ApplicationController
  include MicroSessionable
end
```

From there you will have access to a `micro_session` object in your controllers and views, just like the `session` object.

```ruby
def new
  micro_session[:key] = "Value"
end
```

By default the name of the request parameter used to differentiate micro-sessions is `_msid`, though this can be configured:

```ruby
MicroSession.configure do |config|
  config.key = "_msid"
end
```

By default the key generated will be a 10-digit random hash, though this can be configured as well:

```ruby
MicroSession.configure do |config|
  config.type = :integer
  config.length = 10
end
```

Valid values for `type` are:
* `:random_hash`
* `:integer`  (simply increments from one)
* `:random_integer` (random integer with a maximum of `:length` digits)

Session data is accessible to the controller and view through the `micro_session` object, which works identically to the `session` object but it specific to the micro-session:

```ruby
micro_session[:key] = "Value"
micro_session[:key] # => "Value"
```

When transitioning between pages for which you'd like to keep the micro-session alive, just use the custom `ms_link_to` helper method:

```ruby
ms_link_to "Persist session", user_path(@user)
```

You can also build the url manually getting the proper information from micro_session:

```ruby
redirect_to user_path(@user, micro_session.url_options)
```

If you wish to transmit the identifier via a form, be sure to include the hidden field:

```ruby
<% form_for(@user) do |f| %>
  <%= micro_session_hidden_field %>
  ...
<% end %>
```
