require 'rubygems'
require 'sinatra/base'
require 'bootstrap-sass'
require 'haml'
require 'pry'

class SinatraBadges < Sinatra::Base
  require './helpers/render_partial'
  require './app/circleci'

  get '/' do
    haml :index
  end

  get '/badge/*' do
    owner, repo, branch = params[:splat].join.match(URL_REGEX)[1..3]
    "#{request.base_url}/img/#{owner}/#{repo}#{"/#{branch}" if branch}?token=#{params[:token]}"
  end

  get '/img/:owner/:repo/?*' do
    response.headers['Cache-Control'] = 'no-cache'
    response.headers['Last-Modified'] = Time.now.httpdate
    response.headers['ETag'] = Time.now.utc.strftime("%s%L")
    if params[:token] && !params[:token].empty?
      params[:branch] ||= branch(params[:splat].first)
      redirect_to_badge
    else
      haml :error, layout: true
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
