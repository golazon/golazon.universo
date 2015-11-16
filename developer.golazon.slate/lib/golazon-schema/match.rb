Golazon::Schema.doc do
  document "match" do
    term "Match"

    field "_id" do
      term "Match id"
      type :object_id
    end

    document "d" do
      term "Date"
      desc "Match date (always in GMT)"
      field "y" do
        term "Year"
        type :int
        example 2014
      end
      field "m" do
        term "Month"
        type :int
        example 7
      end
      field "d" do
        term "Day"
        type :int
        example 13
      end
      field "t" do
        term "Time"
        type :string
        example "20:30"
      end
    end

    array "ts" do
      term "Teams"
      desc "First (home) and second (away) team."
      validates length: { is: 2 }
      item document do
        field "tid" do
          term "Team id"
          type :object_id
        end
        field "n" do
          term "Team name"
          type :string
        end
      end
      example [{tid: oid, n: "Argentina" }, {tid: oid, n: "Germany" }]
    end

    field "h" do
      term "Host"
      desc "Home team inidcator or neutral venue. Must be: first (home) team (1) or neutral (0)"
      type :int
      validates inclusion: { in: [1, 0] }
      example 0
    end

    document "res" do
      term "Result"
      array "fs" do
        term "Score"
        desc "Final score (score after 2nd half or extra time)"
        item field { type :int }
        example [4, 4]
        validates length: { is: 2 }
      end
      array "ht" do
        term "HT score"
        desc "Halt-time score (after 1st half)"
        item field { type :int }
        example [1, 1]
        validates length: { is: 2 }
        item field { type :int }
      end
      array "ft" do
        term "FT score"
        desc "Full (regular) time score (after 2nd half)"
        item field { type :int }
        example [2, 2]
        validates length: { is: 2 }
      end
      array "ot" do
        term "Over time score"
        desc "Score after second half of over (extra) time"
        item field { type :int }
        example [4, 4]
        validates length: { is: 2 }
      end
      array "pso" do
        term "PSO score"
        desc "Penalty shoot-out score"
        item field { type :int }
        example [5, 3]
        validates length: { is: 2 }
      end
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

    document "s" do
      term "Season"
      field "sid" do
        type :object_id
      end
      field "n" do
        term "Name"
        type :string
        example "2014"
      end
    end

    document "st" do
      term "Stage"
      field "stid" do
        type :object_id
      end
      field "n" do
        term "Name"
        type :string
        example "Knockout Stage"
      end
    end
  end
end