(define (domain travel-integration)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ;; Day identity markers (one predicate per day object)
    (is-d1 ?d - day)
    (is-d2 ?d - day)
    (is-d3 ?d - day)
    (is-d4 ?d - day)
    (is-d5 ?d - day)
    (is-d6 ?d - day)
    (is-d7 ?d - day)
    (is-d8 ?d - day)
    (is-d9 ?d - day)

    ;; Temporal successor relation between consecutive days
    (next ?d1 - day ?d2 - day)

    ;; Workshop anchoring predicates (used only in preconditions)
    (workshop-day ?d - day)

    ;; Sequencing and assignment control
    (ready ?d - day)
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)

    ;; Direct flights (symmetric edges will be provided in problem)
    (direct ?c1 - city ?c2 - city)

    ;; Last-city bookkeeping (one of these should hold to represent last day's city)
    (last-prague)
    (last-vienna)
    (last-porto)

    ;; Discrete counts for each city (0..3)
    (count-prague-0) (count-prague-1) (count-prague-2) (count-prague-3)
    (count-vienna-0) (count-vienna-1) (count-vienna-2) (count-vienna-3)
    (count-porto-0)  (count-porto-1)  (count-porto-2)  (count-porto-3)
  )

  ;; Day 1 must be assigned to Prague due to workshop anchoring.
  ;; The pattern below enforces sequential assignment: ready d1 ... ready dn.
  ;; Each action assigns a specific day to a specific city, updates the "last-*" flags,
  ;; and increments the corresponding city's discrete count (0->1->2->3).
  ;; Actions are written explicitly per day and city transition to ensure contiguous occupancy
  ;; and to forbid oscillating transitions that would violate direct-flight constraints.

  ;; Assign Day 1 -> Prague (workshop)
  (:action assign-d1-prague
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d1 ?d)
      (is-d2 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (workshop-day ?d)
      (count-prague-0)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d prague)
      (not (ready ?d))
      (ready ?nd)
      (not (count-prague-0))
      (count-prague-1)
      (not (last-vienna))
      (not (last-porto))
      (last-prague)
    )
  )

  ;; Assign Day 2 -> Prague (contiguous workshop day)
  (:action assign-d2-prague
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d2 ?d)
      (is-d3 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-prague)
      (count-prague-1)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d prague)
      (not (ready ?d))
      (ready ?nd)
      (not (count-prague-1))
      (count-prague-2)
      (not (last-vienna))
      (not (last-porto))
      (last-prague)
    )
  )

  ;; Assign Day 3 -> Prague (contiguous workshop day)
  (:action assign-d3-prague
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d3 ?d)
      (is-d4 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-prague)
      (count-prague-2)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d prague)
      (not (ready ?d))
      (ready ?nd)
      (not (count-prague-2))
      (count-prague-3)
      (not (last-vienna))
      (not (last-porto))
      (last-prague)
    )
  )

  ;; Day 4: allowed transitions from last-prague -> stay/prague (only if prague count <3)
  ;; But since count-prague is already 3 after day3, no further Prague assignments are possible.
  ;; The feasible assignment is Vienna via direct prague->vienna.
  (:action assign-d4-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d4 ?d)
      (is-d5 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-prague)
      (direct prague vienna)
      (count-vienna-0)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d vienna)
      (not (ready ?d))
      (ready ?nd)
      (not (count-vienna-0))
      (count-vienna-1)
      (not (last-prague))
      (not (last-porto))
      (last-vienna)
    )
  )

  ;; Day 5: stay Vienna
  (:action assign-d5-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d5 ?d)
      (is-d6 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-vienna)
      (count-vienna-1)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d vienna)
      (not (ready ?d))
      (ready ?nd)
      (not (count-vienna-1))
      (count-vienna-2)
      (not (last-prague))
      (not (last-porto))
      (last-vienna)
    )
  )

  ;; Day 6: stay Vienna
  (:action assign-d6-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d6 ?d)
      (is-d7 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-vienna)
      (count-vienna-2)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d vienna)
      (not (ready ?d))
      (ready ?nd)
      (not (count-vienna-2))
      (count-vienna-3)
      (not (last-prague))
      (not (last-porto))
      (last-vienna)
    )
  )

  ;; Day 7: transition Vienna -> Porto (direct flight required)
  (:action assign-d7-porto
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d7 ?d)
      (is-d8 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-vienna)
      (direct vienna porto)
      (count-porto-0)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d porto)
      (not (ready ?d))
      (ready ?nd)
      (not (count-porto-0))
      (count-porto-1)
      (not (last-prague))
      (not (last-vienna))
      (last-porto)
    )
  )

  ;; Day 8: stay Porto
  (:action assign-d8-porto
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d8 ?d)
      (is-d9 ?nd)
      (next ?d ?nd)
      (ready ?d)
      (unassigned ?d)
      (last-porto)
      (count-porto-1)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d porto)
      (not (ready ?d))
      (ready ?nd)
      (not (count-porto-1))
      (count-porto-2)
      (not (last-prague))
      (not (last-vienna))
      (last-porto)
    )
  )

  ;; Day 9: final day Porto (no next day to enable)
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
      (assigned ?d porto)
      (not (ready ?d))
      (not (count-porto-2))
      (count-porto-3)
      (not (last-prague))
      (not (last-vienna))
      (last-porto)
    )
  )
)