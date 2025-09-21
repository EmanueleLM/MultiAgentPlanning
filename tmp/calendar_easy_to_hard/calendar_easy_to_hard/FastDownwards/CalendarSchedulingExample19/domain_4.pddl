(define (domain meeting-scheduling)
  (:requirements :strips :typing :equality)
  (:types person cslot)
  (:predicates
    (free ?p - person ?c - cslot)
    (allowed_start ?c - cslot)
    (scheduled ?c - cslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?c - cslot ?m - person ?j - person ?e - person ?t - person)
    :precondition (and
      (allowed_start ?c)
      (free ?m ?c)
      (free ?j ?c)
      (free ?e ?c)
      (free ?t ?c)
    )
    :effect (and
      (scheduled ?c)
      (meeting_scheduled)
    )
  )
)