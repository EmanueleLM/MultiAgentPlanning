(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:constants
    stephen edward angela - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (not (meeting_scheduled))
      (free stephen ?s) (free stephen ?s2)
      (free edward  ?s) (free edward  ?s2)
      (free angela  ?s) (free angela  ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )
)