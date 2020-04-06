#create-link-post.rb
# ruby _scripts/create-link-post.rb http://joecode.com joecode

require 'uri'
require 'openssl'
require 'open-uri'
require 'nokogiri'
require 'securerandom'
require 'open3'

if ARGV[0] and ARGV[1]
  guid = SecureRandom.uuid
  url = ARGV[0]
  slug = ARGV[1]
  date_time = DateTime.now().strftime("%Y-%m-%d")
  # 1. Get the Source Title
  source = URI.open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
  doc = Nokogiri::HTML(source)
  if doc.at_css('title')
    title = doc.at_css('title').text.encode("ASCII", invalid: :replace, undef: :replace, replace: '').gsub("\n",' ').strip
  else
    title = nil
  end
  puts title.gsub('"','')
  # 2. Generate Screenshot Using Chrome
  call = '( /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --crash-dumps-dir=/tmp --screenshot=_screenshots/'+guid+'.png --window-size=1280,1280 ' + url +  ' ) & sleep 10 ; kill $!'
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
  # 3. Convert to JPG Using ImageMagick
  if File.exist? '_screenshots/'+guid+'.png'
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
  # 4. Create YML Front Matter and Jekyll Post
  if date_time and slug and title and url and guid
    yml = "---\n";
    yml += "layout: link\n";
    yml += "title: \""+title+"\"\n"
    yml += "source: '"+url+"'\n"
    yml += "screenshot: 'screenshots/"+guid+".jpg'\n"
    yml += "---\n\n";
    # Save file
    filename = '_posts/' + date_time + '-' + slug + '.md'
    if !File.exist? filename 
      puts filename
      File.open(filename, 'w') {|f| f.write yml }
    end
  end
else
  puts "Usage: ruby _scripts/create-link-post.rb http://joecode.com joecode-slug-for-url"
end
