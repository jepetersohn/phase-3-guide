require "rspec"
require_relative "list"
describe List do
  let(:title) { "Home" }
  let(:task) { "clean" }
  let(:list) { List.new title }
  context "#title" do
    it "returns the title set at initialize" do
      expect(list.title).to eq title
    end
  end
  context "#tasks" do
    it "initializes with an empty list" do
      expect(list.tasks).to be_empty
    end
    it "returns the task list set at initialize" do
      tasks = ["clean house", "laundry"]
      list = List.new title, tasks
      expect(list.tasks).to eq tasks
    end
  end

  context "#add_task" do
    it "appends the task to the task list" do
      expect {
        list.add_task task
      }.to change { list.tasks }.from([]).to([task])
    end
  end

  context "#delete_task" do
    it "appends the task to the task list" do
        list.add_task task
        expect {
        list.delete_task 0
      }.to change { list.tasks }.from([task]).to([])
    end
  end

  context "#completed_tasks" do
    let(:complete_task) { double(:complete_task, :complete? => true) }
    let(:incomplete_task) { double(:incomplete_task, :complete? => false) }
    it "returns a list of completed tasks" do
      list.add_task incomplete_task
      list.add_task complete_task
      expect(list.completed_tasks).to eq [complete_task]
    end
  end

  context "#completed_tasks_count" do
    it "returns the count of completed tasks" do
      tasks = ["clean"]
      list.stub(:completed_tasks) { tasks }
      expect(list.completed_tasks_count).to eq tasks.count
    end
  end
end
