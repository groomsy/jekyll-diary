class Draft
    def self.create_drafts_directory
      if !Dir.exists?("_drafts")
        puts "Creating _drafts directory…"
        if Dir.mkdir("_drafts", 0755) == 0
          puts "Created _drafts directory."
        end
      end
    end
    
    def self.create_draft(file_name, draft_name)
      if Dir.exists?("_drafts")
        draft_file_path = File.join("_drafts", file_name + ".md")
        draft_file = File.new(draft_file_path, "w+")
        draft_file.puts "---"
        draft_file.puts "layout: post"
        draft_file.puts "title: #{draft_name}"
        draft_file.puts "---\n"
        draft_file.close
        
        `open #{draft_file_path}`
        
        puts "The draft can be found at _drafts/#{file_name}.md."
      end
    end
end