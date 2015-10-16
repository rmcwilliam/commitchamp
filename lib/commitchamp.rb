require "httparty"
require "pry"

require "commitchamp/version"
require "commitchamp/github_api"

module Commitchamp
  class App
    def initialize
      @weeks 
    end

    def run
      #table = {:username => "", :additions => "", :deletions => "", :changes => "" }
      table = Array.new
      additions = Array.new
      

      puts "Please enter your authentication token:"
      token = STDIN.gets.chomp
      auth = Githubapi.new(token)

      puts "Please enter the owner of the repo you would like to view:"
      owner = STDIN.gets.chomp

      puts "Please enter the repo you are interested in viewing:"
      repo = STDIN.gets.chomp

      results = auth.get_contributions(owner, repo)  

      results.each do |result|
        username = result["author"]["login"]
        @weeks = result["weeks"]
        table.push(username)
        #binding.pry
      end
    
      @weeks.each do |week|
       add = week["a"]
       delete = week["d"]
       commit = week["c"]
       #additions.push(add)
        binding.pry
      end
        sum = additions.inject {|sum, n| sum + n}
        #binding.pry
    end
  end
end

app = Commitchamp::App.new
app.run

## Contributions for 'owner/repo'

# Username      Additions     Deletions     Changes
# User 1            13534          2954        6249
# User 2             6940           913        1603

# Prompt the user for an auth token
# Ask the user what org/repo to get data about from github
# Print a table of contributions ranked in various ways
# Ask the user if they'd like to fetch another or quit.

# You don't have to track contributions by week, just sum them to get a total.
# Once all the contributions have been collected for a repo, offer to sort them by:
# 1) lines added 2) lines deleted 3) total lines changed 4) commits made



