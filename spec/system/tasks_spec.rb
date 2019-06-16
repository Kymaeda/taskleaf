require 'rails_helper'

describe "タスク管理機能", type: :system do
  describe "一覧表示機能" do
    before do
      # ユーザAを作成
      user_a = FactoryBot.create(:user, name: "ユーザA", email: "a@example.com")
      # 作成者がユーザAであるタスクを作成
      FactoryBot.create(:task, name: "最初のタスク", user: user_a)
    end

    context "ユーザAがログインしている時" do
      before do
        # ユーザAでログインする
        ## ログイン画面にアクセスする
        visit(login_path)
        ## メールアドレスを入力する
        fill_in "メールアドレス",	with: "a@example.com"
        ## パスワードを入力する
        fill_in "パスワード",	with: "password"
        ## ログインボタンを押す
        click_button 'ログインする'
      end

      it "ユーザAが作成したタスクが表示される" do
        # 作成済みのタスクが一覧画面上に表示されていることを確認する
        expect(page).to have_content "最初のタスク"
      end
    end
  end
end
