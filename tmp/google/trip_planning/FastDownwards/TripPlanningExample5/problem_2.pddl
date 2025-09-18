(define (problem trip-16-days)
  (:domain unified-trip-planning)

  (:objects
    traveler - person
    oslo porto dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day

    oslo-t1 oslo-t2 oslo-t3 oslo-t4 oslo-t5 oslo-t6
    porto-t1 porto-t2 porto-t3 porto-t4 porto-t5
    dub-t1 dub-t2 dub-t3 dub-t4 dub-t5
    - token
  )

  (:init
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13) (unassigned day14) (unassigned day15) (unassigned day16)

    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16)

    (token-of oslo-t1 oslo) (token-free oslo-t1)
    (token-of oslo-t2 oslo) (token-free oslo-t2)
    (token-of oslo-t3 oslo) (token-free oslo-t3)
    (token-of oslo-t4 oslo) (token-free oslo-t4)
    (token-of oslo-t5 oslo) (token-free oslo-t5)
    (token-of oslo-t6 oslo) (token-free oslo-t6)

    (token-of porto-t1 porto) (token-free porto-t1)
    (token-of porto-t2 porto) (token-free porto-t2)
    (token-of porto-t3 porto) (token-free porto-t3)
    (token-of porto-t4 porto) (token-free porto-t4)
    (token-of porto-t5 porto) (token-free porto-t5)

    (token-of dub-t1 dubrovnik) (token-free dub-t1)
    (token-of dub-t2 dubrovnik) (token-free dub-t2)
    (token-of dub-t3 dubrovnik) (token-free dub-t3)
    (token-of dub-t4 dubrovnik) (token-free dub-t4)
    (token-of dub-t5 dubrovnik) (token-free dub-t5)

    (direct oslo dubrovnik)
    (direct dubrovnik oslo)
    (direct porto oslo)
    (direct oslo porto)
  )

  (:goal
    (and
      (not (unassigned day1)) (not (unassigned day2)) (not (unassigned day3))
      (not (unassigned day4)) (not (unassigned day5)) (not (unassigned day6))
      (not (unassigned day7)) (not (unassigned day8)) (not (unassigned day9))
      (not (unassigned day10)) (not (unassigned day11)) (not (unassigned day12))
      (not (unassigned day13)) (not (unassigned day14)) (not (unassigned day15))
      (not (unassigned day16))

      (at-day day12 dubrovnik)
      (at-day day16 dubrovnik)

      (at-person traveler dubrovnik day12)
      (at-person traveler dubrovnik day16)
    )
  )
)