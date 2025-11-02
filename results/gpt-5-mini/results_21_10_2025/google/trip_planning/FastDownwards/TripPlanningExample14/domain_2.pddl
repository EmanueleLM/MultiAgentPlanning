(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)                 ; traveler is at city ?c on day ?d
    (next ?d1 - day ?d2 - day)             ; immediate successor day relation
    (direct-flight ?from - city ?to - city) ; direct flight link exists
    (used ?d - day)                        ; day ?d has been assigned to a city
  )

  ;; Travel on a direct flight: requires being at the origin on day ?d1, the next day ?d2 unused,
  ;; and a direct flight link. Produces presence at destination on day ?d2 and marks that day used.
  (:action travel
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct-flight ?from ?to) (not (used ?d2)))
    :effect (and (at ?to ?d2) (used ?d2))
  )

  ;; Stay in the same city for one day: requires being at the city on day ?d1 and next day ?d2 unused.
  ;; Produces presence in the same city on day ?d2 and marks that day used.
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (not (used ?d2)))
    :effect (and (at ?c ?d2) (used ?d2))
  )
)