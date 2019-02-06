require 'rails_helper'

describe User do
  describe '#create' do
    # これは登録必須カラム追加したら変更
    it "is valid with a email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a email" do
     user = build( :user, email: "")
     user.valid?
     expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid whithout a password" do
      user = build( :user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
# これはパスワード確認を追加したら変更予定
    it "is invalid 8 password more than 8 characters" do
      user = build( :user,password: "12345678")
      expect(user).to be_valid
    end
# これはパスワード確認を追加したら変更予定
    it "is invalid with a password less than 5 characters" do
      user = build( :user,password: "12345")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
# これはパスワード確認を追加したら変更予定
    it "is invalid with a password more than 13 characters" do
      user = build( :user,password: "0000100001000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too long")
    end

  end
end
