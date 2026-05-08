(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants bradley zachary teresa - person)
  (:predicates
    (is_free ?p - person ?s - slot)
    (meeting_booked)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (is_free bradley ?s)
      (is_free zachary ?s)
      (is_free teresa ?s)
    )
    :effect (meeting_booked)
  )
)