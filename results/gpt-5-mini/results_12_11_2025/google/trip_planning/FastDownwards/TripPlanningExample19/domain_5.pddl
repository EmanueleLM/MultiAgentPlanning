(define (domain TripDomain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (assigned ?d - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
  )

  ;; Assign the first day to a city (only if not already assigned)
  (:action assign-first
    :parameters (?d - day ?c - city)
    :precondition (and (first ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (at ?d ?c))
  )

  ;; Assign the next day when staying in the same city (no direct edge required).
  (:action assign-next-stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (next ?d1 ?d2) (at ?d1 ?c) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 ?c))
  )

  ;; Assign the next day when taking a direct flight (stored as direct ?c1 ?c2).
  ;; This action covers transitions where the stored direction matches source->dest.
  (:action assign-next-edge-forward
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city)
    :precondition (and (next ?d1 ?d2) (at ?d1 ?c1) (direct ?c1 ?c2) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 ?c2))
  )

  ;; Assign the next day when taking a direct flight in the opposite logical direction.
  ;; Using the same stored predicate (direct ?cA ?cB) this action allows using that fact
  ;; to support the reverse travel (from ?c1 to ?c2) when the stored orientation is ?c2->?c1.
  (:action assign-next-edge-reverse
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city)
    :precondition (and (next ?d1 ?d2) (at ?d1 ?c1) (direct ?c2 ?c1) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 ?c2))
  )
)