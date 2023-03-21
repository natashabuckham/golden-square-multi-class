# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
                                                                                ┌──────────────────────┐
┌────────────────────────────┐     ┌──────────────────────┐                     │                      │
│  Contacts                  │     │   Diary              │                     │ Todo_List            │
│ ----------                 │     │  -------             │                     │-----------           │
│                            │     │                      │                     │                      │
│ view contacts (diary)      │     │  add entry (entry)   │                     │ add task  (task)     │
│ => scan's diary entries    │     │ view entries list    │                     │ view incomplete tasks│
│ => pulls out mobile phone  ├─────┤  select best entry   │                     │                      │
│    numbers and lists them  │     │                      │                     └─────────────┬────────┘
│                            │     └──────────────┬───────┘                                   │
└────────────────────────────┘                    │                                           │
                                                  │                                           │
                                                  │ owns a list of                            │ owns a list of
                                                  │                                           │
                                                  │                                           │
                                                  │                          ┌────────────────┴────────┐
                                    ┌─────────────┴─────────────────┐        │                         │
                                    │  Entry                        │        │  Task                   │
                                    │ -------                       │        │ ------                  │
                                    │                               │        │  create task(contents)  │
                                    │ create entry (title, contents)│        │  mark complete          │
                                    │ reading time                  │        │  done?                  │
                                    │ read the entry                │        └─────────────────────────┘
                                    │ count words                   │
                                    └───────────────────────────────┘

```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    # @entry_list = []
  end

  def add(entry) # entry is an instance of the DiaryEntry class
    # adds DiaryEntry to Diary
    # returns nothing
  end

  def view
    # returns list of entries
  end

  def select_best_entry(wpm, minutes) # wpm is the reading speed (integer), minutes is the time available to read (integer)
    # returns the entry which best matches the parameters
  end
end

class DiaryEntry
  def initialize(title, contents) # title is a string, contents is a string
  # @title = title
  # @contents = contents
  end

  def contents
  # returns contents
  end

  def count_words
    # returns the length of the entry
  end
end

class Contacts
  def initialize(diary) # diary is an instance of the Diary class
    # @diary = diary
  end

  def view
    # pulls out mobile phone numbers from the diary entries
    # returns list of numbers
  end
end

class TodoList
  def initialize
   # @todo_list = []
  end

  def add(task) # task is an instance of the Task class
    # adds Task to TodoList
    # returns nothing
  end

  def view
    # returns list of tasks
  end
end

class Task
  def initialize(contents) # contents is a string
    # @contents = contents
  end

  def contents
    # returns @contents
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# 1 View diary entries
diary = Diary.new
entry_1 = DiaryEntry.new("Monday", "one " * 200)
entry_2 = DiaryEntry.new("Tuesday", "two " * 200)
diary.add(entry_1)
diary.add(entry_2)
diary.view # => [entry_1, entry_2]

# 2 Selects best entry to read in given time
diary = Diary.new
entry_1 = DiaryEntry.new("Monday", "one " * 200)
entry_2 = DiaryEntry.new("Tuesday", "two " * 1000)
diary.add(entry_1)
diary.add(entry_2)
diary.select_best_entry(200, 2) # => entry_1

# 3 Displays list of all phone numbers in diary
diary = Diary.new
entry_1 = DiaryEntry.new("Monday", ("one " * 200) + "07594600351 " + ("one " * 100))
diary.add(entry_1)
contacts = Contacts.new(diary)
contacts.view # => ["07594600351"]

# 4 Adds tasks and returns list of them
list = TodoList.new
task_1 = Task.new("Buy bread")
task_2 = Task.new("Walk the dog")
list.add(task_1)
list.add(task_2)
list.view # => [task_1, task_2]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Task
# constructs and see contents
task = Task.new("Buy bread")
task.contents # => "Buy bread"

# DiaryEntry
# constructs and see contents
entry = DiaryEntry.new("Monday", "one " * 200)
entry.contents # => "one " * 200

# count words
entry = DiaryEntry.new("Monday", "one " * 200)
entry.count_words # => 200

# TodoList
# constructs
list = TodoList.new

# Diary
# constructs
diary = Diary.new
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
