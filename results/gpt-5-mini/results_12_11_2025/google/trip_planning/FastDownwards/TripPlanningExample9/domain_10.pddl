(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  ;; City constants so action schemas can refer to specific cities
  (:constants bucharest frankfurt stuttgart - city)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (next-to-assign ?d - day)
    (placed ?c - city)
    (start-day ?d - day)
    (last-day ?d - day)
    (flight ?from - city ?to - city)
  )

  ;; -------------------------
  ;; Bucharest 3-day placements
  ;; -------------------------
  ;; Start, non-final (block ends before last day)
  (:action place-bucharest-start-nf
    :parameters (?d1 - day ?d2 - day ?d3 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (start-day ?d1)
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

  ;; Start, final (block ends at last day)
  (:action place-bucharest-start-final
    :parameters (?d1 - day ?d2 - day ?d3 - day)
    :precondition (and
      (next-to-assign ?d1)
      (start-day ?d1)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (last-day ?d3)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3))
      (not (placed bucharest))
    )
    :effect (and
      (at ?d1 bucharest) (at ?d2 bucharest) (at ?d3 bucharest)
      (assigned ?d1) (assigned ?d2) (assigned ?d3)
      (placed bucharest)
      (not (next-to-assign ?d1))
    )
  )

  ;; After (requires predecessor day's city has a direct flight to Bucharest) - non-final
  (:action place-bucharest-after-nf
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc bucharest)
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

  ;; After - final (block ends at last day)
  (:action place-bucharest-after-final
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc bucharest)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (last-day ?d3)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3))
      (not (placed bucharest))
    )
    :effect (and
      (at ?d1 bucharest) (at ?d2 bucharest) (at ?d3 bucharest)
      (assigned ?d1) (assigned ?d2) (assigned ?d3)
      (placed bucharest)
      (not (next-to-assign ?d1))
    )
  )

  ;; -------------------------
  ;; Frankfurt 3-day placements
  ;; -------------------------
  (:action place-frankfurt-start-nf
    :parameters (?d1 - day ?d2 - day ?d3 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (start-day ?d1)
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

  (:action place-frankfurt-start-final
    :parameters (?d1 - day ?d2 - day ?d3 - day)
    :precondition (and
      (next-to-assign ?d1)
      (start-day ?d1)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (last-day ?d3)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3))
      (not (placed frankfurt))
    )
    :effect (and
      (at ?d1 frankfurt) (at ?d2 frankfurt) (at ?d3 frankfurt)
      (assigned ?d1) (assigned ?d2) (assigned ?d3)
      (placed frankfurt)
      (not (next-to-assign ?d1))
    )
  )

  (:action place-frankfurt-after-nf
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc frankfurt)
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

  (:action place-frankfurt-after-final
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc frankfurt)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (last-day ?d3)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3))
      (not (placed frankfurt))
    )
    :effect (and
      (at ?d1 frankfurt) (at ?d2 frankfurt) (at ?d3 frankfurt)
      (assigned ?d1) (assigned ?d2) (assigned ?d3)
      (placed frankfurt)
      (not (next-to-assign ?d1))
    )
  )

  ;; -------------------------
  ;; Stuttgart 4-day placements
  ;; -------------------------
  (:action place-stuttgart-start-nf
    :parameters (?d1 - day ?d2 - day ?d3 - day ?d4 - day ?dnext - day)
    :precondition (and
      (next-to-assign ?d1)
      (start-day ?d1)
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

  (:action place-stuttgart-start-final
    :parameters (?d1 - day ?d2 - day ?d3 - day ?d4 - day)
    :precondition (and
      (next-to-assign ?d1)
      (start-day ?d1)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (next ?d3 ?d4)
      (last-day ?d4)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3)) (not (assigned ?d4))
      (not (placed stuttgart))
    )
    :effect (and
      (at ?d1 stuttgart) (at ?d2 stuttgart) (at ?d3 stuttgart) (at ?d4 stuttgart)
      (assigned ?d1) (assigned ?d2) (assigned ?d3) (assigned ?d4)
      (placed stuttgart)
      (not (next-to-assign ?d1))
    )
  )

  (:action place-stuttgart-after-nf
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?d4 - day ?dnext - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc stuttgart)
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

  (:action place-stuttgart-after-final
    :parameters (?pred - day ?d1 - day ?d2 - day ?d3 - day ?d4 - day ?pc - city)
    :precondition (and
      (next-to-assign ?d1)
      (next ?pred ?d1)
      (at ?pred ?pc)
      (flight ?pc stuttgart)
      (next ?d1 ?d2)
      (next ?d2 ?d3)
      (next ?d3 ?d4)
      (last-day ?d4)
      (not (assigned ?d1)) (not (assigned ?d2)) (not (assigned ?d3)) (not (assigned ?d4))
      (not (placed stuttgart))
    )
    :effect (and
      (at ?d1 stuttgart) (at ?d2 stuttgart) (at ?d3 stuttgart) (at ?d4 stuttgart)
      (assigned ?d1) (assigned ?d2) (assigned ?d3) (assigned ?d4)
      (placed stuttgart)
      (not (next-to-assign ?d1))
    )
  )
)