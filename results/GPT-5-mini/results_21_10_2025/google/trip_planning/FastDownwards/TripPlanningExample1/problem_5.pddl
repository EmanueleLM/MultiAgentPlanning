(define (problem trip_problem)
  (:domain trip_domain)

  (:objects
    traveller - person
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
    level0 level1 level2 level3 level4 level5 level6 level7 - level
  )

  (:init
    (at traveller riga)

    ;; available days (15 total)
    (day-available day1) (day-available day2) (day-available day3)
    (day-available day4) (day-available day5) (day-available day6)
    (day-available day7) (day-available day8) (day-available day9)
    (day-available day10) (day-available day11) (day-available day12)
    (day-available day13) (day-available day14) (day-available day15)

    ;; connectivity (only direct flights allowed as specified)
    (connected riga manchester)
    (connected manchester riga)
    (connected manchester split)

    ;; initial stayed levels (no days stayed yet)
    (stayed riga level0)
    (stayed manchester level0)
    (stayed split level0)

    ;; level progression for counting stays
    (next-level level0 level1)
    (next-level level1 level2)
    (next-level level2 level3)
    (next-level level3 level4)
    (next-level level4 level5)
    (next-level level5 level6)
    (next-level level6 level7)
  )

  (:goal
    (and
      ;; Human-specified per-city stays (as provided in the specification)
      (stayed riga level7)
      (stayed manchester level4)
      (stayed split level6)
    )
  )
)