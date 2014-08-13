require 'open-uri'
require 'multi_xml'

URL_REGEX = %r{circleci.com/.+?/(.+?)/(.+?)(?:/tree/(.*))?$}

def circleci_url
  "https://circleci.com/gh/#{params[:owner]}/#{params[:repo]}/tree/#{params[:branch] || 'master'}.cc.xml?circle-token=#{params[:token]}"
end

def status(xml)
  MultiXml.parse(xml)['Projects']['Project']['lastBuildStatus']
end

def badge(status)
  status == 'Success' ? 'build-passing-green' : 'build-failing-red'
end

def badge_url(badge)
  "https://img.shields.io/badge/#{badge}.svg"
end

def redirect_to_badge
  xml = open(circleci_url).read
  redirect badge_url(badge(status(xml)))
end

def branch(args)
  args && !args.empty? && args
end
