(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (next-to-assign ?d - day)
    (first-day ?d - day)
    (city-available ?c - city)
    (flight ?from - city ?to - city)
  )

  ;; Place a 3-day Bucharest block at the current assignment pointer (start)
  (:action place-bucharest-start
    :parameters (?d1 - day ?d2 - day ?d3 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (first-day ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?dnext)
      ;; ensure days are not already assigned (explicit negative checks over all cities)
      (not (at ?d1 frankfurt)) (not (at ?d1 bucharest)) (not (at ?d1 stuttgart))
      (not (at ?d2 frankfurt)) (not (at ?d2 bucharest)) (not (at ?d2 stuttgart))
      (not (at ?d3 frankfurt)) (not (at ?d3 bucharest)) (not (at ?d3 stuttgart))
      (city-available bucharest)
    )
    :effect (and
      (at ?d1 bucharest) (at ?d2 bucharest) (at ?d3 bucharest)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available bucharest))
    )
  )

  ;; Place a 3-day Bucharest block after a previous city that has a direct flight to Bucharest
  (:action place-bucharest-after
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?dnext)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc bucharest)
      (not (at ?d1 frankfurt)) (not (at ?d1 bucharest)) (not (at ?d1 stuttgart))
      (not (at ?d2 frankfurt)) (not (at ?d2 bucharest)) (not (at ?d2 stuttgart))
      (not (at ?d3 frankfurt)) (not (at ?d3 bucharest)) (not (at ?d3 stuttgart))
      (city-available bucharest)
    )
    :effect (and
      (at ?d1 bucharest) (at ?d2 bucharest) (at ?d3 bucharest)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available bucharest))
    )
  )

  ;; Place a 3-day Frankfurt block at the current assignment pointer (start)
  (:action place-frankfurt-start
    :parameters (?d1 - day ?d2 - day ?d3 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (first-day ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?dnext)
      (not (at ?d1 frankfurt)) (not (at ?d1 bucharest)) (not (at ?d1 stuttgart))
      (not (at ?d2 frankfurt)) (not (at ?d2 bucharest)) (not (at ?d2 stuttgart))
      (not (at ?d3 frankfurt)) (not (at ?d3 bucharest)) (not (at ?d3 stuttgart))
      (city-available frankfurt)
    )
    :effect (and
      (at ?d1 frankfurt) (at ?d2 frankfurt) (at ?d3 frankfurt)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available frankfurt))
    )
  )

  ;; Place a 3-day Frankfurt block after a previous city that has a direct flight to Frankfurt
  (:action place-frankfurt-after
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?dnext)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc frankfurt)
      (not (at ?d1 frankfurt)) (not (at ?d1 bucharest)) (not (at ?d1 stuttgart))
      (not (at ?d2 frankfurt)) (not (at ?d2 bucharest)) (not (at ?d2 stuttgart))
      (not (at ?d3 frankfurt)) (not (at ?d3 bucharest)) (not (at ?d3 stuttgart))
      (city-available frankfurt)
    )
    :effect (and
      (at ?d1 frankfurt) (at ?d2 frankfurt) (at ?d3 frankfurt)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available frankfurt))
    )
  )

  ;; Place a 4-day Stuttgart block at the current assignment pointer (start)
  (:action place-stuttgart-start
    :parameters (?d1 - day ?d2 - day ?d3 - day ?d4 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (first-day ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?d4) (next ?d4 ?dnext)
      (not (at ?d1 frankfurt)) (not (at ?d1 bucharest)) (not (at ?d1 stuttgart))
      (not (at ?d2 frankfurt)) (not (at ?d2 bucharest)) (not (at ?d2 stuttgart))
      (not (at ?d3 frankfurt)) (not (at ?d3 bucharest)) (not (at ?d3 stuttgart))
      (not (at ?d4 frankfurt)) (not (at ?d4 bucharest)) (not (at ?d4 stuttgart))
      (city-available stuttgart)
    )
    :effect (and
      (at ?d1 stuttgart) (at ?d2 stuttgart) (at ?d3 stuttgart) (at ?d4 stuttgart)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available stuttgart))
    )
  )

  ;; Place a 4-day Stuttgart block after a previous city that has a direct flight to Stuttgart
  (:action place-stuttgart-after
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?d4 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?d4) (next ?d4 ?dnext)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc stuttgart)
      (not (at ?d1 frankfurt)) (not (at ?d1 bucharest)) (not (at ?d1 stuttgart))
      (not (at ?d2 frankfurt)) (not (at ?d2 bucharest)) (not (at ?d2 stuttgart))
      (not (at ?d3 frankfurt)) (not (at ?d3 bucharest)) (not (at ?d3 stuttgart))
      (not (at ?d4 frankfurt)) (not (at ?d4 bucharest)) (not (at ?d4 stuttgart))
      (city-available stuttgart)
    )
    :effect (and
      (at ?d1 stuttgart) (at ?d2 stuttgart) (at ?d3 stuttgart) (at ?d4 stuttgart)
      (not (next-to-assign ?d1)) (next-to-assign ?dnext)
      (not (city-available stuttgart))
    )
  )
)