(define (domain jack_of_all_trades_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)
    (successor ?t1 - timeslot ?t2 - timeslot)
    (meeting_scheduled)
    (meeting_start ?t - timeslot)
  )

  (:action schedule_meeting
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (successor ?s ?s2)
      (not (meeting_scheduled))
      (free willie ?s) (free willie ?s2)
      (free richard ?s) (free richard ?s2)
      (free noah ?s) (free noah ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?s)
      (not (free willie ?s)) (not (free willie ?s2))
      (not (free richard ?s)) (not (free richard ?s2))
      (not (free noah ?s)) (not (free noah ?s2))
    )
  )
)