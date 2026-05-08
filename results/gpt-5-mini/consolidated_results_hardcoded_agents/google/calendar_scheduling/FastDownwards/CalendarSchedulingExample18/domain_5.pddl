(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)                ; participant p is free at timeslot t
    (candidate ?t - timeslot)                       ; timeslot t is an audited candidate to schedule
    (scheduled ?t - timeslot)                       ; meeting has been scheduled at timeslot t
    (meeting-scheduled)                             ; a meeting has been scheduled (enforces at-most-one)
    (work-slot ?t - timeslot)                       ; timeslot t lies within declared work hours
    (slot-next ?t1 - timeslot ?t2 - timeslot)       ; immediate successor relation between adjacent slots
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
    )
  )
)