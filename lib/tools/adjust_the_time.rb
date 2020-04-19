module Tools
  class AdjustTheTime
    def initialize(str, hrs, min, sec)
      @input_hrs, @input_min, @input_sec = str.split(':')
      @hrs = hrs
      @min = min
      @sec = sec
    end

    def adjust
      seconds = sec
      minutes = min
      hours = hrs
      hours + ':' + minutes + ':' + seconds
    end

    private

    def hrs
      hrs = @input_hrs.to_i + @min_to_hrs + @hrs
      hrs -= 24 while hrs >= 24
      hrs < 10 ? '0' + hrs.to_s : hrs.to_s
    end

    def min
      min = @input_min.to_i + @sec_to_min + @min
      @min_to_hrs = 0
      while min >= 60
        min -= 60
        @min_to_hrs += 1
      end
      min < 10 ? '0' + min.to_s : min.to_s
    end

    def sec
      sec = @input_sec.to_i + @sec
      @sec_to_min = 0
      while sec >= 60
        sec -= 60
        @sec_to_min += 1
      end
      sec < 10 ? '0' + sec.to_s : sec.to_s
    end
  end
end
