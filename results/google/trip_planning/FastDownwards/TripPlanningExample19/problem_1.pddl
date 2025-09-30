(define (problem trip-planning-example19-problem)
  (:domain trip-planning-example19)
  (:objects
    brussels valencia nice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )
  (:init
    ;; initial location and visitation
    (at brussels day1)
    (visited brussels)

    ;; direct flights (bidirectional facts to encode available direct connections)
    (flight brussels valencia)
    (flight valencia brussels)
    (flight nice brussels)
    (flight brussels nice)

    ;; successor relation for days 1..9
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    (succ day8 day9)

    ;; friend's available meeting window: days 1..6 inclusive
    (allowed_meeting day1)
    (allowed_meeting day2)
    (allowed_meeting day3)
    (allowed_meeting day4)
    (allowed_meeting day5)
    (allowed_meeting day6)

    ;; mark which city is Nice (used by the meet action)
    (is_nice nice)

    ;; encode total days available (9)
    (total_days_9)

    ;; traveler's stated preferences (kept as facts; they are informational and not enforced hard constraints)
    (pref_brussels_2)
    (pref_valencia_3)
    (pref_nice_6)
  )
  (:goal (and
    (visited brussels)
    (visited valencia)
    (visited nice)
    (meeting_done)
  ))
)