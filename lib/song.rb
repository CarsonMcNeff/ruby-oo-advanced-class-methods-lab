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
    song.save
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.each {|song| return song if song.name == name}
    nil
  end

  def self.find_or_create_by_name(name)
     self.find_by_name(name)? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}.uniq
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    info[1].chomp!(".mp3")
    song = self.new
    song.name = info[1]
    song.artist_name = info[0]
    song
  end

  def self.create_from_filename(filename)
    info = filename.split(" - ")
    info[1].chomp!(".mp3")
    song = self.create
    song.name = info[1]
    song.artist_name = info[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
