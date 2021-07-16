require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    unless self.all.include?(name)
      self.create_by_name(name)
    end
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename (fileName)
    rawName = fileName.split(/[-.]+/)
    newSong = self.new_by_name(rawName[1].strip)
    newSong.artist_name = rawName[0].strip
    newSong
  end

  def self.create_from_filename (fileName)
    rawName = fileName.split(/[-.]+/)
    newSong = self.create_by_name(rawName[1].strip)
    newSong.artist_name = rawName[0].strip
    newSong
  end



  def self.destroy_all
    self.all.clear
  end


end
