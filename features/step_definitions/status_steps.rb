Given "the following statuses exist:" do |table|
  table.raw.each do |row|
    $statuses << {:text => row.first}
  end
end