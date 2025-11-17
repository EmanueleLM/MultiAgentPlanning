(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (available ?p - participant ?s - slot)
    (chosen ?s - slot)
    (scheduled)
  )

  ;; Select the audited recommended slot if and only if all participants are available for it.
  ;; The action requires explicit availability facts for each participant so the solver cannot
  ;; choose a slot that violates the hard availability constraints.
  (:action select_slot
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (slot ?s)
      (participant ?p1) (participant ?p2) (participant ?p3)
      (available ?p1 ?s) (available ?p2 ?s) (available ?p3 ?s)
      (not (chosen ?s))
    )
    :effect (and
      (chosen ?s)
      (scheduled)
    )
  )
)