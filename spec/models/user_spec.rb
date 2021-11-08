# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'create' do
    it 'fail without email and password' do
      expect { User.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'fail without email' do
      expect { User.create!(email: Faker::Internet.email) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'fail without password' do
      expect { User.create!(password: Faker::Internet.password) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'success with email and password' do
      User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
      expect(User.count).to eq 1
    end
  end
end
