(define (domain calendar_scheduling_example2)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  ;; Instance-specific constants: the three participants
  (:constants roy kathryn amy - person)

  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (available ?p - person ?s - slot)
    (meeting_scheduled)
    (meeting_at ?s - slot)
    (discouraged ?s - slot) ;; marker for Amy's time preference (informational only)
  )

  ;; Schedule a single 30-minute meeting at a chosen slot.
  ;; Precondition: no meeting already scheduled and each participant is available at the slot.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (available roy ?s)
      (available kathryn ?s)
      (available amy ?s)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?s)
    )
  )
)