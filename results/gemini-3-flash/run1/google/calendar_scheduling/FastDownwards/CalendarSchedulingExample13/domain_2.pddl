(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types participant slot)
  (:constants
    gerald roy barbara - participant
  )
  (:predicates
    (free ?p - participant ?s - slot)
    (is_before_1300 ?s - slot)
    (meeting_scheduled)
  )
  (:functions
    (total-cost)
  )
  (:action schedule_meeting_preferred
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (not (is_before_1300 ?s))
      (free gerald ?s)
      (free roy ?s)
      (free barbara ?s)
    )
    :effect (and
      (meeting_scheduled)
      (increase (total-cost) 1)
    )
  )
  (:action schedule_meeting_avoided
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (is_before_1300 ?s)
      (free gerald ?s)
      (free roy ?s)
      (free barbara ?s)
    )
    :effect (and
      (meeting_scheduled)
      (increase (total-cost) 10)
    )
  )
)