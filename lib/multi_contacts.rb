class Contacts
  def initialize(diary) # diary is an instance of the Diary class
    @diary = diary
  end

  def view
    numbers = []
    @diary.view.each do |entry|
      entry.contents.split.each do |word|
        if word.match? /(?<!\d)\d{11}(?!\d)/
          numbers << word
        end
      end
    end
    numbers
    # pulls out mobile phone numbers from the diary entries
    # returns list of numbers
  end
end
