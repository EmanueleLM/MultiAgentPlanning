(define (problem combined-trip-9days)
  (:domain combined-europe-trip)

  (:objects
    oslo dublin valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ;; day ordering
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ;; connectivity (both predicate flavors used in fragments)
    (connected oslo dublin)
    (connected dublin oslo)
    (connected dublin valencia)
    (connected valencia dublin)

    (flight oslo dublin)
    (flight dublin oslo)
    (flight dublin valencia)
    (flight valencia dublin)

    ;; special city markers
    (is-dublin dublin)
    (is-valencia valencia)

    ;; relatives visit window (day objects)
    (in-rel-window day5)
    (in-rel-window day6)
    (in-rel-window day7)
    (in-rel-window day8)
    (in-rel-window day9)

    ;; initialize counters to zero
    (oslo-count-0)
    (valencia-count-0)
    (dublin-count-0)

    ;; No initial at/at-day facts: planner chooses start via start-at
  )

  (:goal (and
    (visited oslo)
    (visited dublin)
    (visited valencia)

    (relatives-visited)
    (visited-relatives)

    ;; stay requirements encoded as counts
    (oslo-count-3)
    (valencia-count-5)
  ))
)