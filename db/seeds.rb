5.times do |n|
  Task.create(
    title: "タイトル#{n + 1}",
    content: "コンテント#{n + 1}",
    user_id: n + 1
  )
end
