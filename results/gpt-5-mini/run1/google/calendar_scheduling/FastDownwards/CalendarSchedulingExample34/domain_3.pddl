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
    :parameters (?p1 ?p2 ?p3 - person ?s ?s2 - timeslot)
    :precondition (and
      (successor ?s ?s2)
      (not (meeting_scheduled))
      (free ?p1 ?s) (free ?p1 ?s2)
      (free ?p2 ?s) (free ?p2 ?s2)
      (free ?p3 ?s) (free ?p3 ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?s)
      (not (free ?p1 ?s)) (not (free ?p1 ?s2))
      (not (free ?p2 ?s)) (not (free ?p2 ?s2))
      (not (free ?p3 ?s)) (not (free ?p3 ?s2))
    )
  )
)