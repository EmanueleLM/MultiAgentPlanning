(define (domain multi_agent_meeting)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (scheduled)
    (meeting_at ?s - slot)
    (unscheduled)
  )

  (:action schedule_by_diane
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled)
      (meeting_at ?s)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
      (not (unscheduled))
    )
  )

  (:action schedule_by_kelly
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled)
      (meeting_at ?s)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
      (not (unscheduled))
    )
  )

  (:action schedule_by_deborah
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled)
      (meeting_at ?s)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
      (not (unscheduled))
    )
  )
)