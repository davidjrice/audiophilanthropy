$:.unshift File.dirname(__FILE__)
require 'audiophilanthropy/format'

module Audiophilanthropy
  
  # This module adds a nice dsl to ActiveRecord::Base for describing audio
  # trasnscoding.
  module ClassMethods
    
    def audiophilanthropy( name, options = {} )
      # storage_path
    end
    
    def allowed_source_format( extensions, content_types )
      @@formats 
      # Store that a file of this extension is allowed to be uploaded
      # Also registers 
    end
    
    def transcodes(options = {})
      # :from => :to
      @@transcoding_jobs << @job
      # this setups a job/transition that can be done
    end 
    
  end
  
end