(define (domain meeting_scheduler)
  (:requirements :strips :typing)
  (:types person time)
  (:constants
    michelle steven jerry - person
  )
  (:predicates
    (next ?t1 ?t2 - time)
    (free ?p - person ?t1 ?t2 - time)
    (meeting_scheduled)
  )
  (:action schedule_one_hour_meeting
    :parameters (?ts ?tm ?te - time)
    :precondition (and
      (next ?ts ?tm)
      (next ?tm ?te)
      (free michelle ?ts ?tm)
      (free michelle ?tm ?te)
      (free steven ?ts ?tm)
      (free steven ?tm ?te)
      (free jerry ?ts ?tm)
      (free jerry ?tm ?te)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)