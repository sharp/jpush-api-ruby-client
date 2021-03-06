module JPush
  class Options
    attr_accessor :sendno, :time_to_live, :override_msg_id, :apns_production
    def initialize(opts = {})
      if opts[:apns_production] != nil
        @apns_production = opts[:apns_production]
      else
        @apns_production = false
      end

      @sendno = opts[:sendno]

      if opts[:time_to_live] != nil
      @time_to_live = opts[:time_to_live]
      else
      @time_to_live = 86400
      end
      @overrride_msg_id = opts[:override_msg_id]
    end

    def toJSON
      array = {}
      if @sendno != nil then
        array['sendno'] = @sendno
      end
      if @time_to_live != nil then
        array['time_to_live'] = @time_to_live
      end
      if @override_msg_id != nil then
        array['override_msg_id'] = @override_msg_id
      end
      if @apns_production != nil then
        array['apns_production'] = @apns_production
      end
      return array
    end

    def self.build(opts = {})
      options = JPush::Options.new(opts)
      if options.sendno != nil&&options.sendno < 0
        raise ArgumentError.new('sendno should be greater than 0.')
      end
      if options.override_msg_id != nil&&options.override_msg_id < 0
        raise ArgumentError.new(' override_msg_id should be greater than 0.')
      end
      if options.time_to_live != nil&&options.time_to_live < 0
        raise ArgumentError.new('time_to_live should be greater than 0.')
      end
      return options
    end
    
  end
end
