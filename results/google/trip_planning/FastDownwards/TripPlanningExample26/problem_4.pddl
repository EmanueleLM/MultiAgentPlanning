(define (problem plan-16-day-trip)
  (:domain multiagent-trip)
  (:objects
    traveler_agent flights_agent - agent
    porto berlin reykjavik - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (current_day d0)
    (at traveler_agent porto)

    (direct porto berlin)
    (direct berlin porto)
    (direct berlin reykjavik)
    (direct reykjavik berlin)

    (next d0 d1) (next d1 d2) (next d2 d3) (next d3 d4)
    (next d4 d5) (next d5 d6) (next d6 d7) (next d7 d8)
    (next d8 d9) (next d9 d10) (next d10 d11) (next d11 d12)
    (next d12 d13) (next d13 d14) (next d14 d15) (next d15 d16)

    (allowed_meet_day d12)
    (allowed_meet_day d13)
    (allowed_meet_day d14)
    (allowed_meet_day d15)
    (allowed_meet_day d16)

    (is_reykjavik reykjavik)
  )

  (:goal (and
    (visited porto)
    (visited berlin)
    (visited reykjavik)
    (met_friend)
    (current_day d16)
  ))
)