# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'without user' do
    it 'cannot create' do
      expect { Recipe.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'with user' do
    before(:each) do
      @user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
    end

    it 'cannot create without dish and description' do
      expect { create_recipe }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'cannot create without dish' do
      expect { create_recipe(description: Faker::Food.description) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'cannot create without dish and description' do
      expect { create_recipe(dish: Faker::Food.dish) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'create successfully' do
      recipe = create_recipe(dish: Faker::Food.dish, description: Faker::Food.description)
      expect(Recipe.count).to eq 1
      expect(recipe.user).to eq @user
    end

    private

    def create_recipe(**kwargs)
      Recipe.create!({ user: @user }.merge(kwargs))
    end
  end
end
