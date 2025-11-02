(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types timeslot)
  (:predicates
    (free-arthur ?t - timeslot)
    (free-michael ?t - timeslot)
    (free-samantha ?t - timeslot)
    (consecutive ?t1 ?t2 - timeslot)
    (allowed-start ?t - timeslot)
    (scheduled ?t1 ?t2 - timeslot)
    (meeting-scheduled)
  )

  (:action schedule-meeting
    :parameters (?s1 ?s2 - timeslot)
    :precondition (and
      (allowed-start ?s1)
      (consecutive ?s1 ?s2)
      (free-arthur ?s1) (free-arthur ?s2)
      (free-michael ?s1) (free-michael ?s2)
      (free-samantha ?s1) (free-samantha ?s2)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s1 ?s2)
    )
  )
)