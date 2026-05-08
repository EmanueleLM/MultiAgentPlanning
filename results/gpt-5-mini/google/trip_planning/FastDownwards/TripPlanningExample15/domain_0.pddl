(define (domain traveler-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  ;; Predicates
  (:predicates
    ;; successor link between days: (trp-next d1 d2) means d2 is the immediate successor of d1
    (trp-next ?d1 - day ?d2 - day)
    ;; occupancy: (trp-at ?p ?c ?d) means person p is in city c for day d (the day is assigned/occupied)
    (trp-at ?p - person ?c - city ?d - day)
    ;; assigned: marks that occupancy for a specific day has been decided (prevents multiple assignments for same day)
    (trp-assigned ?d - day)
    ;; declared direct flights allowed by specification
    (trp-direct-flight ?c1 - city ?c2 - city)
  )

  ;; Action: remain in the same city from one day to the next.
  ;; Requires that the next day is unassigned; produces occupancy for the next day and marks it assigned.
  (:action trp-stay
    :parameters (?p - person ?c - city ?d - day ?d2 - day)
    :precondition (and
                    (trp-at ?p ?c ?d)
                    (trp-next ?d ?d2)
                    (not (trp-assigned ?d2))
                  )
    :effect (and
              (trp-at ?p ?c ?d2)
              (trp-assigned ?d2)
            )
  )

  ;; Action: fly from one city to another (only allowed when a declared direct flight exists).
  ;; Flight is modeled as occurring between day d and its successor d2, resulting in being at the destination on d2.
  (:action trp-fly
    :parameters (?p - person ?cfrom - city ?cto - city ?d - day ?d2 - day)
    :precondition (and
                    (trp-at ?p ?cfrom ?d)
                    (trp-next ?d ?d2)
                    (trp-direct-flight ?cfrom ?cto)
                    (not (trp-assigned ?d2))
                  )
    :effect (and
              (trp-at ?p ?cto ?d2)
              (trp-assigned ?d2)
            )
  )
)