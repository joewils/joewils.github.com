desc 'Generate category pages'

task :categories do

  puts "Generating categories..."
  require 'rubygems'
  require 'jekyll'
  include Jekyll::Filters
  
  options = Jekyll.configuration({})
  site = Jekyll::Site.new(options)
  site.read_posts('')

  # Index YML Front Matter  
  index = "---\n";
  index += "layout: page\n";
  index += "title: Categories\n";
  index += "---\n\n";

  # Category Pages
  site.categories.sort.each do |category, posts|

    # Index
    index += "1. [" + category + "](" + category + ".html) \n"

    # YML Front Matter
    html = "---\n";
    html += "layout: page\n";
    html += "title: " + category + "\n";
    html += "---\n\n";
 
    # List of Posts
    posts.reverse.each_with_index do |post, i|
      post_data = post.to_liquid
      html += i.to_s + ". [" + post_data['title'] + "](" + post.url + ") (" + date_to_string(post.date) + ") \n"
    end
    
    # Page
    File.open("categories/#{category}.md", 'w+') do |file|
      file.puts html
    end

  end

  # Index Page
  File.open("categories/index.md", 'w+') do |file|
    file.puts index
  end

  puts 'Done.'
  
end