(define (domain trip-integration)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)            ; immediate successor relation between days
    (assigned ?d - day)                   ; day has been assigned a city (prevents reassignment)
    (at ?d - day ?c - city)               ; day is assigned to a specific city
    (direct-flight ?c1 - city ?c2 - city) ; allowed direct flight (directional)
    (mandatory ?d - day ?c - city)        ; explicit mandatory assignment window facts (for visibility)
  )

  ;; Stay in the same city from one day to the next (no flight).
  ;; Requires the previous day to be already assigned to the same city and the next day unassigned.
  (:action stay
    :parameters (?prev - day ?d - day ?c - city)
    :precondition (and
      (next ?prev ?d)
      (at ?prev ?c)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d ?c)
    )
  )

  ;; Fly between directly connected cities between consecutive days.
  ;; Requires the previous day to be already assigned to the departure city,
  ;; a declared direct flight between the cities, and the next day unassigned.
  (:action fly
    :parameters (?prev - day ?d - day ?cprev - city ?c - city)
    :precondition (and
      (next ?prev ?d)
      (at ?prev ?cprev)
      (direct-flight ?cprev ?c)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d ?c)
    )
  )
)