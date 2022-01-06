require './student'
require './person'

describe 'Student' do
  it 'should initialize correctly' do
    sw = Student.new('class A', 10, 'victor', parent_permission: true)
    studentclass = sw.classroom
    expect(studentclass).to eql 'class A'
    expect(sw).to be_kind_of Person
  end
end
