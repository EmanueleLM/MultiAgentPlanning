(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant halfslot slot)

  ;; Declare the specific required participants as domain constants so scheduling
  ;; action can require every named participant (no implicit quantification).
  (:constants Arthur Michael Samantha - participant)

  (:predicates
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
  )

  ;; Action to schedule a slot of duration 60 minutes (two consecutive halfslots).
  ;; This action explicitly requires that each named participant (Arthur, Michael, Samantha)
  ;; is free for both half-hour primitives covered by the slot. Free facts are consumed
  ;; (no slack or post-hoc bookkeeping).
  (:action schedule_slot
    :parameters (?s - slot ?h1 - halfslot ?h2 - halfslot)
    :precondition (and
      (within_work_window ?s)
      (covers ?s ?h1)
      (covers ?s ?h2)
      (succ ?h1 ?h2)

      ;; hard requirement: all required participants free on both half-hour primitives
      (free Arthur ?h1) (free Arthur ?h2)
      (free Michael ?h1) (free Michael ?h2)
      (free Samantha ?h1) (free Samantha ?h2)
    )
    :effect (and
      (scheduled ?s)
      (chosen ?s)

      ;; Consume the free facts so participants are no longer available for those halfslots.
      (not (free Arthur ?h1)) (not (free Arthur ?h2))
      (not (free Michael ?h1)) (not (free Michael ?h2))
      (not (free Samantha ?h1)) (not (free Samantha ?h2))
    )
  )
)