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

  it "selects best entry to read in given time" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "one " * 200)
    entry_2 = DiaryEntry.new("Tuesday", "two " * 1000)
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.select_best_entry(200, 2)).to eq entry_1
  end

  it "displays a list of all phone numbers in diary" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", ("one " * 200) + "07594600351 " + ("one " * 100))
    diary.add(entry_1)
    contacts = Contacts.new(diary)
    expect(contacts.view).to eq ["07594600351"]
  end

  it "adds tasks and returns a list of them" do
    list = TodoList.new
    task_1 = Task.new("Buy bread")
    task_2 = Task.new("Walk the dog")
    list.add(task_1)
    list.add(task_2)
    expect(list.view).to eq [task_1, task_2]
  end
end
