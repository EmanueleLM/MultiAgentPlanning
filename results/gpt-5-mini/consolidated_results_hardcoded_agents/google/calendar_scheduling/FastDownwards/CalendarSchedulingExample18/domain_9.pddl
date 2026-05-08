(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)
    (candidate ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
    (work-slot ?t - timeslot)
    (slot-next ?t1 - timeslot ?t2 - timeslot)
  )

  (:action schedule-meeting
    :parameters (?t - timeslot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (candidate ?t)
      (work-slot ?t)
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
      (not (free ?p1 ?t))
      (not (free ?p2 ?t))
      (not (free ?p3 ?t))
      (not (candidate ?t))
    )
  )
)