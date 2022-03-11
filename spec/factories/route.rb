FactoryBot.define do
  factory :route do
    name { "route" }
    description { "test" }
    level { 0 }              # enum level: { grade1: 0, grade2: 1, grade3: 2, grade3_up: 3, grade4: 4 }
    schedule { 0 }           # enum schedule: { one_day: 0, two_days: 1, three_days: 2 }
    time { '01:30' }
    length { '10' }
    mountain
  end
end
