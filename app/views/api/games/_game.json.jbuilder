json.(game, :id,
            :user_id,
            :title, 
            :console,
            :comments,
            :price,
            :condition,
            :api_id,
            :sold,
            :created_at, 
            :updated_at,
            :thumb_url
)

json.user do
  json.username game.user.username
  json.id game.user.id
  json.coins game.user.coins
end

if game.buyer
  json.buyer do 
    json.username game.buyer.username
    json.id game.buyer.id
  end
end



