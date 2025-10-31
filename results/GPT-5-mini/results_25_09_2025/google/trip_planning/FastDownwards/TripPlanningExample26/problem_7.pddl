(define (problem plan-16-day-trip)
  (:domain multiagent-trip)
  (:objects
    traveler_agent flights_agent orchestrator - agent
    porto berlin reykjavik - city
    porto_tok1 porto_tok2 porto_tok3 porto_tok4 porto_tok5 porto_tok6 porto_tok7
      - token
    berlin_tok1 berlin_tok2 berlin_tok3 berlin_tok4 berlin_tok5 berlin_tok6
      - token
    reyk_tok1 reyk_tok2 reyk_tok3 reyk_tok4 reyk_tok5
      - token
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16
      - day
  )

  (:init
    ;; initial day
    (current-day day0)

    ;; day succession
    (next day0 day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
    (next day15 day16)

    ;; stay requirements as tokens
    (porto_token porto_tok1)
    (porto_token porto_tok2)
    (porto_token porto_tok3)
    (porto_token porto_tok4)
    (porto_token porto_tok5)
    (porto_token porto_tok6)
    (porto_token porto_tok7)

    (berlin_token berlin_tok1)
    (berlin_token berlin_tok2)
    (berlin_token berlin_tok3)
    (berlin_token berlin_tok4)
    (berlin_token berlin_tok5)
    (berlin_token berlin_tok6)

    (reyk_token reyk_tok1)
    (reyk_token reyk_tok2)
    (reyk_token reyk_tok3)
    (reyk_token reyk_tok4)
    (reyk_token reyk_tok5)

    ;; starting location
    (at traveler_agent porto)

    ;; direct flights (bidirectional where known)
    (direct porto berlin)
    (direct berlin porto)
    (direct berlin reykjavik)
    (direct reykjavik berlin)

    ;; mark reykjavik city
    (reykjavik reykjavik)

    ;; allowed meeting days (day12..day16)
    (meetable_day day12)
    (meetable_day day13)
    (meetable_day day14)
    (meetable_day day15)
    (meetable_day day16)
  )

  (:goal (and
    ;; all stay tokens consumed (represented by consumed_* predicates)
    (consumed_porto porto_tok1)
    (consumed_porto porto_tok2)
    (consumed_porto porto_tok3)
    (consumed_porto porto_tok4)
    (consumed_porto porto_tok5)
    (consumed_porto porto_tok6)
    (consumed_porto porto_tok7)

    (consumed_berlin berlin_tok1)
    (consumed_berlin berlin_tok2)
    (consumed_berlin berlin_tok3)
    (consumed_berlin berlin_tok4)
    (consumed_berlin berlin_tok5)
    (consumed_berlin berlin_tok6)

    (consumed_reyk reyk_tok1)
    (consumed_reyk reyk_tok2)
    (consumed_reyk reyk_tok3)
    (consumed_reyk reyk_tok4)
    (consumed_reyk reyk_tok5)

    ;; meeting happened
    (met_friend)

    ;; final day is day16
    (current-day day16)
  ))
)