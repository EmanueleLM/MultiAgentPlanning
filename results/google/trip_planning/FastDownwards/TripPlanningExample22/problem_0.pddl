(define (problem trip-11days)
  (:domain itinerary)
  (:objects
    berlin frankfurt bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ; successor (day progression)
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11)

    ; direct-flight topology (hard constraints)
    (flight berlin frankfurt)
    (flight frankfurt berlin)
    (flight frankfurt bucharest)
    (flight bucharest frankfurt)
    ; no flight between berlin and bucharest is encoded by omission

    ; initial location and assignment: per "earliest feasible" we start in Berlin on day1
    (at berlin day1)
    (assigned day1)

    ; Notes: days day2..day11 are initially unassigned and will be assigned by stay/travel actions.
  )

  ; Goal: enforce the resolved, feasible allocation (Berlin 5d, Frankfurt 4d, Bucharest 2d),
  ; and that all days are assigned. This encoding fixes which city is assigned to each day
  ; (the planner must generate the appropriate sequence of stay/travel actions to reach it).
  (:goal
    (and
      ; all days assigned
      (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
      (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10) (assigned day11)

      ; city-by-day assignments (chosen schedule: earliest Berlin to satisfy show window)
      ; Berlin days (5 days): day1..day5
      (at berlin day1) (at berlin day2) (at berlin day3) (at berlin day4) (at berlin day5)

      ; Frankfurt days (4 days): day6..day9
      (at frankfurt day6) (at frankfurt day7) (at frankfurt day8) (at frankfurt day9)

      ; Bucharest days (2 days): day10..day11
      (at bucharest day10) (at bucharest day11)
    )
  )

  (:metric minimize (total-time)) ; placeholder: FastDownward will ignore if not using metric; primary goal is feasibility
)