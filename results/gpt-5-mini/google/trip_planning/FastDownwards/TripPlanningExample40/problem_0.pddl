(define (problem trip8)
  (:domain jack_of_all_trades)
  (:objects
    oslo reykjavik manchester - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )
  (:init
    ;; successor (ordered day slots)
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)

    ;; direct flights (as provided; both directions included where applicable)
    (flight oslo reykjavik)
    (flight reykjavik oslo)
    (flight manchester oslo)
    (flight oslo manchester)

    ;; allow planner to choose starting city for day1
    (start_available)
  )

  ;; Goals encode the user's hard constraints exactly.
  ;; Note: the per-city day counts (6 oslo, 2 reykjavik, 2 manchester)
  ;; are compiled into explicit at-facts over concrete day slots.
  ;; These goals are therefore strict and may be unsatisfiable given only 8 days.
  (:goal (and
    ;; every day must be assigned
    (assigned day1) (assigned day2) (assigned day3) (assigned day4)
    (assigned day5) (assigned day6) (assigned day7) (assigned day8)

    ;; city-day count requirements (compiled to explicit day allocations)
    ;; oslo: 6 days (chosen here as day1..day6)
    (at oslo day1) (at oslo day2) (at oslo day3) (at oslo day4) (at oslo day5) (at oslo day6)

    ;; reykjavik: 2 days (chosen here as day7..day8)
    (at reykjavik day7) (at reykjavik day8)

    ;; manchester: 2 days (chosen here as day1..day2)
    (at manchester day1) (at manchester day2)
  ))
)