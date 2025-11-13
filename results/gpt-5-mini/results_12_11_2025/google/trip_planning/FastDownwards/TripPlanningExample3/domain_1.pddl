(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types city day)
  (:functions (total-cost))
  (:predicates
    (cur ?d - day)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (booked ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
  )

  ;; Stay: book the current day at the current city and advance to the next day
  (:action stay
    :parameters (?d - day ?dnext - day ?c - city)
    :precondition (and (cur ?d) (next ?d ?dnext) (at ?c))
    :effect (and
      (not (cur ?d))
      (cur ?dnext)
      (booked ?d ?c)
      (increase (total-cost) 1)
    )
  )

  ;; Fly: book the current day at the current city, take a direct flight to a neighbor, and advance to the next day
  (:action fly
    :parameters (?d - day ?dnext - day ?c1 - city ?c2 - city)
    :precondition (and
      (cur ?d)
      (next ?d ?dnext)
      (at ?c1)
      (direct ?c1 ?c2)
    )
    :effect (and
      (not (cur ?d))
      (cur ?dnext)
      (booked ?d ?c1)
      (not (at ?c1))
      (at ?c2)
      (increase (total-cost) 1)
    )
  )

  ;; Finalize last day (d6): book day d6 at the current city without advancing
  (:action finalize-last-day
    :parameters (?c - city)
    :precondition (and (cur d6) (at ?c))
    :effect (and
      (booked d6 ?c)
      (not (cur d6))
      (increase (total-cost) 1)
    )
  )
)