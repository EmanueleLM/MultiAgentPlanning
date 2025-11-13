(define (domain travel-integration)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ; day identity markers to bind actions to specific positions
    (is-d1 ?d - day) (is-d2 ?d - day) (is-d3 ?d - day)
    (is-d4 ?d - day) (is-d5 ?d - day) (is-d6 ?d - day)
    (is-d7 ?d - day) (is-d8 ?d - day) (is-d9 ?d - day)

    ; temporal successor relation (strict ordering)
    (next ?d1 - day ?d2 - day)

    ; workshop requirement on days 1-3
    (workshop-day ?d - day)

    ; sequential assignment control
    (ready ?d - day)
    (unassigned ?d - day)

    ; occupancy: which city a day is assigned to
    (at ?d - day ?c - city)

    ; direct flight adjacency (symmetric edges provided in problem)
    (direct ?c1 - city ?c2 - city)

    ; last-city marker to represent current (most recently assigned) city
    (last-prague)
    (last-vienna)
    (last-porto)

    ; explicit integer counts encoded as mutually exclusive predicates
    (count-prague-0) (count-prague-1) (count-prague-2) (count-prague-3)
    (count-vienna-0) (count-vienna-1) (count-vienna-2) (count-vienna-3)
    (count-porto-0)  (count-porto-1)  (count-porto-2)  (count-porto-3)
  )

  ; ----- Actions: assign each day in strict sequence -----
  ; Day 1 must be Prague (workshop). It consumes count-prague-0 -> count-prague-1
  (:action assign-d1-prague
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d1 ?d) (is-d2 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (workshop-day ?d)
      (count-prague-0)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d prague)
      (not (ready ?d))
      (ready ?nd)
      (not (count-prague-0))
      (count-prague-1)
      (not (last-vienna))
      (not (last-porto))
      (last-prague)
    )
  )

  ; Day 2 must be Prague (workshop). Requires last-prague and increments count.
  (:action assign-d2-prague
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d2 ?d) (is-d3 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (workshop-day ?d)
      (last-prague)
      (count-prague-1)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d prague)
      (not (ready ?d))
      (ready ?nd)
      (not (count-prague-1))
      (count-prague-2)
      (not (last-vienna))
      (not (last-porto))
      (last-prague)
    )
  )

  ; Day 3 must be Prague (workshop). Requires last-prague and increments count.
  (:action assign-d3-prague
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d3 ?d) (is-d4 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (workshop-day ?d)
      (last-prague)
      (count-prague-2)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d prague)
      (not (ready ?d))
      (ready ?nd)
      (not (count-prague-2))
      (count-prague-3)
      (not (last-vienna))
      (not (last-porto))
      (last-prague)
    )
  )

  ; Day 4: must transition from Prague to Vienna (direct edge required).
  (:action assign-d4-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d4 ?d) (is-d5 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (last-prague)
      (direct prague vienna)
      (count-vienna-0)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d vienna)
      (not (ready ?d))
      (ready ?nd)
      (not (count-vienna-0))
      (count-vienna-1)
      (not (last-prague))
      (not (last-porto))
      (last-vienna)
    )
  )

  ; Day 5: Vienna (stay), requires last-vienna and increments count.
  (:action assign-d5-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d5 ?d) (is-d6 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (last-vienna)
      (count-vienna-1)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d vienna)
      (not (ready ?d))
      (ready ?nd)
      (not (count-vienna-1))
      (count-vienna-2)
      (not (last-prague))
      (not (last-porto))
      (last-vienna)
    )
  )

  ; Day 6: Vienna (stay), requires last-vienna and increments count to 3.
  (:action assign-d6-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d6 ?d) (is-d7 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (last-vienna)
      (count-vienna-2)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d vienna)
      (not (ready ?d))
      (ready ?nd)
      (not (count-vienna-2))
      (count-vienna-3)
      (not (last-prague))
      (not (last-porto))
      (last-vienna)
    )
  )

  ; Day 7: must transition from Vienna to Porto (direct edge required).
  (:action assign-d7-porto
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d7 ?d) (is-d8 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (last-vienna)
      (direct vienna porto)
      (count-porto-0)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d porto)
      (not (ready ?d))
      (ready ?nd)
      (not (count-porto-0))
      (count-porto-1)
      (not (last-prague))
      (not (last-vienna))
      (last-porto)
    )
  )

  ; Day 8: Porto (stay), requires last-porto and increments count.
  (:action assign-d8-porto
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d8 ?d) (is-d9 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (last-porto)
      (count-porto-1)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d porto)
      (not (ready ?d))
      (ready ?nd)
      (not (count-porto-1))
      (count-porto-2)
      (not (last-prague))
      (not (last-vienna))
      (last-porto)
    )
  )

  ; Day 9: Porto final day, requires last-porto and increments count to 3.
  (:action assign-d9-porto
    :parameters (?d - day)
    :precondition (and
      (is-d9 ?d)
      (ready ?d)
      (unassigned ?d)
      (last-porto)
      (count-porto-2)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d porto)
      (not (ready ?d))
      (not (count-porto-2))
      (count-porto-3)
      (not (last-prague))
      (not (last-vienna))
      (last-porto)
    )
  )
)