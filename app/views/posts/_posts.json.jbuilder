json.array!(posts) do |post|
	json.partial! "posts/post.json", post: post
end