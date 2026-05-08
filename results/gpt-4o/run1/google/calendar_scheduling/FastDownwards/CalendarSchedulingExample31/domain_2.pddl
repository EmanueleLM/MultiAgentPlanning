(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)
  (:predicates 
    (busy ?p - participant ?t - time_slot)
    (preferred_after_14 ?p - participant)
    (scheduled ?t - time_slot)
    (after_or_equal_14 ?t - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and 
      (not (busy richard ?t))
      (not (busy martha ?t))
      (not (busy kimberly ?t))
      (or (not (preferred_after_14 martha)) (after_or_equal_14 ?t))
    )
    :effect (scheduled ?t)
  )
)