(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:constants
    madison diana shirley - person
  )

  (:predicates
    (busy ?p - person ?s - slot)       ; true when participant is busy in a slot
    (next ?s1 - slot ?s2 - slot)
    (meeting_scheduled)
  )

  (:action schedule-meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (not (meeting_scheduled))
      (not (busy madison ?s1)) (not (busy madison ?s2))
      (not (busy diana   ?s1)) (not (busy diana   ?s2))
      (not (busy shirley ?s1)) (not (busy shirley ?s2))
    )
    :effect (and
      (meeting_scheduled)
      (busy madison ?s1) (busy madison ?s2)
      (busy diana   ?s1) (busy diana   ?s2)
      (busy shirley ?s1) (busy shirley ?s2)
    )
  )
)