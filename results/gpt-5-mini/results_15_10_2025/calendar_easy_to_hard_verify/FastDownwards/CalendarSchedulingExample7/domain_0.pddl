(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (available ?p - participant ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Action to schedule the 30-minute meeting at a chosen slot.
  ;; Preconditions require all three participants to be available at that slot
  ;; and that no meeting has already been scheduled.
  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (available heather ?s)
      (available nicholas ?s)
      (available zachary ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (not (available heather ?s))
      (not (available nicholas ?s))
      (not (available zachary ?s))
    )
  )
)