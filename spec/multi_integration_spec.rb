require 'multi_diary'
require 'multi_diary_entry'
require 'multi_contacts'
require 'multi_todo_list'
require 'multi_task'

RSpec.describe 'multi-class integration' do
  it "views diary entries" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "one " * 200)
    entry_2 = DiaryEntry.new("Tuesday", "two " * 200)
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.view).to eq [entry_1, entry_2]
  end
end
