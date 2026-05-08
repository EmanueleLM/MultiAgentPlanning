(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (is_early ?s - slot)
    (meeting_scheduled)
    (scheduled ?s - slot)
  )
  (:functions
    (total-cost)
  )
  (:action schedule_meeting_early
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (is_early ?s)
      (free gerald ?s)
      (free roy ?s)
      (free barbara ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?s)
      (increase (total-cost) 10)
    )
  )
  (:action schedule_meeting_late
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (not (is_early ?s))
      (free gerald ?s)
      (free roy ?s)
      (free barbara ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?s)
      (increase (total-cost) 1)
    )
  )
)