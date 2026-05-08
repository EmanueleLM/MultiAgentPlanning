(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types participant time_slot event)

  (:predicates
    (available ?p - participant ?t - time_slot)
    (scheduled ?e - event ?t - time_slot)
    (conflicts_with ?p - participant ?t - time_slot)
    (possible_slot ?t - time_slot)
  )

  (:action schedule_meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?t - time_slot)
    :precondition (and
      (available ?p1 ?t)
      (available ?p2 ?t)
      (available ?p3 ?t)
      (possible_slot ?t)
    )
    :effect (scheduled meeting ?t)
  )
)