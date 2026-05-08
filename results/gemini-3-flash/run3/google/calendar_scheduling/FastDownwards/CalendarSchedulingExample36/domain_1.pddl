(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types
    person
    time
  )
  (:predicates
    (free ?p - person ?t - time)
    (willing_denise ?t - time)
    (next ?t1 ?t2 - time)
    (scheduled)
  )
  (:action schedule_1h_meeting
    :parameters (?ts ?tm ?te - time)
    :precondition (and
      (next ?ts ?tm)
      (next ?tm ?te)
      (free ryan ?ts)
      (free ryan ?tm)
      (free ruth ?ts)
      (free ruth ?tm)
      (free denise ?ts)
      (free denise ?tm)
      (willing_denise ?ts)
      (willing_denise ?tm)
    )
    :effect (scheduled)
  )
)