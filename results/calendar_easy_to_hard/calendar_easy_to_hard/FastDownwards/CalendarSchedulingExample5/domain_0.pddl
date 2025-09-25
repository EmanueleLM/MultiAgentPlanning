(define (domain multi-agent-meeting)
  (:requirements :strips :typing)
  (:types person time)

  (:predicates
    (available ?p - person ?t - time)
    (scheduled)
    (unscheduled)
    (meeting-at ?t - time)
  )

  ;; Three distinct scheduling actions (one per agent). Each may schedule the meeting
  ;; for a given 30-minute start time only if all participants are available at that time
  ;; and the meeting has not yet been scheduled.
  (:action schedule_by_kathryn
    :parameters (?t - time)
    :precondition (and
      (unscheduled)
      (available kathryn ?t)
      (available charlotte ?t)
      (available lauren ?t)
    )
    :effect (and
      (scheduled)
      (meeting-at ?t)
      (not (unscheduled))
    )
  )

  (:action schedule_by_charlotte
    :parameters (?t - time)
    :precondition (and
      (unscheduled)
      (available kathryn ?t)
      (available charlotte ?t)
      (available lauren ?t)
    )
    :effect (and
      (scheduled)
      (meeting-at ?t)
      (not (unscheduled))
    )
  )

  (:action schedule_by_lauren
    :parameters (?t - time)
    :precondition (and
      (unscheduled)
      (available kathryn ?t)
      (available charlotte ?t)
      (available lauren ?t)
    )
    :effect (and
      (scheduled)
      (meeting-at ?t)
      (not (unscheduled))
    )
  )
)