require 'multi_diary_entry'

RSpec.describe DiaryEntry do
  it "constructs and see contents" do
    entry = DiaryEntry.new("Monday", "one " * 200)
    expect(entry.contents).to eq "one " * 200
  end

  it "counts words in the entry" do
    entry = DiaryEntry.new("Monday", "one " * 200)
    expect(entry.count_words).to eq 200
  end
end
