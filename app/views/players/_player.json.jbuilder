# frozen_string_literal: true

json.extract! player, :id, :dob, :pob, :age, :height,
              :position, :foot, :current_club, :created_at, :updated_at

json.url player_url(player, format: :json)