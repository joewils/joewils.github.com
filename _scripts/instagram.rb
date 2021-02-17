#instagram.rb
require 'date'
require 'httparty'
require 'nokogiri'
require 'open-uri'
require 'open3'
require 'yaml'

def get_grams(gram)
  # User Agents
  agents = [
    'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',
    'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36',
    'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1',
    'Mozilla/5.0 (Windows NT 6.2; rv:22.0) Gecko/20130405 Firefox/23.0',
    'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko',
    'Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; en-US))',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A',
    'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; de-at) AppleWebKit/533.21.1 (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1'
  ]
  # Craft Instagram post URL
  url = 'https://www.instagram.com/'+gram+'/?hl=en'
  # Recent
  todays_date = Date.today.to_s
  hour = Time.new.hour.to_s
  # Get page
  filename = '_html/'+gram+'-'+todays_date+'-'+hour+'.html'
  if !File.exist? filename
    sleep(rand(1..3)) # play nice
    html = HTTParty.get(url, {:format=>'plain', headers: {"User-Agent" => agents.sample}})
    if html.response.code.to_s == '200'
      File.open(filename, 'w+') do |file|
        file.puts html
      end
    else
      puts "WTF: " + url
    end
  end
  # Process html
  posts = {}
  if File.exist? filename
    doc = File.open(filename) { |f| Nokogiri::XML(f) }
    if doc
      # Do something
      doc.css('script').each do |script|
        content = script.content
        if content.include? "window._sharedData"
          # Extract the latest posts
          pieces = content.split('window._sharedData = ')
          if pieces.length == 2
            meat = pieces[1].gsub('};','}')
            json = JSON.parse(meat)
            graphql = json['entry_data']['ProfilePage'][0]['graphql']
            media = graphql['user']['edge_owner_to_timeline_media']
            graphql['user']['edge_owner_to_timeline_media'] = nil

            # Build List of Recent Instagram Images
            grams = []
            potatoes = media['edges']
            potatoes.each do |wtf|
              potatoe = wtf['node']
              ig = {}
              ig['is_video'] = potatoe['is_video']
              if ig['is_video'] == false
                ig['shortcode'] = potatoe['shortcode']
                if potatoe['edge_media_to_caption']['edges'].length > 0
                  ig['caption'] = potatoe['edge_media_to_caption']['edges'][0]['node']['text']
                else
                  ig['caption'] = ''
                end
                ig['date'] = Time.at(potatoe['taken_at_timestamp']).to_date.to_s
                ig['source_image'] = potatoe['display_url']
              end
              grams.push(ig)
            end
            puts grams.to_yaml

            # Process List of Instagram Images
            grams.each do |gram|
              next if gram['is_video'] == true
              # Copy Image Locally
              filename = 'instagram/'+gram['shortcode']+'.jpg'
              if !File.exist? filename
                File.open(filename, "w") {|o|
                  open(gram['source_image']) {|f|
                    o.write( f.read )
                   }
                }
              end

              # Build Thumbnail
              thumbnail_filename = filename.gsub('instagram/','instagram/th-')
              if File.exist? filename and !File.exist? thumbnail_filename
                call = 'convert '+filename+' -quality 80 -resize 640x640 '+thumbnail_filename
                puts call
                Open3.popen3(call) do |stdin, stdout, stderr, thread|
                  begin
                    puts "Building Thumbnail"
                    puts thread.pid
                    puts stdout.read.chomp
                  rescue
                    Process.kill("KILL", thread.pid)
                  end
                end
              end

              # Clean up title
              title = gram['caption'].encode("ASCII", invalid: :replace, undef: :replace, replace: '').strip
              title.gsub!("\n",' ')
              title.gsub!(/[^0-9A-Za-z -]/, '')
              title.gsub!(/\s+/, ' ')
              source_url = 'https://www.instagram.com/p/'+gram['shortcode']+'/'

              # Build Jekyll Filename
              jekyll_filename = gram['date']+'-instagram-'+gram['shortcode'].downcase+'.md'

              # Build Jekyll YAML Frontend
              yml = "---\n"
              yml += "layout: post\n"
              yml += "title: \""+title+"\"\n"
              yml += "source: '"+source_url+"'\n"
              yml += "category: photos\n"
              yml += "---\n\n"
              yml += '[!['+title+'](/instagram/th-'+gram['shortcode']+'.jpg)]('+source_url+')'+"\n"
              if !File.exist? '_posts/'+jekyll_filename
                puts jekyll_filename
                File.open('_posts/'+jekyll_filename, 'w') {|f| f.write yml }
              end

            end #grams.each

          end
        end
      end
    end
  end
  return posts
end

# Public Account
grams = get_grams('joewils')
puts grams.to_yaml

# Private Accounts Don't Work
# grams = get_grams('awils3126')
# puts grams.to_yaml