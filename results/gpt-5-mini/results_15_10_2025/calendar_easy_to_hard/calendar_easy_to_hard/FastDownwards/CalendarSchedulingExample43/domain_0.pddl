(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (unscheduled)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
    (allowed ?s - slot)
  )

  ;; Schedule action: can schedule at a slot only if the slot is allowed
  ;; and every participant is free at that slot, and no meeting is yet scheduled.
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (allowed ?s)
      (free wayne ?s)
      (free edward ?s)
      (free lauren ?s)
      (free helen ?s)
      (free michael ?s)
      (free joseph ?s)
      (free vincent ?s)
    )
    :effect (and
      (not (unscheduled))
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)