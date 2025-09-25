(define (domain trip-scheduling)
  (:requirements :typing :negative-preconditions :equality :action-costs :fluents)
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
    (total-days-16)
  )
  (:functions (total-cost))

  (:action krakow-assign-day-0
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-0))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-0)) (days-krakow-1)
      (increase (total-cost) 0)
    )
  )

  (:action krakow-assign-day-1
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-1))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-1)) (days-krakow-2)
      (increase (total-cost) 0)
    )
  )

  (:action krakow-assign-day-2
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-2))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-2)) (days-krakow-3)
      (increase (total-cost) 0)
    )
  )

  (:action krakow-assign-day-3
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-3))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-3)) (days-krakow-4)
      (increase (total-cost) 0)
    )
  )

  (:action krakow-assign-day-4
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-4))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-4)) (days-krakow-5)
      (increase (total-cost) 0)
    )
  )

  (:action krakow-assign-day-5
    :parameters (?d - day)
    :precondition (and (at krakow) (available ?d) (not (occupied krakow ?d)) (days-krakow-5))
    :effect (and
      (occupied krakow ?d)
      (not (available ?d))
      (visited krakow)
      (not (days-krakow-5)) (days-krakow-6)
      (increase (total-cost) 0)
    )
  )

  (:action athens-assign-day-0
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-0))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-0)) (days-athens-1)
      (increase (total-cost) 0)
    )
  )

  (:action athens-assign-day-1
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-1))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-1)) (days-athens-2)
      (increase (total-cost) 0)
    )
  )

  (:action athens-assign-day-2
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-2))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-2)) (days-athens-3)
      (increase (total-cost) 0)
    )
  )

  (:action athens-assign-day-3
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-3))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-3)) (days-athens-4)
      (increase (total-cost) 0)
    )
  )

  (:action athens-assign-day-4
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-4))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-4)) (days-athens-5)
      (increase (total-cost) 0)
    )
  )

  (:action athens-assign-day-5
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-5))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-5)) (days-athens-6)
      (increase (total-cost) 0)
    )
  )

  (:action athens-assign-day-6
    :parameters (?d - day)
    :precondition (and (at athens) (available ?d) (not (occupied athens ?d)) (days-athens-6))
    :effect (and
      (occupied athens ?d)
      (not (available ?d))
      (visited athens)
      (not (days-athens-6)) (days-athens-7)
      (increase (total-cost) 0)
    )
  )

  (:action zurich-assign-day-0
    :parameters (?d - day)
    :precondition (and (at zurich) (available ?d) (not (occupied zurich ?d)) (days-zurich-0))
    :effect (and
      (occupied zurich ?d)
      (not (available ?d))
      (visited zurich)
      (not (days-zurich-0)) (days-zurich-1)
      (increase (total-cost) 0)
    )
  )

  (:action zurich-assign-day-1
    :parameters (?d - day)
    :precondition (and (at zurich) (available ?d) (not (occupied zurich ?d)) (days-zurich-1))
    :effect (and
      (occupied zurich ?d)
      (not (available ?d))
      (visited zurich)
      (not (days-zurich-1)) (days-zurich-2)
      (increase (total-cost) 0)
    )
  )

  (:action zurich-assign-day-2
    :parameters (?d - day)
    :precondition (and (at zurich) (available ?d) (not (occupied zurich ?d)) (days-zurich-2))
    :effect (and
      (occupied zurich ?d)
      (not (available ?d))
      (visited zurich)
      (not (days-zurich-2)) (days-zurich-3)
      (increase (total-cost) 0)
    )
  )

  (:action zurich-assign-day-3
    :parameters (?d - day)
    :precondition (and (at zurich) (available ?d) (not (occupied zurich ?d)) (days-zurich-3))
    :effect (and
      (occupied zurich ?d)
      (not (available ?d))
      (visited zurich)
      (not (days-zurich-3)) (days-zurich-4)
      (increase (total-cost) 0)
    )
  )

  (:action zurich-assign-day-4
    :parameters (?d - day)
    :precondition (and (at zurich) (available ?d) (not (occupied zurich ?d)) (days-zurich-4))
    :effect (and
      (occupied zurich ?d)
      (not (available ?d))
      (visited zurich)
      (not (days-zurich-4)) (days-zurich-5)
      (increase (total-cost) 0)
    )
  )

  (:action krakow-to-zurich
    :parameters ()
    :precondition (at krakow)
    :effect (and (not (at krakow)) (at zurich) (increase (total-cost) 1))
  )

  (:action zurich-to-krakow
    :parameters ()
    :precondition (at zurich)
    :effect (and (not (at zurich)) (at krakow) (increase (total-cost) 1))
  )

  (:action zurich-to-athens
    :parameters ()
    :precondition (at zurich)
    :effect (and (not (at zurich)) (at athens) (increase (total-cost) 1))
  )

  (:action athens-to-zurich
    :parameters ()
    :precondition (at athens)
    :effect (and (not (at athens)) (at zurich) (increase (total-cost) 1))
  )

  (:action visit-relatives-day1
    :parameters ()
    :precondition (and (at athens) (not (relatives-visited)) (occupied athens day1))
    :effect (and (relatives-visited) (increase (total-cost) 0))
  )

  (:action visit-relatives-day2
    :parameters ()
    :precondition (and (at athens) (not (relatives-visited)) (occupied athens day2))
    :effect (and (relatives-visited) (increase (total-cost) 0))
  )

  (:action visit-relatives-day3
    :parameters ()
    :precondition (and (at athens) (not (relatives-visited)) (occupied athens day3))
    :effect (and (relatives-visited) (increase (total-cost) 0))
  )

  (:action visit-relatives-day4
    :parameters ()
    :precondition (and (at athens) (not (relatives-visited)) (occupied athens day4))
    :effect (and (relatives-visited) (increase (total-cost) 0))
  )

  (:action visit-relatives-day5
    :parameters ()
    :precondition (and (at athens) (not (relatives-visited)) (occupied athens day5))
    :effect (and (relatives-visited) (increase (total-cost) 0))
  )

  (:action visit-relatives-day6
    :parameters ()
    :precondition (and (at athens) (not (relatives-visited)) (occupied athens day6))
    :effect (and (relatives-visited) (increase (total-cost) 0))
  )

  (:action visit-relatives-day7
    :parameters ()
    :precondition (and (at athens) (not (relatives-visited)) (occupied athens day7))
    :effect (and (relatives-visited) (increase (total-cost) 0))
  )
)