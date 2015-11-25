require 'pry'
require 'time'

class Task
    attr_reader :content, :id
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @completed = false
        @created_at = Time.now
        @updated_at = nil
    end

    def complete?
    	@completed
    end
    def complete!
    	@completed = true
    end
    def make_incomplete!
    	@completed = false
    end
    def update_content! new_content
    	@updated_at = Time.now
    	@content = new_content
    end
end