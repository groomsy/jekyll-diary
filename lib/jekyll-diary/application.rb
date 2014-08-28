require_relative 'filename'

module JekyllDiary
  class Application
    def initialize(argv)
      # Do Nothing
    end
    
    def run
      did_understand_command = false
    
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
              puts "The draft can be found at _drafts/#{file_name}.md."
            end
          end
        end
        
        command 'publish' do
          banner 'Usage: jekyll-diary publish [options]'
          description 'Publish a Post'
          
          run do |opts, args|
            did_understand_command = true
            if args.length == 0
              puts "You must specify a draft to publish."
            else
              puts "You want to publish #{args.first}."
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