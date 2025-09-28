(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    brussels valencia nice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
    num1 num2 num3 num4 num5 num6 num7 num8 num9 - num
  )
  (:init
    ; initial location and visited initialization
    (at brussels day1)
    (visited brussels)

    ; day succession
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ; direct flights (only allowed direct connections)
    (direct_flight brussels valencia)
    (direct_flight valencia brussels)
    (direct_flight nice brussels)
    (direct_flight brussels nice)

    ; friend's available meeting window: days 1..6
    (allowed_meet day1)
    (allowed_meet day2)
    (allowed_meet day3)
    (allowed_meet day4)
    (allowed_meet day5)
    (allowed_meet day6)

    ; mark which city is Nice (used by meet action)
    (is_nice nice)

    ; encode traveler preferences (kept as information, not enforced hard constraints)
    (pref_stay brussels num2)
    (pref_stay valencia num3)
    (pref_stay nice num6)

    ; total days information
    (total_days num9)
  )
  (:goal (and
    (visited brussels)
    (visited valencia)
    (visited nice)
    (met_friend)
  ))
)