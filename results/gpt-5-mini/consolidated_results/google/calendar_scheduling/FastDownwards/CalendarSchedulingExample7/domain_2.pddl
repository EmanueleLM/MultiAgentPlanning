(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types timeslot participant)

  (:predicates
    (free_heather ?t - timeslot)
    (free_nicholas ?t - timeslot)
    (free_zachary ?t - timeslot)
    (choosable ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting_scheduled)
    (in_workday ?t - timeslot)
    (next ?t1 - timeslot ?t2 - timeslot)
  )

  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (in_workday ?t)
      (free_heather ?t)
      (free_nicholas ?t)
      (free_zachary ?t)
      (choosable ?t)
      (not (meeting_scheduled))
    )
    :effect (and
      (scheduled ?t)
      (meeting_scheduled)
      (not (choosable ?t))
    )
  )
)