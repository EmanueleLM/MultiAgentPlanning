(define (domain multi_agent_meeting)
  (:requirements :strips)
  (:predicates
    (free ?p ?s)
    (scheduled)
    (meeting_at ?s)
    (unscheduled)
  )

  (:action schedule_by_diane
    :parameters (?s)
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
    :parameters (?s)
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
    :parameters (?s)
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