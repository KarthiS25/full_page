require "test_helper"

class NoteTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "should not save article without title" do
    note = Note.new
    assert_not note.save
  end
end
