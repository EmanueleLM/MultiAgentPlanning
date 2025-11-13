(define (domain trip-integration)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)          ; immediate successor relation between days
    (assigned ?d - day)                ; day has been assigned a city
    (at ?d - day ?c - city)            ; day is assigned to city
    (direct-flight ?c1 - city ?c2 - city) ; allowed direct flight between cities (directional fact: include both directions if bidirectional)
  )

  ;; Stay in the same city from one day to the next (no flight)
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

  ;; Fly between directly connected cities between consecutive days
  (:action fly
    :parameters (?prev - day ?d - day ?cprev - city ?c - city)
    :precondition (and
      (next ?prev ?d)
      (at ?prev ?cprev)
      (direct-flight ?cprev ?c)   ; requires a direct flight edge
      (not (at ?prev ?c))         ; ensure this is a change of city (prevents redundant flight to same city)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d ?c)
    )
  )
)