(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:constants madison diana shirley - person)
  (:predicates
    (busy ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )

  ;; Action to schedule a one-hour meeting (two consecutive 30-minute slots)
  ;; where all required participants are free in both slots.
  (:action schedule_1hr_meeting
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (not (busy madison ?s1))
      (not (busy madison ?s2))
      (not (busy diana ?s1))
      (not (busy diana ?s2))
      (not (busy shirley ?s1))
      (not (busy shirley ?s2))
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)