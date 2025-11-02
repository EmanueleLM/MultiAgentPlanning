(define (domain trip-scheduling)
  (:requirements :typing :negative-preconditions :disjunctive-preconditions :equality :action-costs)
  (:types city day)
  (:constants krakow athens zurich - city
              day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day)
  (:predicates
    (at ?c - city)
    (available ?d - day)
    (occupied ?c - city ?d - day)
    (relatives-visited)
    (visited ?c - city)
    (days-krakow-0) (days-krakow-1) (days-krakow-2) (days-krakow-3) (days-krakow-4) (days-krakow-5) (days-krakow-6)
    (days-athens-0) (days-athens-1) (days-athens-2) (days-athens-3) (days-athens-4) (days-athens-5) (days-athens-6) (days-athens-7)
    (days-zurich-0) (days-zurich-1) (days-zurich-2) (days-zurich-3) (days-zurich-4) (days-zurich-5)
  )

  (:action assign-day-krakow-0
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-0))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-0)) (days-krakow-1)
    )
    :cost 0
  )

  (:action assign-day-krakow-1
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-1))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-1)) (days-krakow-2)
    )
    :cost 0
  )

  (:action assign-day-krakow-2
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-2))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-2)) (days-krakow-3)
    )
    :cost 0
  )

  (:action assign-day-krakow-3
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-3))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-3)) (days-krakow-4)
    )
    :cost 0
  )

  (:action assign-day-krakow-4
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-4))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-4)) (days-krakow-5)
    )
    :cost 0
  )

  (:action assign-day-krakow-5
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-5))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-5)) (days-krakow-6)
    )
    :cost 0
  )

  (:action assign-day-athens-0
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-0))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-0)) (days-athens-1)
    )
    :cost 0
  )

  (:action assign-day-athens-1
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-1))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-1)) (days-athens-2)
    )
    :cost 0
  )

  (:action assign-day-athens-2
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-2))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-2)) (days-athens-3)
    )
    :cost 0
  )

  (:action assign-day-athens-3
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-3))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-3)) (days-athens-4)
    )
    :cost 0
  )

  (:action assign-day-athens-4
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-4))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-4)) (days-athens-5)
    )
    :cost 0
  )

  (:action assign-day-athens-5
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-5))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-5)) (days-athens-6)
    )
    :cost 0
  )

  (:action assign-day-athens-6
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-6))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-6)) (days-athens-7)
    )
    :cost 0
  )

  (:action assign-day-zurich-0
    :parameters (?d - day)
    :precondition (and (at zurich) (available ?d) (not (occupied zurich ?d)) (days-zurich-0))
    :effect (and
      (occupied zurich ?d)
      (not (available ?d))
      (visited zurich)
      (not (days-zurich-0)) (days-zurich-1)
    )
    :cost 0
  )

  (:action assign-day-zurich-1
    :parameters (?d - day)
    :precondition (and (at zurich) (available ?d) (not (occupied zurich ?d)) (days-zurich-1))
    :effect (and
      (occupied zurich ?d)
      (not (available ?d))
      (visited zurich)
      (not (days-zurich-1)) (days-zurich-2)
    )
    :cost 0
  )

  (:action assign-day-zurich-2
    :parameters (?d - day)
    :precondition (and (at zurich) (available ?d) (not (occupied zurich ?d)) (days-zurich-2))
    :effect (and
      (occupied zurich ?d)
      (not (available ?d))
      (visited zurich)
      (not (days-zurich-2)) (days-zurich-3)
    )
    :cost 0
  )

  (:action assign-day-zurich-3
    :parameters (?d - day)
    :precondition (and (at zurich) (available ?d) (not (occupied zurich ?d)) (days-zurich-3))
    :effect (and
      (occupied zurich ?d)
      (not (available ?d))
      (visited zurich)
      (not (days-zurich-3)) (days-zurich-4)
    )
    :cost 0
  )

  (:action assign-day-zurich-4
    :parameters (?d - day)
    :precondition (and (at zurich) (available ?d) (not (occupied zurich ?d)) (days-zurich-4))
    :effect (and
      (occupied zurich ?d)
      (not (available ?d))
      (visited zurich)
      (not (days-zurich-4)) (days-zurich-5)
    )
    :cost 0
  )

  (:action krakow-to-zurich
    :parameters ()
    :precondition (at krakow)
    :effect (and (not (at krakow)) (at zurich))
    :cost 1
  )

  (:action zurich-to-krakow
    :parameters ()
    :precondition (at zurich)
    :effect (and (not (at zurich)) (at krakow))
    :cost 1
  )

  (:action zurich-to-athens
    :parameters ()
    :precondition (at zurich)
    :effect (and (not (at zurich)) (at athens))
    :cost 1
  )

  (:action athens-to-zurich
    :parameters ()
    :precondition (at athens)
    :effect (and (not (at athens)) (at zurich))
    :cost 1
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
    :cost 0
  )
)