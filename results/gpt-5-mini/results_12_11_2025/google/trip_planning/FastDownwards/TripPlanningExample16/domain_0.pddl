(define (domain travel-integration)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ; Day and city identifiers
    (is-d1 ?d - day)
    (is-d2 ?d - day)
    (is-d3 ?d - day)
    (is-d4 ?d - day)
    (is-d5 ?d - day)
    (is-d6 ?d - day)
    (is-d7 ?d - day)
    (is-d8 ?d - day)
    (is-d9 ?d - day)

    (next ?d1 - day ?d2 - day)
    (workshop-day ?d - day)
    (ready ?d - day)
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)

    ; Direct-flight symmetric relation
    (direct ?c1 - city ?c2 - city)

    ; Last-city bookkeeping (mutually exclusive in valid plans)
    (last-is-prague)
    (last-is-vienna)
    (last-is-porto)

    ; Count-predicates encoded as discrete states 0..3 per city
    (count-prague-0) (count-prague-1) (count-prague-2) (count-prague-3)
    (count-vienna-0) (count-vienna-1) (count-vienna-2) (count-vienna-3)
    (count-porto-0)  (count-porto-1)  (count-porto-2)  (count-porto-3)
  )

  ; Day 1: must start in Prague (workshop anchored). This action assigns day1 -> Prague.
  (:action assign-first-prague
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d1 ?d) (is-d2 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (workshop-day ?d)
      (count-prague-0)
    )
    :effect (and
      (not (unassigned ?d)) (assigned ?d prague)
      (not (ready ?d)) (ready ?nd)

      (not (count-prague-0)) (count-prague-1)

      ; set last city to Prague
      (not (last-is-vienna)) (not (last-is-porto)) (last-is-prague)
    )
  )

  ; Day 2 assign Prague from previous Prague
  (:action assign-next-prague-d2
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d2 ?d) (is-d3 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-is-prague)
      (count-prague-1)
    )
    :effect (and
      (not (unassigned ?d)) (assigned ?d prague)
      (not (ready ?d)) (ready ?nd)
      (not (count-prague-1)) (count-prague-2)
      (not (last-is-vienna)) (not (last-is-porto)) (last-is-prague)
    )
  )

  ; Day 3 assign Prague from previous Prague
  (:action assign-next-prague-d3
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d3 ?d) (is-d4 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-is-prague)
      (count-prague-2)
    )
    :effect (and
      (not (unassigned ?d)) (assigned ?d prague)
      (not (ready ?d)) (ready ?nd)
      (not (count-prague-2)) (count-prague-3)
      (not (last-is-vienna)) (not (last-is-porto)) (last-is-prague)
    )
  )

  ; Day 4 assign Vienna from Prague using direct flight Prague->Vienna
  (:action assign-next-vienna-d4
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d4 ?d) (is-d5 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-is-prague)
      (direct prague vienna)
      (count-vienna-0)
    )
    :effect (and
      (not (unassigned ?d)) (assigned ?d vienna)
      (not (ready ?d)) (ready ?nd)
      (not (count-vienna-0)) (count-vienna-1)
      (not (last-is-prague)) (not (last-is-porto)) (last-is-vienna)
    )
  )

  ; Day 5 assign Vienna from Vienna (stay)
  (:action assign-next-vienna-d5
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d5 ?d) (is-d6 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-is-vienna)
      (count-vienna-1)
    )
    :effect (and
      (not (unassigned ?d)) (assigned ?d vienna)
      (not (ready ?d)) (ready ?nd)
      (not (count-vienna-1)) (count-vienna-2)
      (not (last-is-prague)) (not (last-is-porto)) (last-is-vienna)
    )
  )

  ; Day 6 assign Vienna from Vienna (stay)
  (:action assign-next-vienna-d6
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d6 ?d) (is-d7 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-is-vienna)
      (count-vienna-2)
    )
    :effect (and
      (not (unassigned ?d)) (assigned ?d vienna)
      (not (ready ?d)) (ready ?nd)
      (not (count-vienna-2)) (count-vienna-3)
      (not (last-is-prague)) (not (last-is-porto)) (last-is-vienna)
    )
  )

  ; Day 7 assign Porto from Vienna using direct flight Vienna->Porto
  (:action assign-next-porto-d7
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d7 ?d) (is-d8 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-is-vienna)
      (direct vienna porto)
      (count-porto-0)
    )
    :effect (and
      (not (unassigned ?d)) (assigned ?d porto)
      (not (ready ?d)) (ready ?nd)
      (not (count-porto-0)) (count-porto-1)
      (not (last-is-prague)) (not (last-is-vienna)) (last-is-porto)
    )
  )

  ; Day 8 assign Porto from Porto (stay)
  (:action assign-next-porto-d8
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d8 ?d) (is-d9 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-is-porto)
      (count-porto-1)
    )
    :effect (and
      (not (unassigned ?d)) (assigned ?d porto)
      (not (ready ?d)) (ready ?nd)
      (not (count-porto-1)) (count-porto-2)
      (not (last-is-prague)) (not (last-is-vienna)) (last-is-porto)
    )
  )

  ; Day 9 assign Porto from Porto (stay) - terminal assignment
  (:action assign-next-porto-d9
    :parameters (?d - day)
    :precondition (and
      (is-d9 ?d)
      (ready ?d)
      (unassigned ?d)
      (last-is-porto)
      (count-porto-2)
    )
    :effect (and
      (not (unassigned ?d)) (assigned ?d porto)
      (not (ready ?d))
      (not (count-porto-2)) (count-porto-3)
      (not (last-is-prague)) (not (last-is-vienna)) (last-is-porto)
    )
  )
)