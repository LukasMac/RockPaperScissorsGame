require 'rubygems'
require 'sinatra'

OPTIONS = ['rock', 'paper', 'scissors']

configure do
  set :port, 1337
end

get '/playerA_plays' do
  OPTIONS.sample
end

get '/playerB_plays' do
  OPTIONS.sample
end
