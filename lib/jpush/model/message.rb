module JPush
  class Message
    attr_accessor :title, :msg_content, :content_type, :extras
    def initialize(opts  =  {})
      @title = opts[:title]
      @msg_content = opts[:msg_content]
      @content_type = opts[:content_type]
      @extras = opts[:extras]
    end

    def toJSON
      array = {}
      if @title != nil then
        array['title'] = @title
      end
      if @msg_content != nil then
        array['msg_content'] = @msg_content
      end
      if @content_type != nil then
        array['content_type'] = @content_type
      end
      if @extras != nil then
        array['extras'] = @extras
      end
      return array
    end

    def self.build(opts = {})
      message = JPush::Message.new(opts)
      if nil == message.msg_content
        raise ArgumentError.new('msgContent should be set')
      end
      return message
    end

  end
end
