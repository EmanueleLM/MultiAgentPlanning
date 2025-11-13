(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (day-unassigned ?d - day)
    (at ?d - day ?c - city)
    (next-to-assign ?d - day)
    (first-day ?d - day)
    (city-available ?c - city)
    (window-day ?d - day)
    (attended-workshop)
    (flight ?from - city ?to - city)
  )

  (:action place-bucharest-start
    :parameters (?d1 - day ?d2 - day ?d3 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (first-day ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?dnext)
      (day-unassigned ?d1) (day-unassigned ?d2) (day-unassigned ?d3)
      (city-available bucharest)
    )
    :effect (and
      (not (day-unassigned ?d1)) (not (day-unassigned ?d2)) (not (day-unassigned ?d3))
      (at ?d1 bucharest) (at ?d2 bucharest) (at ?d3 bucharest)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available bucharest))
    )
  )

  (:action place-bucharest-after
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?dnext)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc bucharest)
      (day-unassigned ?d1) (day-unassigned ?d2) (day-unassigned ?d3)
      (city-available bucharest)
    )
    :effect (and
      (not (day-unassigned ?d1)) (not (day-unassigned ?d2)) (not (day-unassigned ?d3))
      (at ?d1 bucharest) (at ?d2 bucharest) (at ?d3 bucharest)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available bucharest))
    )
  )

  (:action place-frankfurt-start
    :parameters (?d1 - day ?d2 - day ?d3 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (first-day ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?dnext)
      (day-unassigned ?d1) (day-unassigned ?d2) (day-unassigned ?d3)
      (city-available frankfurt)
    )
    :effect (and
      (not (day-unassigned ?d1)) (not (day-unassigned ?d2)) (not (day-unassigned ?d3))
      (at ?d1 frankfurt) (at ?d2 frankfurt) (at ?d3 frankfurt)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available frankfurt))
    )
  )

  (:action place-frankfurt-after
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?dnext)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc frankfurt)
      (day-unassigned ?d1) (day-unassigned ?d2) (day-unassigned ?d3)
      (city-available frankfurt)
    )
    :effect (and
      (not (day-unassigned ?d1)) (not (day-unassigned ?d2)) (not (day-unassigned ?d3))
      (at ?d1 frankfurt) (at ?d2 frankfurt) (at ?d3 frankfurt)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available frankfurt))
    )
  )

  (:action place-stuttgart-start
    :parameters (?d1 - day ?d2 - day ?d3 - day ?d4 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (first-day ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?d4) (next ?d4 ?dnext)
      (day-unassigned ?d1) (day-unassigned ?d2) (day-unassigned ?d3) (day-unassigned ?d4)
      (city-available stuttgart)
    )
    :effect (and
      (not (day-unassigned ?d1)) (not (day-unassigned ?d2))
      (not (day-unassigned ?d3)) (not (day-unassigned ?d4))
      (at ?d1 stuttgart) (at ?d2 stuttgart) (at ?d3 stuttgart) (at ?d4 stuttgart)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available stuttgart))
    )
  )

  (:action place-stuttgart-after
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?d4 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?d4) (next ?d4 ?dnext)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc stuttgart)
      (day-unassigned ?d1) (day-unassigned ?d2)
      (day-unassigned ?d3) (day-unassigned ?d4)
      (city-available stuttgart)
    )
    :effect (and
      (not (day-unassigned ?d1)) (not (day-unassigned ?d2))
      (not (day-unassigned ?d3)) (not (day-unassigned ?d4))
      (at ?d1 stuttgart) (at ?d2 stuttgart) (at ?d3 stuttgart) (at ?d4 stuttgart)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available stuttgart))
    )
  )

  (:action mark-workshop
    :parameters (?d - day)
    :precondition (and
      (at ?d stuttgart)
      (window-day ?d)
      (not (attended-workshop))
    )
    :effect (attended-workshop)
  )
)