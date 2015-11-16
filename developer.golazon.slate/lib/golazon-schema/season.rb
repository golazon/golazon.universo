Golazon::Schema.doc do
  document "season" do
    term "Season"
    desc "A regularly scheduled contest to determine the best competitor of that cycle"

    field "_id" do
      term "Season id"
      type :object_id
    end

    field "n" do
      term "Season name"
      type :string
      example "2014"
    end

    document "c" do
      term "Competition"
      field "cid" do
        type :object_id
      end
      field "n" do
        term "Name"
        type :string
        example "World Cup"
      end
    end

    array "st" do
      term "Stages"
      item document do
        field "_id" do
          term "Stage id"
          type :object_id
        end
        field "n" do
          term "Name"
          type :string
          example "Knockout stage"
        end
        field "stid" do
          term "Parent stage"
          type :object_id
        end
      end
    end
  end
end