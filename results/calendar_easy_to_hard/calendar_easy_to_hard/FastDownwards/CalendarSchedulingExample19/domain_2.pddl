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
    :parameters (?c - cslot ?p1 - person ?p2 - person ?p3 - person ?p4 - person)
    :precondition (and
      (allowed_start ?c)
      (free ?p1 ?c)
      (free ?p2 ?c)
      (free ?p3 ?c)
      (free ?p4 ?c)
    )
    :effect (and
      (scheduled ?c)
      (global_scheduled)
    )
  )
)