(define (domain calendar-scheduling)
  (:requirements :typing :strips :negative-preconditions)
  (:types participant timeslot)
  (:constants p_donna p_john p_billy - participant)

  (:predicates
    (busy ?p - participant ?t - timeslot)
    (within-work ?t - timeslot)
    (scheduled ?t - timeslot)
    (assigned ?p - participant ?t - timeslot)
    (succ ?t1 - timeslot ?t2 - timeslot)
  )

  (:action schedule-meeting-at-slot
    :parameters (?t - timeslot)
    :precondition (and
      (within-work ?t)
      (not (scheduled ?t))
      (not (busy p_donna ?t))
      (not (busy p_john ?t))
      (not (busy p_billy ?t))
    )
    :effect (and
      (scheduled ?t)
      (assigned p_donna ?t)
      (assigned p_john ?t)
      (assigned p_billy ?t)
    )
  )
)