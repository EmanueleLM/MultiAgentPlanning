(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)
    (successor ?t1 - timeslot ?t2 - timeslot)
    (meeting_scheduled)
    (meeting_start ?t - timeslot)
  )

  (:action schedule_meeting
    :parameters (?w - person ?r - person ?n - person ?s - timeslot ?s2 - timeslot)
    :precondition (and
      (successor ?s ?s2)
      (not (meeting_scheduled))
      (free ?w ?s) (free ?w ?s2)
      (free ?r ?s) (free ?r ?s2)
      (free ?n ?s) (free ?n ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?s)
      (not (free ?w ?s)) (not (free ?w ?s2))
      (not (free ?r ?s)) (not (free ?r ?s2))
      (not (free ?n ?s)) (not (free ?n ?s2))
    )
  )
)