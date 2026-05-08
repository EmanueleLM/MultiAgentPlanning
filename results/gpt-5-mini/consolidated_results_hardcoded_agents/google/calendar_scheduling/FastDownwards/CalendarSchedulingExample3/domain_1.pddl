(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant halfslot slot)

  (:predicates
    ;; object classifications
    (participant ?p - participant)
    (halfslot ?h - halfslot)
    (slot ?s - slot)

    ;; adjacency of half-hour primitives
    (succ ?h1 - halfslot ?h2 - halfslot)

    ;; slot covers which half-hour primitives
    (covers ?s - slot ?h - halfslot)

    ;; slot is within declared work window
    (within_work_window ?s - slot)

    ;; availability: participant free for a given half-hour primitive
    (free ?p - participant ?h - halfslot)

    ;; booking state
    (scheduled ?s - slot)
    (chosen ?s - slot)

    ;; goal-level predicate indicating a meeting was scheduled (generic, not naming a particular slot)
    (meeting_scheduled)
  )

  ;; Action to schedule a slot: requires the slot to be within work window, cover two consecutive halfslots,
  ;; and every participant to be free on both halfslots. Effects mark the slot scheduled/chosen, remove the free facts,
  ;; and assert a generic meeting_scheduled predicate (so the PDDL goal does not need to name the specific slot).
  (:action schedule_slot
    :parameters (?s - slot
                 ?h1 - halfslot ?h2 - halfslot
                 ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (slot ?s)
      (within_work_window ?s)
      (covers ?s ?h1)
      (covers ?s ?h2)
      (succ ?h1 ?h2)

      ;; all three participants free for both half-hour primitives
      (free ?p1 ?h1) (free ?p1 ?h2)
      (free ?p2 ?h1) (free ?p2 ?h2)
      (free ?p3 ?h1) (free ?p3 ?h2)
    )
    :effect (and
      (scheduled ?s)
      (chosen ?s)
      (meeting_scheduled)

      ;; consume the free facts (hard constraint: they become unavailable)
      (not (free ?p1 ?h1)) (not (free ?p1 ?h2))
      (not (free ?p2 ?h1)) (not (free ?p2 ?h2))
      (not (free ?p3 ?h1)) (not (free ?p3 ?h2))
    )
  )
)