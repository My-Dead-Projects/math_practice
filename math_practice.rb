#
# gem install colorize
#
require 'colorize'

if __FILE__ == $0
  begin
    MINVAL = 2
    
    print "How many times would you like to practice? ".light_yellow
    n = 0
    
    while true
      begin
        n = Integer(gets)
        break
      rescue ArgumentError
        print "Please give a number: ".red
      end
    end
    
    errors = 0
    start_time = prev_time = Time.now
    message = ""
    system "clear"
    
    (1..n).each do |problem|
      
      operand1 = MINVAL + rand(10 - MINVAL)
      operand2 = MINVAL + rand(10 - MINVAL)
      
      while true
        puts
        puts "Problem " + problem.to_s + " of " + n.to_s
        puts
        puts operand1.to_s.rjust(3)
        puts "x" + operand2.to_s.rjust(3-1)
        puts "_"*3
        print (" "*2)[0..-1*Math.log10(operand1*operand2*10)]
        begin
          answer = Integer(gets)
          break
        rescue
          system "clear"
          puts "Please give a number".red
        end
      end
      
      if answer == operand1 * operand2
        message = "That's right!\n".green
      else
        message = ("Nope, sorry; " + operand1.to_s + " x " + operand2.to_s + " = " + (operand1 * operand2).to_s + "\n").red
        errors += 1
      end
      
      this_time = Time.now - prev_time
      if this_time > 20
        time_color = :red
      elsif this_time > 10
        time_color = :light_yellow
      else
        time_color = :green
      end
      
      message += ("Completed in " + this_time.to_i.to_s + " seconds.").method(time_color).call
      
      prev_time = Time.now
      
      system "clear"
      puts message
      puts
      
    end
    run_time = Time.now - start_time
    
    if run_time > n * 20
      time_color = :red
    elsif run_time > n * 10
      time_color = :light_yellow
    else
      time_color = :green
    end
    
    if errors > 0
      errors_color = :red
    else
      errors_color = :green
    end
    
    puts "Finished " + n.to_s + " questions in " + run_time.to_i.to_s.method(time_color).call + " seconds with " + errors.to_s.method(errors_color).call + " errors."
    puts "Average time per question: " + (run_time/n).to_i.to_s.method(time_color).call
    
  rescue Interrupt
    system "clear"
  end
end
