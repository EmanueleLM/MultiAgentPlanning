(define (domain itinerary)
  (:requirements :typing :strips :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)        ; person ?p is in city ?c on day ?d
    (direct ?c1 - city ?c2 - city)            ; there is a direct flight from ?c1 to ?c2
    (next ?d1 - day ?d2 - day)                ; day ordering: next ?d1 ?d2 means d2 is the immediate successor of d1
  )

  ;; stay in same city for next day (consumes one day)
  (:action stay
    :parameters (?p - person ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?p ?c ?d1)) (at ?p ?c ?d2))
  )

  ;; fly from c1 to c2 if there is a direct flight (consumes one day)
  (:action fly
    :parameters (?p - person ?c1 - city ?c2 - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?c1 ?d1) (direct ?c1 ?c2) (next ?d1 ?d2))
    :effect (and (not (at ?p ?c1 ?d1)) (at ?p ?c2 ?d2))
  )
)