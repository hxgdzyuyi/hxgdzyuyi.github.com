---
title: "Community Extensions"
---
## Git

- Git 是什么

``` ruby
require 'rack/codehighlighter'
require "pygments"

use Rack::Codehighlighter, 
  :pygments,
  :element => "pre>code",
  :pattern => /\A:::([-_+\w]+)\s*\n/,
  :markdown => true
```

# `w=1`
