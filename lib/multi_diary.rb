class Diary
  def initialize
    @entry_list = []
  end

  def add(entry) # entry is an instance of the DiaryEntry class
    @entry_list << entry
    # adds DiaryEntry to Diary
    # returns nothing
  end

  def view
    @entry_list
    # returns list of entries
  end

  def select_best_entry(wpm, minutes) # wpm is the reading speed (integer), minutes is the time available to read (integer)
    # returns the entry which best matches the parameters
    chunk_size = wpm * minutes
    closest_entry = nil
    closest_size = 0
    @entry_list.each do |entry|
      if entry.count_words > chunk_size # if entry is longer than we can read, discount it
        next
      elsif
        entry.count_words > closest_size # if entry is larger than current largest entry, reassign those variables
        closest_entry = entry
        closest_size = entry.count_words
      else
        next
      end
    end
    closest_entry
  end
end
