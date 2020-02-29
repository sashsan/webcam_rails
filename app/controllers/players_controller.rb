# frozen_string_literal: true

class PlayersController < ApplicationController
  before_action :set_player, only: %i[show edit update destroy]

  def index
    @players = Player.order(:created_at)
  end

  def show; end

  def new
    @player = Player.new
  end


  def edit; end

  def create
    @player = Player.create(players_params)

    PictureAttachmentService.attach(@player, params['player']['player_picture'])

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    PictureAttachmentService.attach(@player, params['player']['player_picture'])

    respond_to do |format|
      if @player.update(players_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { :no_content }
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def players_params
    params.require(:player).permit(
        :name,
        :dob,
        :pob,
        :age,
        :height,
        :position,
        :foot,
        :current_club,
        :player_picture
    )
  end
end
