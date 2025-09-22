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
    :parameters (?c - cslot ?marie - person ?janice - person ?elijah - person ?theresa - person)
    :precondition (and
      (allowed_start ?c)
      (free ?marie ?c)
      (free ?janice ?c)
      (free ?elijah ?c)
      (free ?theresa ?c)
    )
    :effect (and
      (scheduled ?c)
      (meeting_scheduled)
    )
  )
)