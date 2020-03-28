class AddViewsToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :views, :integer, default: 0
    #Ex:- :default =>''
  end
end
