require_relative 'draft'
require_relative 'filename'

module JekyllDiary
  class Application
    def initialize(argv)
      # Do Nothing
    end
    
    def run
      did_understand_command = false
    
      if !File.exists?("_config.yml")
        puts "You must use `jekyll-diary` inside a Jekyll site directory."
        exit 1
      end
    
      opts = slop(help: true) do
        command 'draft' do
          banner 'Usage: jekyll-diary draft [options]'
          description 'Draft a Post'
          
          run do |opts, args|
            did_understand_command = true
            if args.length == 0
              puts "You must specify a title for the draft."
            else
              draft_name = args.join(' ')
              file_name = draft_name.friendly_filenamize
              puts "You want to create a draft with the title \"#{draft_name}\"."
            
              Draft.create_drafts_directory()
              
              Draft.create_draft(file_name, draft_name)
            end
          end
        end
        
        command 'publish' do
          banner 'Usage: jekyll-diary publish [options]'
          description 'Publish a Post'
          
          run do |opts, args|
            did_understand_command = true
            if args.length == 0
              puts "You must specify a draft to publish. Either give the path to the draft or just the filename."
            else
              draft_file_path = nil
              if !File.exists?(args.first)
                if !File.exists?("_drafts/#{args.first}")
                  puts "Invalid draft specified! #{args.first} was not found."
                else
                  draft_file_path = "_drafts/#{args.first}"
                end
              else
                draft_file_path = args.first
              end

              unless draft_file_path.nil?
                draft_file_path_components = draft_file_path.split('/')
                draft_file_name = draft_file_path_components.last
                published_file_name = "#{Time.now.strftime("%Y-%m-%d")}-#{draft_file_name}"
                published_file_path = "_posts/#{published_file_name}"
              
                puts "Publishing #{draft_file_path}\nDraft File Name: #{draft_file_name}\nPublished File Name: #{published_file_name}"
                File.rename(draft_file_path, published_file_path)
                `git add --all`
                `git commit -m 'Publishing #{draft_file_name}'`
              end
            end
          end
        end
      end
      
      if !did_understand_command
        puts "Did not understand!"
      end
    end
    
    def slop(options = {}, &block)
      Slop.parse(options, &block)
    rescue Slop::MissingOptionError => e
      $stderr.puts e
      exit 1
    end
    
  end
end