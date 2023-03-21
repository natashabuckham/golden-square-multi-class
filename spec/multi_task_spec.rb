require 'multi_task'

RSpec.describe Task do
  it "constructs and see contents" do
    task = Task.new("Buy bread")
    expect(task.contents).to eq "Buy bread"
  end
end
