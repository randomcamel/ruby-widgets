=begin
    Copyright (c) 2011, Chris Doherty <chris@randomcamel.net>

    Based on Corey Goldberg's StopWatch.java (http://www.goldb.org/stopwatchjava.html).

    Stopwatch.rb is free software under the BSD license.

=end

class Stopwatch

  def start
    @t1 = Time.now
  end

  def stop
    @t2 = Time.now
  end

  def reset
    @t1 = @t2 = nil
  end

  def get_elapsed_time
    (@t2 - @t1).to_f
  end

  def get_elapsed_time_ms
    ((@t2 - @t1).to_f * 1000).round
  end

  def get_elapsed_time_secs
    @t2 - @t1
  end

  # support for individual marks as static targets (held in a hash).

end

s = Stopwatch.new
s.start
sleep 2
s.stop
puts s.get_elapsed_time
puts s.get_elapsed_time_ms
puts s.get_elapsed_time_secs
