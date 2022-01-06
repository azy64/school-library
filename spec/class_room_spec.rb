require './classroom'
require './student'

describe 'Classroom' do
  it 'should initialize it\'s paramaters corectly' do
    hw = Classroom.new('class B')
    classname = hw.label
    expect(classname).to eq 'class B'
  end

  it 'should correctly add a student' do
    hw = Classroom.new('class B')
    sw = Student.new(hw, 10, 'victor', parent_permission: true)
    hw.add_student(sw)
    expect(hw.students.length).to eql 1
    expect(sw.classroom).to be hw
  end
end
