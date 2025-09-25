(define (domain trip-scheduling)
  (:requirements :typing :adl :negative-preconditions :existential-preconditions)
  (:types city day)
  (:constants krakow athens zurich - city
              day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 day18 - day)
  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (occupied ?c - city ?d - day)
    (available ?d - day)
    (relatives-visited)
  )

  (:action athens-stay
    :precondition (and
      (at athens)
      (available day1) (available day2) (available day3) (available day4) (available day5) (available day6) (available day7)
      (not (visited athens))
    )
    :effect (and
      (visited athens)
      (occupied athens day1) (occupied athens day2) (occupied athens day3) (occupied athens day4) (occupied athens day5) (occupied athens day6) (occupied athens day7)
      (not (available day1)) (not (available day2)) (not (available day3)) (not (available day4)) (not (available day5)) (not (available day6)) (not (available day7))
    )
  )

  (:action krakow-stay
    :precondition (and
      (at krakow)
      (available day8) (available day9) (available day10) (available day11) (available day12) (available day13)
      (not (visited krakow))
    )
    :effect (and
      (visited krakow)
      (occupied krakow day8) (occupied krakow day9) (occupied krakow day10) (occupied krakow day11) (occupied krakow day12) (occupied krakow day13)
      (not (available day8)) (not (available day9)) (not (available day10)) (not (available day11)) (not (available day12)) (not (available day13))
    )
  )

  (:action zurich-stay
    :precondition (and
      (at zurich)
      (available day14) (available day15) (available day16) (available day17) (available day18)
      (not (visited zurich))
    )
    :effect (and
      (visited zurich)
      (occupied zurich day14) (occupied zurich day15) (occupied zurich day16) (occupied zurich day17) (occupied zurich day18)
      (not (available day14)) (not (available day15)) (not (available day16)) (not (available day17)) (not (available day18))
    )
  )

  (:action krakow-to-zurich
    :precondition (at krakow)
    :effect (and (not (at krakow)) (at zurich))
  )

  (:action zurich-to-krakow
    :precondition (at zurich)
    :effect (and (not (at zurich)) (at krakow))
  )

  (:action zurich-to-athens
    :precondition (at zurich)
    :effect (and (not (at zurich)) (at athens))
  )

  (:action athens-to-zurich
    :precondition (at athens)
    :effect (and (not (at athens)) (at zurich))
  )

  (:action athens-visit-relatives
    :precondition (and
      (at athens)
      (not (relatives-visited))
      (exists (?d - day) (occupied athens ?d))
    )
    :effect (relatives-visited)
  )
)