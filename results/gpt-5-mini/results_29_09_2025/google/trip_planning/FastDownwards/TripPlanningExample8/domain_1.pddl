(define (domain itinerary)
  (:requirements :typing :negative-preconditions :conditional-effects :action-costs)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (unassigned ?d - day)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )
  (:functions
    (krakow-days)
    (zurich-days)
    (athens-days)
    (total-flights)
  )

  (:action assign-stay-krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at krakow ?d1) (next ?d1 ?d2) (unassigned ?d2))
    :effect (and
      (not (unassigned ?d2))
      (at krakow ?d2)
      (increase (krakow-days) 1)
    )
  )

  (:action assign-stay-zurich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at zurich ?d1) (next ?d1 ?d2) (unassigned ?d2))
    :effect (and
      (not (unassigned ?d2))
      (at zurich ?d2)
      (increase (zurich-days) 1)
    )
  )

  (:action assign-stay-athens
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at athens ?d1) (next ?d1 ?d2) (unassigned ?d2))
    :effect (and
      (not (unassigned ?d2))
      (at athens ?d2)
      (increase (athens-days) 1)
    )
  )

  (:action assign-fly-to-krakow
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (unassigned ?d2) (flight ?from krakow))
    :effect (and
      (not (unassigned ?d2))
      (at krakow ?d2)
      (increase (krakow-days) 1)
      (increase (total-flights) 1)
    )
  )

  (:action assign-fly-to-zurich
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (unassigned ?d2) (flight ?from zurich))
    :effect (and
      (not (unassigned ?d2))
      (at zurich ?d2)
      (increase (zurich-days) 1)
      (increase (total-flights) 1)
    )
  )

  (:action assign-fly-to-athens
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (unassigned ?d2) (flight ?from athens))
    :effect (and
      (not (unassigned ?d2))
      (at athens ?d2)
      (increase (athens-days) 1)
      (increase (total-flights) 1)
    )
  )
)