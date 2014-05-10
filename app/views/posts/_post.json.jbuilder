json.(post, :id, :title, :body, :user_id, :created_at, :updated_at, :likes_count)
json.user do
	json.id post.user.id
	json.username post.user.username
end
json.comments do
	json.array!(post.comments) do |comment|
		json.id comment.id
		json.body comment.body
    json.created_at comment.created_at
    json.updated_at comment.updated_at
    json.comment_sender do
			json.id comment.comment_sender.id
			json.username comment.comment_sender.username
		end
	end
end
json.likes do 
	json.array!(post.likes) do |like|
		json.id like.id
		json.user_id like.user_id
		json.user do
			json.id like.user.id
			json.username like.user.username
		end
	end
end