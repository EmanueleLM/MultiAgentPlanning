(define (domain trip10_eu)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types city day)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (direct ?from - city ?to - city)
    (visited ?c - city)
    (progressed ?d - day)
    (start-selected)
  )
  (:functions (total-cost))
  
  (:action select-start
    :parameters (?c - city)
    :precondition (and
      (not (start-selected))
    )
    :effect (and
      (at d1 ?c)
      (visited ?c)
      (start-selected)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (next ?d ?d2)
      (at ?d ?from)
      (direct ?from ?to)
      (not (progressed ?d))
    )
    :effect (and
      (at ?d2 ?to)
      (visited ?to)
      (progressed ?d)
      (increase (total-cost) 1)
    )
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (next ?d ?d2)
      (at ?d ?c)
      (not (progressed ?d))
    )
    :effect (and
      (at ?d2 ?c)
      (visited ?c)
      (progressed ?d)
      (increase (total-cost) 0)
    )
  )
)