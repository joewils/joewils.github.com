puts 'links.rb'
require 'uri'
require 'yaml'
require 'base64'
require 'open-uri'
require 'nokogiri'
require 'securerandom'
require 'open3'
require 'iconv'

# Helper method
def truncate(string, max)
  string.length > max ? "#{string[0...max]}..." : string
end

# _posts
files = Dir["_posts/*.md"]

# Track progress with YAML
if File.exist? '_scripts/urls.yml'
  urls = YAML.load_file('_scripts/urls.yml')
else
  urls = {}
end
puts urls.length

# Find Link URLs
if false
  files.each do |file|
    # Determine Date From Filename
    bits = file.gsub('_posts/','').split('-')
    next if bits.length < 4
    date = bits[0] + '-' + bits[1] + '-' + bits[2]
    # Read the file into a string for parsing
    post = File.read(file)
    # Find strings between parens
    #puts links = post[/\((.*?)\)/m]
    links = post.scan(/\((.*?)\)/m)
    # Determine if they are really links
    links.each do |link|
      if link[0].include? 'http' and !link[0].include? '.jpg' and !link[0].include? '.png'
        # Build a unique ID, limit it to 200 characters
        uid = SecureRandom.uuid
        urls[uid]={'date'=>date,'url'=>link[0],'status'=>nil}
      end
    end
  end
end

# Retrieve HTML and Archive
if false
  urls.each do |key,values|
    uid = key
    puts url = values['url']
    puts values
    puts status = values['status']
    filename = '_html/'+key+'.html'
    if !File.exist? filename and status != 404
      begin
        source = open(url).read
        File.open(filename, "w") do |f|     
          f.write(source)   
        end
        urls[uid]['status'] = 200
      rescue
        urls[uid]['status'] = 404
      end
    end
  end
end

# Clean up status
if false
  urls.each do |key,values|
    uid = key
    puts url = values['url']
    filename = '_html/'+key+'.html'
    if File.exist? filename
        urls[uid]['status'] = 200
    else
      urls[uid]['status'] = 404
    end
  end
end

# Parse HTML and retrieve TITLE
if false
  urls.each do |key,values|
    puts uid = key
    puts url = values['url']
    status = values['status']
    filename = '_html/'+key+'.html'
    if File.exist? filename and status == 200 and !urls[uid].has_key? 'title'
      source = open(filename).read
      doc = Nokogiri::HTML(source)
      if doc.at_css('title')
        title = doc.at_css('title').text.encode("ASCII", invalid: :replace, undef: :replace, replace: '').gsub("\n",' ').strip
      else
        title = nil
      end
      puts urls[uid]['title'] = title
    end
  end
  File.open('_scripts/urls.yml', 'w') {|f| f.write urls.to_yaml }
end

# UID from URL Base64 encoding is dumb... 
# Reformat using a guid
if false
  guid_urls = {}
  urls.each do |key,values|
    uid = key
    guid = SecureRandom.uuid
    old_filename = '_html/'+key+'.html'
    new_filename = '_html_guid/'+guid+'.html'
    puts new_filename
    guid_urls[guid] = values
    if File.exist? old_filename
      File.rename(old_filename, new_filename)
    end
  end
  puts guid_urls
  puts guid_urls.length
  File.open('_scripts/urls.yml', 'w') {|f| f.write guid_urls.to_yaml }
end

# Grab screenshot using Chrome headless
if false
  count = 0
  urls.each do |guid,values|
    if values['status'] == 200
      puts values['url']
      # Use Chrome to generate PNG Screenshot
      if !File.exist? '_screenshots/'+guid+'.png'
        call = '( /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --screenshot=_screenshots/'+guid+'.png --window-size=1280,1280 ' + values['url'] + ' ) & sleep 10 ; kill $!'
        puts call
        Open3.popen3(call) do |stdin, stdout, stderr, thread|
          begin
            puts "Generating screenshot"
            puts thread.pid
            puts stdout.read.chomp
          rescue
            Process.kill("KILL", thread.pid)
          end
        end
      end
      # Use ImageMagick to convert to jpg and resize
      if File.exist? '_screenshots/'+guid+'.png' and !File.exist? 'screenshots/'+guid+'.jpg'
        call = 'convert _screenshots/'+guid+'.png -quality 80 -resize 640x640 screenshots/'+guid+'.jpg'
        puts call
        Open3.popen3(call) do |stdin, stdout, stderr, thread|
          begin
            puts "Converting screenshot to JPG"
            puts thread.pid
            puts stdout.read.chomp
          rescue
            Process.kill("KILL", thread.pid)
          end
        end
      end
      count = count+1
    end
  end
end

# Update data with screenshots
if false
  urls.each do |guid,values|
    if File.exist? 'screenshots/'+guid+'.jpg'
      puts guid
      urls[guid]['screenshot'] = 'screenshots/'+guid+'.jpg'
    end
  end
end

# Build posts
if false
  urls.each do |guid,values|
    next if values['title'] == nil or values['title'] == ''
    # Build slug for url
    safe_title = Iconv.conv('ASCII//IGNORE', 'UTF8', values['title'])
    bits = safe_title.downcase.gsub('-',' ').split(' ')
    slug = '' 
    bits.first(4).each do |bit|
      bit.gsub!('/','')
      bit.gsub!(':','')
      bit.gsub!(',','')
      bit.gsub!('$','')
      bit.gsub!('|','')
      bit.gsub!('\'','')
      bit.gsub!('.','')
      bit.gsub!('?','')
      bit.gsub!('[','')
      bit.gsub!(']','')
      bit.gsub!('(','')
      bit.gsub!(')','')
      bit.gsub!('@','')
      bit.gsub!('#','')
      bit.gsub!('=','')
      bit.gsub!('+','-')
      bit.gsub!('&nbsp','')
      bit.gsub!(';','')
      bit.gsub!('"','')
      bit.gsub!('!','')
      bit.gsub!('%','')
      bit.gsub!('&','')
      bit.gsub!('_','-')
      bit.gsub!('----','-')
      bit.gsub!('---','-')
      bit.gsub!('--','-')
      next if bit == ''
      next if bit == '-'
      if slug == ''
        slug = bit
      else
        slug = slug + '-' + bit
      end
    end
    slug = values['date']+'-'+slug
    # YML Front Matter  
    yml = "---\n";
    yml += "layout: link\n";
    yml += "title: \""+safe_title+"\"\n"
    yml += "url: '"+values['url']+"'\n"
    yml += "screenshot: '"+values['screenshot']+"'\n" if values['screenshot']
    yml += "---\n\n";
    # Save file
    filename = '_posts/'+slug+'.md'
    if !File.exist? filename 
      puts filename
      File.open(filename, 'w') {|f| f.write yml }
    end
  end
end

# Fix url to source
if false
  files = Dir["_posts/*.md"]
  files.each do |file|
    post = File.read(file)
    puts post
    post.gsub!('url:','source:')
    File.open(file, 'w') {|f| f.write post }
  end
end

# Save Data
#File.open('_scripts/urls.yml', 'w') {|f| f.write urls.to_yaml }
