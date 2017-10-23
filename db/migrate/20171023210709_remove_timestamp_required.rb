class RemoveTimestampRequired < ActiveRecord::Migration[5.1]
  def change
    remove_timestamps :users
  end
end
