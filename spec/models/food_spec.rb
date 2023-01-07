require 'rails_helper'

RSpec.describe Food, type: :model do
  user = User.new(name: 'Farida', email: 'farida@gmail.com', password: 'topsecret',
                  password_confirmation: 'topsecret', role: 'admin')

  subject { Food.new(name: 'apple', measurement_unit: 'grams', price: 2.15, user:, quantity: 12) }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'price should be present' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'name should be "apple"' do
    expect(subject.name).to eql('apple')
  end

  it 'measurement_unit should be "grams"' do
    expect(subject.measurement_unit).to eql('grams')
  end

  it 'price should be "2.15"' do
    expect(subject.price).to eql(2.15)
  end

  it 'quantity should be "12"' do
    expect(subject.quantity).to eql(12)
  end
end
