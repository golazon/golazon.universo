Golazon::Schema.doc do
  document "competition" do
    term "Competition"
    desc "General competition, consists of many seasons (editions, championships)."

    field "_id" do
      term "Competition id"
      type :object_id
    end

    field "n" do
      term "Name"
      type :string
      example "World Cup"
    end
  end
end