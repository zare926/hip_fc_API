class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.1]
  def change
    
    create_table(:users) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :name, null: false
      t.string :image, null: false, default: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fnureyon.com%2Fupper_body-2%3Fpattern%3D2&psig=AOvVaw2_WdR1-wdNoUFjcthZ9QT2&ust=1648020569150000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOiR5ZOZ2fYCFQAAAAAdAAAAABAi'
      t.string :email, null: false
      t.boolean :paid_member, null: false, default: false
      t.boolean :notice, null: false, default: false

      ## Tokens
      t.text :tokens

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, [:uid, :provider],     unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
