(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant halfslot slot)

  (:predicates
    ;; object classification (also present as facts in the problem)
    (participant ?p - participant)
    (halfslot ?h - halfslot)
    (slot ?s - slot)

    ;; temporal contiguity between half-hour primitives
    (succ ?h1 - halfslot ?h2 - halfslot)

    ;; mapping of a candidate meeting slot to the half-hour primitives it covers
    (covers ?s - slot ?h - halfslot)

    ;; slot-level constraints
    (within_work_window ?s - slot)

    ;; availability: participant free for a specific half-hour primitive
    (free ?p - participant ?h - halfslot)

    ;; booking state for a candidate slot
    (scheduled ?s - slot)
    (chosen ?s - slot)
  )

  ;; Action: schedule_slot
  ;; Succeeds only if the candidate slot is within the work window, covers two consecutive half-hour primitives,
  ;; and every listed participant is free for every half-hour primitive covered by the slot.
  (:action schedule_slot
    :parameters (?s - slot
                 ?h1 - halfslot ?h2 - halfslot
                 ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (slot ?s)
      (within_work_window ?s)
      ;; ensure the slot covers exactly these two contiguous half-hour primitives
      (covers ?s ?h1)
      (covers ?s ?h2)
      (succ ?h1 ?h2)

      ;; all three participants must be free for both half-hour primitives
      (free ?p1 ?h1) (free ?p1 ?h2)
      (free ?p2 ?h1) (free ?p2 ?h2)
      (free ?p3 ?h1) (free ?p3 ?h2)
    )
    :effect (and
      ;; mark the slot as scheduled and chosen (these are the required terminal conditions)
      (scheduled ?s)
      (chosen ?s)

      ;; consume the free facts for the covered half-hour primitives for these participants
      (not (free ?p1 ?h1)) (not (free ?p1 ?h2))
      (not (free ?p2 ?h1)) (not (free ?p2 ?h2))
      (not (free ?p3 ?h1)) (not (free ?p3 ?h2))
    )
  )
)