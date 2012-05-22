module Helpers
  
  class Process

    def initialize(sleep_time = 5)
      @sleep_time = sleep_time
    end
    
    def run(name, timeout)
      done = false
      elapsed = 0
      until done || elapsed >= timeout 
        elapsed += @sleep_time
        done = yield
        return if done
        sleep @sleep_time
      end
      raise "Timeout running: #{name}"
    end
    
  end
  
end