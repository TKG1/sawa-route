FactoryBot.define do
  factory :route do
    name { "route" }
    description { "test" }
    level { 0 }              # enum level: { '入門': 0, '初級': 1, '中級': 2, '上級': 3 }
    schedule { 0 }           # enum schedule: { '日帰り': 0, '1泊2日': 1, '2泊3日': 2}
    time { '01:30' }
    length { '10' }
    mountain
  end
end
