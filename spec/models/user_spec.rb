require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとbirthdayが存在すれば登録できる。' do
        #user = User.new(nickname: 'aa', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', last_name: '伊藤', first_name: '一男' last_name_kana: 'イトウ', first_name_kana: 'カズオ' birthday: '1930-01-01')
        expect(User.new(nickname: 'aa', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', last_name: '伊藤', first_name: '一男', last_name_kana: 'イトウ', first_name_kana: 'カズオ', birthday: '1930-01-01')).to be_valid
      end
      
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user = User.new(nickname: 'aa', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', last_name: '伊藤', first_name: '一男', last_name_kana: 'イトウ', first_name_kana: 'カズオ', birthday: '1930-01-01')
        @user.save
        another_user = User.new(nickname: 'aa', email: 'test@example',last_name: '伊藤', first_name: '一男', last_name_kana: 'イトウ', first_name_kana: 'カズオ', birthday: '1930-01-01')
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
        #user = User.new(nickname: 'aa', email: 'test@example', password: 'aaaaaa', password_confirmation: 'aaaaaa', last_name: '伊藤', first_name: '一男', last_name_kana: 'イトウ', first_name_kana: 'カズオ', birthday: '1930-01-01')
        #user.valid?
        #expect(user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'last_nameが空では登録できない' do
        user = User.new(nickname: 'aa', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', last_name: '', first_name: '一男', last_name_kana: 'イトウ', first_name_kana: 'カズオ', birthday: '1930-01-01')
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        user = User.new(nickname: 'aa', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', last_name: '伊藤', first_name: '', last_name_kana: 'イトウ', first_name_kana: 'カズオ', birthday: '1930-01-01')
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        user = User.new(nickname: 'aa', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', last_name: '伊藤', first_name: '一男', last_name_kana: '', first_name_kana: 'カズオ', birthday: '1930-01-01')
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        user = User.new(nickname: 'aa', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', last_name: '伊藤', first_name: '一男', last_name_kana: 'イトウ', first_name_kana: '', birthday: '1930-01-01')
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        user = User.new(nickname: 'aa', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', last_name: '伊藤', first_name: '一男', last_name_kana: 'イトウ', first_name_kana: 'カズオ', birthday: '')
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

