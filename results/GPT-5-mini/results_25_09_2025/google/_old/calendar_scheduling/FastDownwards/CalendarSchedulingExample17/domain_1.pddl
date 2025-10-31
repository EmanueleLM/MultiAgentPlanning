(define (domain meeting-scheduling-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types time)
  (:predicates
    (available_margaret ?t - time)
    (available_donna ?t - time)
    (available_helen ?t - time)
    (within-hours ?t - time)
    (meeting-duration-30)
    (before13_30 ?t - time)
    (meeting-scheduled)
    (scheduled-at ?t - time)
  )

  (:action schedule-margaret
    :parameters (?t - time)
    :precondition (and (available_margaret ?t) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled-at ?t) (not (available_margaret ?t)))
  )

  (:action schedule-donna
    :parameters (?t - time)
    :precondition (and (available_donna ?t) (within-hours ?t) (meeting-duration-30) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled-at ?t) (not (available_donna ?t)))
  )

  (:action schedule-helen
    :parameters (?t - time)
    :precondition (and (available_helen ?t) (before13_30 ?t) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled-at ?t) (not (available_helen ?t)))
  )

  (:action joint-schedule
    :parameters (?t - time)
    :precondition (and
                    (available_margaret ?t)
                    (available_donna ?t)
                    (available_helen ?t)
                    (within-hours ?t)
                    (meeting-duration-30)
                    (before13_30 ?t)
                    (not (meeting-scheduled))
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?t)
              (not (available_margaret ?t))
              (not (available_donna ?t))
              (not (available_helen ?t))
            )
  )
)