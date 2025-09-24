(define (domain meeting-scheduling-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types time)
  (:predicates
    (available_margaret ?t - time)
    (available_donna ?t - time)
    (available_helen ?t - time)
    (within_hours ?t - time)
    (meeting_duration_30)
    (not_after_13_30 ?t - time)
    (meeting_scheduled)
    (scheduled_at ?t - time)
    (proposed_margaret ?t - time)
    (proposed_donna ?t - time)
    (proposed_helen ?t - time)
  )

  (:action propose-margaret
    :parameters (?t - time)
    :precondition (and (available_margaret ?t) (within_hours ?t) (meeting_duration_30) (not (meeting_scheduled)))
    :effect (and (proposed_margaret ?t))
  )

  (:action propose-donna
    :parameters (?t - time)
    :precondition (and (available_donna ?t) (within_hours ?t) (meeting_duration_30) (not (meeting_scheduled)))
    :effect (and (proposed_donna ?t))
  )

  (:action propose-helen
    :parameters (?t - time)
    :precondition (and (available_helen ?t) (within_hours ?t) (meeting_duration_30) (not (meeting_scheduled)) (not_after_13_30 ?t))
    :effect (and (proposed_helen ?t))
  )

  (:action finalize-meeting
    :parameters (?t - time)
    :precondition (and
                    (proposed_margaret ?t)
                    (proposed_donna ?t)
                    (proposed_helen ?t)
                    (available_margaret ?t)
                    (available_donna ?t)
                    (available_helen ?t)
                    (within_hours ?t)
                    (meeting_duration_30)
                    (not_after_13_30 ?t)
                    (not (meeting_scheduled))
                  )
    :effect (and
              (meeting_scheduled)
              (scheduled_at ?t)
              (not (available_margaret ?t))
              (not (available_donna ?t))
              (not (available_helen ?t))
            )
  )
)