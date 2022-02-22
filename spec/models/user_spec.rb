require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it 'is valid with an another name' do
      user = create(:user)
      user_with_another_name = build(:user, name: "another#{user.name}")
      expect(user_with_another_name).to be_valid
      expect(user_with_another_name.errors).to be_empty
    end

    it 'is valid with an another email' do
      user = create(:user)
      user_with_another_email = build(:user, email: "another#{user.email}")
      expect(user_with_another_email).to be_valid
      expect(user_with_another_email.errors).to be_empty
    end

    it 'is invalid without a name' do
      user_without_name = build(:user, name: '')
      expect(user_without_name).to be_invalid
      expect(user_without_name.errors[:name]).to include('を入力してください')
    end

    it 'is invalid without an email' do
      user_without_email = build(:user, email: '')
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors[:email]).to include('を入力してください')
    end

    it 'is invalid without a password' do
      user_without_password = build(:user, password: '')
      user_without_password.valid?
      expect(user_without_password).to be_invalid
      expect(user_without_password.errors[:password]).to include('は3文字以上で入力してください')
    end

    it 'is invalid without a password_confirmation' do
      user_without_password_confirmation = build(:user, password_confirmation: '')
      expect(user_without_password_confirmation).to be_invalid
      expect(user_without_password_confirmation.errors[:password_confirmation]).to include('を入力してください')
    end

    it 'is invalid with a duplicate name' do
      user = create(:user)
      user_with_duplicated_name = build(:user, name: user.name)
      expect(user_with_duplicated_name).to be_invalid
      expect(user_with_duplicated_name.errors[:name]).to include('はすでに存在します')
    end

    it 'is invalid with a duplicate email' do
      user = create(:user)
      user_with_duplicated_email = build(:user, email: user.email)
      expect(user_with_duplicated_email).to be_invalid
      expect(user_with_duplicated_email.errors[:email]).to include('はすでに存在します')
    end

    it 'is invalid with not same a password & password_confirmation' do
      user_with_not_same_password = build(:user, password: 'password', password_confirmation: 'password123456')
      expect(user_with_not_same_password).to be_invalid
      expect(user_with_not_same_password.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
    end
  end
end
