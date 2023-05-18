# Reload Gems in Sinatra

Proof of concept for reloading gem dependencies in a Sinatra app and
[Zeitwerk](https://github.com/fxn/zeitwerk#reloading).

**Notes**

Zeitwerk doesn't provide a mechanism for finding the loader to initiate per-request reloading,
so I've stored the loader as `HelloWorld::Loader`. This is really only needed for shared
application code that changes rapidly during development. Utilities and other third-party gems
don't need to be reloaded on each request.

When code is reloaded before a request, Zeitwerk drops all constants defined by the loader. It
doesn't do any kind of change detection. Code will then be automatically loaded by Zeitwerk as
the request is handled. This means memoized objects from the gem can diverge and cause bugs. The
reload is wrapped in a mutex, but this isn't guaranteed to be thread-safe and is not suitable
for production. Code should be reloaded in production anyway.
