puts 'reorg.rb'
require 'date'
require 'front_matter_parser'
require 'open3'
require 'yaml'

# Build YAML file of all post data
# rename _posts to _posts_old
if false
  # _posts
  files = Dir["_posts_old/*.md"]
  # Organize by year and month posted
  post_data = {}
  files.sort.each do |file|
    # Determine year, month, and day from file name
    # _posts/2021-02-12-forum-spam-api.md
    bits = file.split('/')
    bits = bits[1].gsub('.md','').split('-')
    year = bits[0]
    month = bits[1]
    day = bits[2]
    slug = bits.join('-')
    # Parse front matter
    parsed = FrontMatterParser::Parser.parse_file(file)
    matter = parsed.front_matter 
    # Preserve content
    content = parsed.content
    matter['content'] = content if content and content != '' \
    # Preserve slug
    matter['slug'] = slug
    # Organize by year
    post_data[year] = {} if !post_data.has_key? year
    # Organize by month
    post_data[year][month] = [] if !post_data[year].has_key? month
    # Organize front matter
    post_data[year][month].push(parsed.front_matter)
  end
  # Save file
  filename = '_data/reorg.yml'
  puts filename
  File.open(filename, 'w') {|f| f.write post_data.to_yaml }
end

# Process post data YAML
# Skip Instagram Posts
if false
  filename = '_data/reorg.yml'
  if File.exist? filename 
    post_data = YAML.load_file(filename)
    post_data.each do |year, month_data|
      puts year
      month_data.each do |month, data|
        puts "\t" + month + " - " + Date::MONTHNAMES[month.to_i]
        # Build post filename
        post_filename = '_posts/' + year + '-' + month + '-01-links.md'
        # Build post title
        post_title = Date::MONTHNAMES[month.to_i] + ' ' + year
        # Build Front Matter (YAML)
        post = "---\n";
        post += "layout: post\n";
        post += "title: \""+post_title+"\"\n"
        post += "category: links\n"
        post += "---\n\n";
        # Process data
        data.each do |matter|
          next unless matter['source']
          next if matter['screenshot'] and matter['screenshot'].include? 'instagram'
          puts link_title = matter['title'].gsub('/',' ').gsub('README.md at master','').gsub(/[^0-9A-Za-z -]/, '').gsub(/\s+/, ' ')
          puts "\t\t" + link_title
          puts "\t\t" + matter['title']
          # Build Markdown formatted list of links
          post += '* ['+link_title+']('+matter['source']+')'+"\n"
        end
        # Save file
        puts "\t\t" + post_filename
        File.open(post_filename, 'w') {|f| f.write post }
      end
    end
  end
end

# Process Instagram Posts
filename = '_data/reorg.yml'
if File.exist? filename 
  post_data = YAML.load_file(filename)
  post_data.each do |year, month_data|
    puts year
    month_data.each do |month, data|
      puts "\t" + month + " - " + Date::MONTHNAMES[month.to_i]
      # Process data
      data.each do |matter|
        next unless matter['source']
        next unless matter['screenshot'] and matter['screenshot'].include? 'instagram'
        # Build post filename
        post_filename = '_posts/' + matter['slug'] + '.md'
        # Build YAML friendly title
        puts title = matter['title'].gsub(/[^0-9A-Za-z -]/, '').gsub(/\s+/, ' ')
        puts "\t\t" + title
        # Build Front Matter (YAML)
        post = "---\n";
        post += "layout: post\n";
        post += "title: \""+title+"\"\n"
        post += "category: photos\n"
        post += "---\n\n";
        # Build Markdown formatted instagram image link
        # [![homepage](http://commonmark.org/help/images/favicon.png)](http://commonmark.org "Redirect to homepage")
        post += '[!['+title+'](/'+matter['screenshot']+')]('+matter['source']+')'+"\n"
        # Save file
        puts "\t\t" + post_filename
        File.open(post_filename, 'w') {|f| f.write post }
      end
    end
  end
end

