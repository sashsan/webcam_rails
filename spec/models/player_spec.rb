# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'with succes' do
    subject { create(:player).picture }

    it 'should to attach the image' do
      is_expected.to be_an_instance_of(ActiveStorage::Attached::One)
    end
  end
end
