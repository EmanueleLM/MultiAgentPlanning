(define (domain trip-scheduling)
  (:requirements :typing :fluents :negative-preconditions :disjunctive-preconditions :equality)
  (:types city day)
  (:constants krakow athens zurich - city
              day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day)
  (:predicates
    (at ?c - city)
    (available ?d - day)
    (occupied ?c - city ?d - day)
    (relatives-visited)
    (visited ?c - city)
  )
  (:functions
    (days-assigned ?c - city)
    (total-assigned)
  )

  (:action assign-day
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (available ?d)
      (not (occupied ?c ?d))
    )
    :effect (and
      (occupied ?c ?d)
      (not (available ?d))
      (visited ?c)
      (increase (days-assigned ?c) 1)
      (increase (total-assigned) 1)
    )
  )

  (:action krakow-to-zurich
    :parameters ()
    :precondition (at krakow)
    :effect (and (not (at krakow)) (at zurich))
  )

  (:action zurich-to-krakow
    :parameters ()
    :precondition (at zurich)
    :effect (and (not (at zurich)) (at krakow))
  )

  (:action zurich-to-athens
    :parameters ()
    :precondition (at zurich)
    :effect (and (not (at zurich)) (at athens))
  )

  (:action athens-to-zurich
    :parameters ()
    :precondition (at athens)
    :effect (and (not (at athens)) (at zurich))
  )

  (:action visit-relatives
    :parameters ()
    :precondition (and
      (at athens)
      (not (relatives-visited))
      (or
        (occupied athens day1) (occupied athens day2) (occupied athens day3)
        (occupied athens day4) (occupied athens day5) (occupied athens day6)
        (occupied athens day7)
      )
    )
    :effect (relatives-visited)
  )
)