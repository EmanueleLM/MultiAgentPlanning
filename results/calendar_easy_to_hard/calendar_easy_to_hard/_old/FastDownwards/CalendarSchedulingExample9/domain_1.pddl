(define (domain meeting-scheduling-integrated)
  (:requirements :typing :negative-preconditions)
  (:types person timeslot meeting)

  (:predicates
    (free ?p - person ?t - timeslot)
    (within-work-hours ?t - timeslot)
    (meeting-exists ?m - meeting)
    (scheduled ?m - meeting)
    (scheduled-for ?p - person ?t - timeslot)
    (meeting-scheduled ?t - timeslot)
    (meeting-at ?t - timeslot)
    (meeting-confirmed)
  )

  (:action agent1-schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (free dianekelly ?t)
      (free deborah ?t)
      (not (meeting-confirmed))
    )
    :effect (and
      (meeting-at ?t)
      (meeting-confirmed)
    )
  )

  (:action agent2-schedule
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting-exists ?m)
      (not (scheduled ?m))
      (free dianekelly ?t)
      (free deborah ?t)
    )
    :effect (and
      (scheduled ?m)
      (meeting-confirmed)
    )
  )

  (:action agent3-schedule
    :parameters (?p1 - person ?p2 - person ?t - timeslot)
    :precondition (and
      (free ?p1 ?t)
      (free ?p2 ?t)
      (within-work-hours ?t)
    )
    :effect (and
      (scheduled-for ?p1 ?t)
      (scheduled-for ?p2 ?t)
      (meeting-scheduled ?t)
      (not (free ?p1 ?t))
      (not (free ?p2 ?t))
    )
  )

  (:action agent3-declare-meeting-diane-deborah
    :parameters (?t - timeslot)
    :precondition (and
      (scheduled-for dianekelly ?t)
      (scheduled-for deborah ?t)
    )
    :effect (meeting-confirmed)
  )
)