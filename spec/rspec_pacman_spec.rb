# frozen_string_literal: true

RSpec.describe RspecPacman do
  it "success" do
    expect(true).to eq(true)
  end

  # it "failure" do
  #   expect(false).to eq(true)
  # end

  # it "pendding" do
  #   pending("this test is pending")
  #   expect(false).to eq(true)
  # end

  it 'checks if 1 is equal to 1' do
    sleep 1
    expect(1).to eq(1)
  end

  it 'checks if array contains specific element' do
    sleep 1
    expect([1, 2, 3]).to include(2)
  end

  it 'checks if two strings are equal' do
    sleep 1
    expect('hello').to eq('hello')
  end

  it 'checks the length of an array' do
    sleep 1
    expect([1, 2, 3].length).to eq(3)
  end

  it 'checks if hash has specific key' do
    sleep 1
    expect({a: 1, b: 2}).to have_key(:a)
  end

  it 'checks if string includes a substring' do
    sleep 1
    expect('hello world').to include('world')
  end

  it 'checks if array is empty' do
    sleep 1
    expect([]).to be_empty
  end

  it 'checks if value is true' do
    sleep 1
    expect(true).to be true
  end

  it 'checks if value is false' do
    sleep 1
    expect(false).to be false
  end

  it 'checks if object is nil' do
    sleep 1
    expect(nil).to be_nil
  end

  it 'checks if number is greater than another' do
    sleep 1
    expect(5).to be > 3
  end

  it 'checks if number is less than another' do
    sleep 1
    expect(3).to be < 5
  end

  it 'checks if array contains only specific elements' do
    sleep 1
    expect([1, 1, 1]).to all(eq(1))
  end

  it 'checks if object is an instance of a class' do
    sleep 1
    expect(1).to be_a(Integer)
  end

  it 'checks if string matches a regex' do
    sleep 1
    expect('test@example.com').to match(/\A\w+@\w+\.\w+\z/)
  end

  it 'checks if number is between a range' do
    sleep 1
    expect(10).to be_between(1, 20).inclusive
  end

  it 'checks if array includes at least one specific element' do
    sleep 1
    expect([1, 2, 3]).to include(2)
  end

  it 'checks if two objects are the same' do
    sleep 1
    obj = "test"
    expect(obj).to be(obj)
  end

  it 'checks if error is raised' do
    sleep 1
    expect { raise StandardError }.to raise_error(StandardError)
  end

  it 'checks if no error is raised' do
    sleep 1
    expect { 1 + 1 }.not_to raise_error
  end

  it 'checks if 1 is equal to 1' do
    sleep 1
    expect(1).to eq(1)
  end

  it 'checks if array contains specific element' do
    sleep 1
    expect([1, 2, 3]).to include(2)
  end

  it 'checks if two strings are equal' do
    sleep 1
    expect('hello').to eq('hello')
  end

  it 'checks the length of an array' do
    sleep 1
    expect([1, 2, 3].length).to eq(3)
  end

end
