(define (domain schedule_meeting)
  (:requirements :strips :typing)
  (:types participant time_slot)

  (:predicates
    (available ?p - participant ?t - time_slot)
    (meeting_time ?t - time_slot)
    (prefer_early ?p - participant ?t - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and
      (available brian ?t)
      (available billy ?t)
      (available patricia ?t)
    )
    :effect (meeting_time ?t)
  )
)