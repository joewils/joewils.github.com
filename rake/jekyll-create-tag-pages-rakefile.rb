desc 'Generate tag pages'

# Inspiration: 
# http://gist.github.com/262512
# https://gist.github.com/pkazmierczak/1554185

task :tags do

  puts "Generating tags..."
  require 'rubygems'
  require 'jekyll'
  include Jekyll::Filters
  
  options = Jekyll.configuration({})
  site = Jekyll::Site.new(options)
  site.read_posts('')

  # Index YML Front Matter  
  index = "---\n";
  index += "layout: page\n";
  index += "title: Tags\n";
  index += "---\n\n";

  # Posts
  site.tags.sort.each do |tag, posts|

    # Index
    index += "1. [" + tag + "](" + tag + ".html) \n"

    # YML Front Matter
    html = "---\n";
    html += "layout: page\n";
    html += "title: " + tag + "\n";
    html += "---\n\n";
 
    # List of Posts
    posts.reverse.each_with_index do |post, i|
      post_data = post.to_liquid
      html += i.to_s + ". [" + post_data['title'] + "](" + post.url + ") (" + date_to_string(post.date) + ") \n"
    end
    
    # Page
    File.open("tags/#{tag}.md", 'w+') do |file|
      file.puts html
    end

  end

  # Index Page
  File.open("tags/index.md", 'w+') do |file|
    file.puts index
  end

  puts 'Done.'

end