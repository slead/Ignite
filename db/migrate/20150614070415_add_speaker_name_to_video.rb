class AddSpeakerNameToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :speaker_name, :string
    add_column :videos, :speaker_url, :string
  end
end
