(define (domain TripPlanningExample23)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)                ; traveler is in city ?c on day ?d
    (next ?d1 - day ?d2 - day)            ; temporal successor relation: ?d2 is the day after ?d1
    (workshop-allowed ?d - day)           ; workshop may be held on this day
    (attended-workshop)                   ; workshop has been attended
  )

  ;; Staying actions (one action per city to allow explicit negative preconditions
  ;; enumerating the other cities so that at most one city can be set for a given day)
  (:action stay-in-london
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at london ?d1)
      (next ?d1 ?d2)
      (not (at bucharest ?d2))
      (not (at riga ?d2))
    )
    :effect (and
      (at london ?d2)
    )
  )

  (:action stay-in-bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at bucharest ?d1)
      (next ?d1 ?d2)
      (not (at london ?d2))
      (not (at riga ?d2))
    )
    :effect (and
      (at bucharest ?d2)
    )
  )

  (:action stay-in-riga
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next ?d1 ?d2)
      (not (at london ?d2))
      (not (at bucharest ?d2))
    )
    :effect (and
      (at riga ?d2)
    )
  )

  ;; Direct flight actions (only allowed connections are encoded)
  (:action fly-london-to-bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at london ?d1)
      (next ?d1 ?d2)
      ;; ensure no city already assigned to that arrival day
      (not (at london ?d2))
      (not (at bucharest ?d2))
      (not (at riga ?d2))
    )
    :effect (and
      (at bucharest ?d2)
    )
  )

  (:action fly-bucharest-to-london
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at bucharest ?d1)
      (next ?d1 ?d2)
      (not (at london ?d2))
      (not (at bucharest ?d2))
      (not (at riga ?d2))
    )
    :effect (and
      (at london ?d2)
    )
  )

  (:action fly-bucharest-to-riga
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at bucharest ?d1)
      (next ?d1 ?d2)
      (not (at london ?d2))
      (not (at bucharest ?d2))
      (not (at riga ?d2))
    )
    :effect (and
      (at riga ?d2)
    )
  )

  (:action fly-riga-to-bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next ?d1 ?d2)
      (not (at london ?d2))
      (not (at bucharest ?d2))
      (not (at riga ?d2))
    )
    :effect (and
      (at bucharest ?d2)
    )
  )

  ;; Attend the Riga workshop on an allowed Riga day (only once needed)
  (:action attend-workshop
    :parameters (?d - day)
    :precondition (and
      (at riga ?d)
      (workshop-allowed ?d)
      (not (attended-workshop))
    )
    :effect (and
      (attended-workshop)
    )
  )
)