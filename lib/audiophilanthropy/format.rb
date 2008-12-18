module Audiophilanthropy
  
  class Format
    
    @@formats = []
    
    attr_accessor :extensions, :content_types, :options
    
    # Using a format as an input, don't need any options. Need this for 
    # output though
    
    # A given audio codec could be represented with several different file 
    # extensions or content types, however when working with a file we should 
    # use a good default.
    # e.g. in the case of aiff, the extension should be .aiff even though
    # .aif is perfectly acceptable.
    
    def extension
      ".#{extensions.first.to_s}"
    end
    
    def content_type
      content_types.first
    end
    
    def is?(format)
      extensions.include?(format)
    end
    
    # Create a new Format object, accepts either single or multiple extensions.
    # e.g.
    # =>  Format.new [:aiff, :aif], ["audio/x-aiff", "audio/aiff"]
    # =>  Format.new :flac, "audio/x-flac"
    #
    def initialize( extensions, content_types, options = {} )
      self.extensions = extensions.kind_of?(Array) ? extensions : [extensions]
      self.content_types = content_types.kind_of?(Array) ? content_types : [content_types]
      self.options = options
    end
    
    def self.register(*args)
      @@formats << self.new(*args)
    end
    
    def self.formats
      @@formats
    end
    
  end


  # Format.new :wav, ["audio/wav", "audio/wave", "audio/x-wav"]
  # Format.new :mp3, ["audio/mpeg"]
  
end
