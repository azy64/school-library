require './person'

describe 'Person' do
  it 'should initialize correctly' do
    pw = Person.new(10, 'victor')
    expect(pw.name).to eql 'victor'
    expect(pw.age).to eql 10
    expect(pw.can_use_services?).to eql false
  end
end
