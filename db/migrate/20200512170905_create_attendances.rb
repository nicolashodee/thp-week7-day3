class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      #identifiant stripe
      t.string :stripe_customer_id
      # une participation appartient a un seul event
      t.belongs_to :event, index: true
      # une participation appartient a un seul user
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

