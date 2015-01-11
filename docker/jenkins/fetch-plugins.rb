#!/usr/bin/env ruby

require 'open-uri'

JENKINS_BASE_URL = "http://mirrors.jenkins-ci.org"

PLUGINS = {
  "batch-task" => "1.17",
  "build-name-setter" => "1.3",
  "build-pipeline-plugin" => "1.4.5",
  "chucknorris" => "0.5",
  "clone-workspace-scm" => "0.6",
  "copyartifact" => "1.32.1",
  "deploy" => "1.10",
  "embeddable-build-status" => "1.6",
  "git-client" => "1.15.0",
  "github-api" => "1.59",
  "github" => "1.10",
  "git" => "2.3.4",
  "gitlab-hook" => "1.1.0",
  "html-audio-notifier" => "0.4",
  "jenkinswalldisplay" => "0.6.27",
  "join" => "1.15",
  "locks-and-latches" => "0.6",
  "mercurial" => "1.51",
  "promoted-builds" => "2.19",
  "ruby-runtime" => "0.12",
  "scm-api" => "0.2",
  "token-macro" => "1.10"
}

if Dir.glob("plugins").empty?
  puts "Create directory 'plugins/'"
  Dir.mkdir("plugins")
end

PLUGINS.each do |plugin, version| 
  file = "plugins/%s.hpi" % [plugin]
  url = "%{base_url}/plugins/%{plugin}/%{version}/%{plugin}.hpi" % { 
         :base_url => JENKINS_BASE_URL,
         :plugin => plugin,
         :version => version
       }
  url = "%{plugin}:%{version}" % { 
         :base_url => JENKINS_BASE_URL,
         :plugin => plugin,
         :version => version
       }
  puts url
#  open(file,"wb") do |file|
#    puts "Download %s from %s" % [plugin, url]
#    file << open(url).read
#  end
end
