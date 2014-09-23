require 'rails_helper'

describe MylistsController do
  let(:valid_attributes) {
    {
      title: "地球防衛軍2（ゆっくり実況）",
      mylist_id: 44787551,
      description: "",
      # 後で以下の要素をモデルに付け加える
      # published_at: "Wed, 25 Jun 2014 02:33:33 +0900"
      # build_latest_at: "Wed, 25 Jun 2014 02:33:33 +0900"
      # creator: "☆大神☆（大神過激団:編集長）"
    }
  }

  let(:invalid_attributes) {
    {
      title: "地球防衛軍2（ゆっくり実況）",
      mylist_id: "include strings",
      description: "",
      # 後で以下の要素をモデルに付け加える
      # published_at: "Wed, 25 Jun 2014 02:33:33 +0900"
      # build_latest_at: "Wed, 25 Jun 2014 02:33:33 +0900"
      # creator: "☆大神☆（大神過激団:編集長）"
    }
  }

  let(:valid_session) { {} }

  # describe "GET index" do
  #   it "assigns all mylists as @mylists" do
  #     mylist = Mylist.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:mylists)).to eq([mylist])
  #   end
  # end

  # describe "GET show" do
  #   it "assigns the requested mylist as @mylist" do
  #     mylist = Mylist.create! valid_attributes
  #     get :show, {:id => mylist.to_param}, valid_session
  #     expect(assigns(:mylist)).to eq(mylist)
  #   end
  # end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Mylist" do
        expect {
          post :create, {:mylist => valid_attributes}, valid_session
        }.to change(Mylist, :count).by(1)
      end

      it "assigns a newly created mylist as @mylist" do
        post :create, {:mylist => valid_attributes}, valid_session
        expect(assigns(:mylist)).to be_a(Mylist)
        expect(assigns(:mylist)).to be_persisted
      end

      it "respond status and requested data as json" do
        post :create, {:mylist => valid_attributes}, valid_session

        expect(response.body).to include "\"status\":\"ok\""
        expect(response.body).to include valid_attributes[:title]
        expect(response.body).to include valid_attributes[:mylist_id].to_s
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved mylist as @mylist" do
        post :create, {:mylist => invalid_attributes}, valid_session
        expect(assigns(:mylist)).to be_a_new(Mylist)
      end

      it "respond error status detail and requested data as json" do
        post :create, {:mylist => invalid_attributes}, valid_session

        expect(response.body).not_to include "\"status\":\"ok\""
        expect(response.body).to include invalid_attributes[:title]
        expect(response.body).to include invalid_attributes[:mylist_id].to_s
      end
    end
  end

end
