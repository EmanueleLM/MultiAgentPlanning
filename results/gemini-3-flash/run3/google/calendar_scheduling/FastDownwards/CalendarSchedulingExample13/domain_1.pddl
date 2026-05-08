(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person timeslot)
  (:constants
    gerald roy barbara - person
  )
  (:predicates
    (free ?p - person ?t - timeslot)
    (is_preferred ?t - timeslot)
    (appointment_scheduled)
  )
  (:functions
    (total-cost)
  )
  (:action schedule_at_preferred_time
    :parameters (?t - timeslot)
    :precondition (and
      (not (appointment_scheduled))
      (is_preferred ?t)
      (free gerald ?t)
      (free roy ?t)
      (free barbara ?t)
    )
    :effect (and
      (appointment_scheduled)
      (increase (total-cost) 1)
    )
  )
  (:action schedule_at_regular_time
    :parameters (?t - timeslot)
    :precondition (and
      (not (appointment_scheduled))
      (not (is_preferred ?t))
      (free gerald ?t)
      (free roy ?t)
      (free barbara ?t)
    )
    :effect (and
      (appointment_scheduled)
      (increase (total-cost) 10)
    )
  )
)