(define (domain trip)
  (:requirements :typing :strips :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)      ; traveler is at city ?c on day ?d (discrete day occupancy)
    (next ?d - day ?dn - day)   ; temporal successor relation between days
    (flight ?c1 - city ?c2 - city) ; allowed direct flight edge
  )

  ;; Stay in the same city from day ?d to the next day ?dn (requires next relation)
  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c ?d) (next ?d ?dn))
    :effect (and (at ?c ?dn) (not (at ?c ?d)))
  )

  ;; Fly from ?from to ?to using a direct flight, departing on day ?d and arriving on the next day ?dn.
  ;; Flight edges are constrained by the flight predicate provided in the problem instance.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and (at ?from ?d) (flight ?from ?to) (next ?d ?dn))
    :effect (and (at ?to ?dn) (not (at ?from ?d)))
  )
)