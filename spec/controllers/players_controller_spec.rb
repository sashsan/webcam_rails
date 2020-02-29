# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe 'GET #index' do
    let!(:players) { create_list :player, 5 }

    subject do
      get :index, format: :html
      response
    end

    it 'show all players' do
      is_expected.to be_successful
      is_expected.to render_template :index
    end
  end

  describe 'GET #show' do
    let!(:player) { create :player }

    subject do
      get :show, params: { id: player.id }
    end

    it 'show single player' do
      is_expected.to be_successful
      is_expected.to render_template :show
    end
  end

  describe 'POST #create' do
    let!(:player) { create(:player) }

    let(:params) do
      { player: {
        name: player.name,
        dob: player.dob,
        pob: player.pob,
        age: player.age,
        height: player.height,
        position: player.position,
        foot: player.foot,
        current_club: player.current_club,
        player_picture: player.picture
      }
      }
    end

    subject do
      post :create, params: params
      response
    end

    context 'wih success' do
      it 'saves player' do
        expect { subject }.to change(Player, :count).by(1)
      end
    end
  end
end
