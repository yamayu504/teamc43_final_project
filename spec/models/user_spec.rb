require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with all user info" do
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

    it "is invalid whithout a password_confirmation" do
      user = build( :user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid with a password more than 6 characters" do
      user = build( :user,password: "000010",password_confirmation: "000010")
      expect(user).to be_valid
    end

    it "is invalid with a password less than 5 characters" do
      user = build( :user,password: "00001",password_confirmation: "00001")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    it "is invalid with a password more than 12 characters" do
      user = build( :user,password: "0000100001000",password_confirmation: "0000100001000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too long")
    end

    it "is invalid without a nickname" do
     user = build( :user, nickname: "")
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid with a nickname more than 20 characters" do
     user = build( :user, nickname: "00001aaaab00001aaaab0")
     user.valid?
     expect(user.errors[:nickname][0]).to include("is too long")
    end

    it "is invalid without a last_name" do
     user = build( :user, last_name: "")
     user.valid?
     expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
     user = build( :user, first_name: "")
     user.valid?
     expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a last_name_kana" do
     user = build( :user, last_name_kana: "")
     user.valid?
     expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
     user = build( :user, first_name_kana: "")
     user.valid?
     expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid with a last_name is not em" do
     user = build( :user, last_name: "siraishi")
     user.valid?
     expect(user.errors[:last_name]).to include("is invalid")
    end

    it "is invalid with a first_name is not em" do
     user = build( :user, first_name: "mai")
     user.valid?
     expect(user.errors[:first_name]).to include("is invalid")
    end

    it "is invalid with a last_name_kana is not katakana" do
     user = build( :user, last_name_kana: "白石")
     user.valid?
     expect(user.errors[:last_name_kana]).to include("is invalid")
    end

    it "is invalid with a first_name_kana is not katakana" do
     user = build( :user, first_name_kana: "まい")
     user.valid?
     expect(user.errors[:first_name_kana]).to include("is invalid")
    end

    it "is invalid without a phone_number" do
     user = build( :user, phone_number: "")
     user.valid?
     expect(user.errors[:phone_number]).to include("can't be blank")
    end

    it "is invalid with a phone_number less than 10 characters" do
      user = build( :user,phone_number: "0901111222")
      user.valid?
      expect(user.errors[:phone_number][0]).to include("is the wrong length")
    end

    it "is invalid with a phone_number more than 12 characters" do
      user = build( :user,phone_number: "090123412345")
      user.valid?
      expect(user.errors[:phone_number][0]).to include("is the wrong length")
    end

    it "is invalid without a prefecture" do
     user = build( :user, prefecture: "")
     user.valid?
     expect(user.errors[:prefecture]).to include("can't be blank")
    end

    it "is invalid without a cities" do
     user = build( :user, cities: "")
     user.valid?
     expect(user.errors[:cities]).to include("can't be blank")
    end

    it "is invalid without a address" do
     user = build( :user, address: "")
     user.valid?
     expect(user.errors[:address]).to include("can't be blank")
    end

    it "is invalid without a birthday" do
     user = build( :user, birthday: "")
     user.valid?
     expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "is invalid with a postal_code less than 6 characters" do
      user = build( :user,postal_code: "001000")
      user.valid?
      expect(user.errors[:postal_code][0]).to include("is the wrong length")
    end

    it "is invalid with a postal_code more than 8 characters" do
      user = build( :user,postal_code: "00100010")
      user.valid?
      expect(user.errors[:postal_code][0]).to include("is the wrong length")
    end
  end
end
