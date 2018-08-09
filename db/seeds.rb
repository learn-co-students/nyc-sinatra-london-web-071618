landmarks_list = {
    "BQE" => {
      :year_completed => 1947,
      :figure_id => 1
    },
    "Holland Tunnel" => {
      :year_completed => 1927,
      :figure_id => 5
    },
    "Wall Street Wall" => {
      :year_completed => 1684,
      :figure_id => 4
    },
    "Brooklyn Battery Tunnel" => {
      :year_completed => 1973,
      :figure_id => 10
    }
  }

landmarks_list.each do |name, landmark_hash|
  p = Landmark.new
  p.name = name
  landmark_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

figure_list = {
    "Robert Moses" => {
    },
    "Al Smith" => {
    },
    "Theodore Roosevelt" => {
    },
    "Peter Stuyvesant" => {
    },
    "Boss Tweed" => {
    },
    "Michael Bloomberg" => {
    },
    "Ed Koch" => {
    },
    "Fiorello Laguardia" => {
    },
    "Jimmy Walker" => {
    },
    "Belle Moskowitz" => {
    }
  }


figure_list.each do |name, figure_hash|
  p = Figure.new
  p.name = name
  p.save
end


title_list = {
    "Mayor" => {
    },
    "President" => {
    },
    "Governor" => {
    },
    "NYC Parks Commissioner" => {
    }
  }

title_list.each do |name, figure_hash|
  p = Title.new
  p.name = name
  p.save
end


figure_title_list = [[1,3,2],[2,3,3],[3,2,3],[4,1,9],[5,4,1]]
figure_title_list.each do |array|
    FigureTitle.create(id: array[0], figure_id:array[1], title_id: array[2] )
  end
