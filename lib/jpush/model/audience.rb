module JPush
  class Audience
    attr_accessor  :tag, :tag_and, :_alias, :registration_id, :segment, :all
    def initialize(opts = {})
      @all = false
      @tag = opts[:tag]
      @tag_and = opts[:tag_and]
      @_alias = opts[:_alias]
      @registration_id = opts[:registration_id]
      @segment = opts[:segment]
    end

    def toJSON
      if @all == true then
        return 'all'
      end
      array = {}
      if @tag != nil then
        if @tag.class != Array
          raise ArgumentError.new('tag is not Array')
        end
        array['tag'] = @tag
      end
      if @_alias != nil then
        if @_alias.class != Array
          raise ArgumentError.new('alias is not Array')
        end
        array['alias'] = @_alias
      end
      if @tag_and != nil  then
        if @tag_and.class != Array
          raise ArgumentError.new('tag_end is not Array')
        end
        array['tag_and'] = @tag_and
      end
      if @registration_id != nil then
        if @registration_id.class != Array
          raise ArgumentError.new('registration_id is not Array')
        end
        array['registration_id'] = @registration_id
      end
      return array
    end

    def self.all
      au = JPush::Audience.new
      au.all = true
      return au
    end

    def self.build(opts = {})
      audience = JPush::Audience.new(opts)
      if audience.all == true
        if audience.tag != nil || audience._alias != nil || audience.tag_and != nil || audience.registration_id != nil
          raise ArgumentError.new('If audience is all, no any other audience may be set.')
        end
      end
      if audience.all == false
        if audience.tag == nil && audience._alias == nil && audience.tag_and == nil && audience.registration_id == nil
          raise ArgumentError.new('No any audience target is set.')
        end
      end
      return audience
    end
    
  end
end
