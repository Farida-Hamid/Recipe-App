require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Farida', email: 'farida@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', role: 'admin') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be "Farida"' do
    expect(subject.name).to eql("Farida")
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'name should be "farida@gmail.com"' do
    expect(subject.email).to eql("farida@gmail.com")
  end

  it 'role should be "admin"' do
    expect(subject.role).to eql('admin')
  end
end
