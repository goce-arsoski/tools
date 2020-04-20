module Tools
  class AdjustTheTime
    def initialize(str, hrs, min, sec)
      @input_hrs, @input_min, @input_sec = str.split(':')
      @hrs = hrs
      @min = min
      @sec = sec
    end

    def adjust
      '%02d' % hrs + ':' + '%02d' % min + ':' + '%02d' % sec
    end

    private

    def sec
      (@input_sec.to_i + @sec) % 60
    end

    def sec_to_min
      (@input_sec.to_i + @sec) / 60
    end

    def min
      (@input_min.to_i + sec_to_min + @min) % 60
    end

    def min_to_hrs
      (@input_min.to_i + sec_to_min + @min) / 60
    end

    def hrs
      (@input_hrs.to_i + min_to_hrs + @hrs) % 24
    end
  end
end
