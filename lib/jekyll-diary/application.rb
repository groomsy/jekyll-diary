module JekyllDiary
  class Application
    def initialize(argv)
      # Do Nothing
    end
    
    def run
      didUnderstandCommand = false
    
      opts = slop(help: true) do
        command 'draft' do
          banner 'Usage: jekyll-diary draft [options]'
          description 'Draft a Post'
          
          on :t=, :title=, 'The title of the draft', required: true
          
          run do |opts, args|
            didUnderstandCommand = true
            puts "You want to create a draft with the title #{opts[:title]}"
          end
        end
        
        command 'publish' do
          banner 'Usage: jekyll-diary publish [options]'
          description 'Publish a Post'
          
          on :f=, :file=, 'The name of the file you wish to publish', required: true
          
          run do |opts, args|
            didUnderstandCommand = true
            puts "You want to publish #{opts[:file]}"
          end
        end
      end
      
      if !didUnderstandCommand
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