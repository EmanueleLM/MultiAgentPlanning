(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person cslot)
  (:predicates
    (free ?p - person ?c - cslot)
    (allowed_start ?c - cslot)
    (scheduled ?c - cslot)
    (global_scheduled)
  )
  (:action schedule_meeting
    :parameters (?c - cslot)
    :precondition (and
      (allowed_start ?c)
      (free marie ?c)
      (free janice ?c)
      (free elijah ?c)
      (free theresa ?c)
    )
    :effect (and
      (scheduled ?c)
      (global_scheduled)
    )
  )
)