require "bundler/setup"
require "sinatra"
require "hello_world"

MUTEX = Thread::Mutex.new

before do
  MUTEX.synchronize do
    HelloWorld::Loader.reload
  end
end

get "/" do
  HelloWorld::Greeting.new.to_s
end
