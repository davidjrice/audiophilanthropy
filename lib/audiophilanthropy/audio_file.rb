class AudioFile < ActiveRecord::Base
  
  allowed_source_format [:aiff, :aif], ["audio/x-aiff", "audio/aiff"]
  allowed_source_format :flac, "audio/x-flac"
  allowed_source_format :wav, ["audio/wav", "audio/wave", "audio/x-wav"]
  allowed_source_format :mp3, ["audio/mpeg"]
  
  output_format :mp3, :bitrate => 192, :sample_rate => 44100
  output_format :flac
  
  # Automatically transcode all formats to store audio as flac or mp3
  transcodes_source :aiff => :flac
  transcodes_source :wav => :flac
  
  # Encode a compressed copy of each audio file as mp3, unless the source is mp3
  transcodes_child :mp3
  
end

# ffmpeg -i input.flac -ab 196 -ac 2 -ar 44100 -acodec mp3 output.mp3
# 
# ffmpeg -i input.flac -acodec aiff output.aiff
# ffmpeg -i input.aiff -acodec flac output.flac
# ffmpeg -i input.aiff -acodec wav output.wav
# 
# file = RVideo::Inspector.new(:file => "input.flac")
# 
# can't 
# 
# valid sample rates 44000, 44100
# minimum bitrate, 128k ?
# 