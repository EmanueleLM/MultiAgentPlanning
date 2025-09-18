(define (domain integrated-meeting-planning)
  (:requirements :typing :negative-preconditions :universal-preconditions :conditional-effects)
  (:types participant day time duration)

  (:predicates
    (next ?t1 - time ?t2 - time)
    (in-work-hours ?t - time)
    (free ?p - participant ?t - time)
    (free-on ?p - participant ?d - day)
    (known ?p - participant)
    (feasible-exists)
    (feasible-slot ?t - time)
    (slot-on-day ?t - time ?d - day)
    (slot-duration ?t - time ?dur - duration)
    (meeting-scheduled)
    (meeting-at ?t - time)
    (scheduled-day ?d - day)
  )

  (:action schedule_by_agent1
    :parameters (?t - time ?t2 - time ?d - day ?dur - duration)
    :precondition (and
      (next ?t ?t2)
      (in-work-hours ?t)
      (feasible-slot ?t)
      (slot-on-day ?t ?d)
      (slot-duration ?t ?dur)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (scheduled-day ?d)
    )
  )

  (:action schedule_by_agent2_dylan
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (in-work-hours ?t)
      (feasible-exists)
      (free dylan ?t)
      (free dylan ?t2)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
    )
  )

  (:action schedule_by_agent3_known
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (not (meeting-scheduled))
      (forall (?p - participant)
        (or (not (known ?p))
            (and (free ?p ?t) (free ?p ?t2))))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (forall (?p - participant)
        (when (known ?p)
          (and (not (free ?p ?t)) (not (free ?p ?t2)))))
    )
  )
)