(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (is_free ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )

  ;; Action to schedule a 1-hour meeting spanning two consecutive 30-minute slots.
  ;; The meeting can only be scheduled if all participants are free in both slots.
  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (is_free julie ?s1)
      (is_free julie ?s2)
      (is_free sean ?s1)
      (is_free sean ?s2)
      (is_free lori ?s1)
      (is_free lori ?s2)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)