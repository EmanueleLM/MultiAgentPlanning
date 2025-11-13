(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (next-to-assign ?d - day)
    (first-day ?d - day)
    (placed ?c - city)
    (flight ?from - city ?to - city)
  )

  ;; Place a 3-day contiguous block of bucharest starting at the first day
  (:action place-bucharest-start
    :parameters (?d1 - day ?d2 - day ?d3 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (first-day ?d1)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (next ?d3 ?dnext)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3))
      (not (placed bucharest))
    )
    :effect (and
      (at ?d1 bucharest) (at ?d2 bucharest) (at ?d3 bucharest)
      (assigned ?d1) (assigned ?d2) (assigned ?d3)
      (placed bucharest)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
    )
  )

  ;; Place a 3-day contiguous block of bucharest after a previous block; require direct flight from previous day's city
  (:action place-bucharest-after
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (next ?d3 ?dnext)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc bucharest)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3))
      (not (placed bucharest))
    )
    :effect (and
      (at ?d1 bucharest) (at ?d2 bucharest) (at ?d3 bucharest)
      (assigned ?d1) (assigned ?d2) (assigned ?d3)
      (placed bucharest)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
    )
  )

  ;; Place a 3-day contiguous block of frankfurt starting at the first day
  (:action place-frankfurt-start
    :parameters (?d1 - day ?d2 - day ?d3 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (first-day ?d1)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (next ?d3 ?dnext)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3))
      (not (placed frankfurt))
    )
    :effect (and
      (at ?d1 frankfurt) (at ?d2 frankfurt) (at ?d3 frankfurt)
      (assigned ?d1) (assigned ?d2) (assigned ?d3)
      (placed frankfurt)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
    )
  )

  ;; Place a 3-day contiguous block of frankfurt after a previous block; require direct flight from previous day's city
  (:action place-frankfurt-after
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (next ?d3 ?dnext)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc frankfurt)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3))
      (not (placed frankfurt))
    )
    :effect (and
      (at ?d1 frankfurt) (at ?d2 frankfurt) (at ?d3 frankfurt)
      (assigned ?d1) (assigned ?d2) (assigned ?d3)
      (placed frankfurt)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
    )
  )

  ;; Place a 4-day contiguous block of stuttgart starting at the first day
  (:action place-stuttgart-start
    :parameters (?d1 - day ?d2 - day ?d3 - day ?d4 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (first-day ?d1)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (next ?d3 ?d4)
      (next ?d4 ?dnext)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3)) (not (assigned ?d4))
      (not (placed stuttgart))
    )
    :effect (and
      (at ?d1 stuttgart) (at ?d2 stuttgart) (at ?d3 stuttgart) (at ?d4 stuttgart)
      (assigned ?d1) (assigned ?d2) (assigned ?d3) (assigned ?d4)
      (placed stuttgart)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
    )
  )

  ;; Place a 4-day contiguous block of stuttgart after a previous block; require direct flight from previous day's city
  (:action place-stuttgart-after
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?d4 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (next ?d3 ?d4)
      (next ?d4 ?dnext)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc stuttgart)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3)) (not (assigned ?d4))
      (not (placed stuttgart))
    )
    :effect (and
      (at ?d1 stuttgart) (at ?d2 stuttgart) (at ?d3 stuttgart) (at ?d4 stuttgart)
      (assigned ?d1) (assigned ?d2) (assigned ?d3) (assigned ?d4)
      (placed stuttgart)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
    )
  )
)