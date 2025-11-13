(define (domain calendar_scheduling_example27)
  (:requirements :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (free ?p - participant ?t - timeslot)
    (workhour ?t - timeslot)
    (next ?t1 - timeslot ?t2 - timeslot)
    (all-free ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
  )
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (workhour ?t)
      (all-free ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
    )
  )
)