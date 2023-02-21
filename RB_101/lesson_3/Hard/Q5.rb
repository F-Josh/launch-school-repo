
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
p munsters.object_id

def mess_with_demographics(demo_hash)
  p demo_hash.object_id
  demo = Marshal.load(Marshal.dump(demo_hash))
  p demo.object_id

  demo.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
  p demo
end

mess_with_demographics(munsters)
p " "
p munsters

