(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types timeslot participant)

  (:predicates
    (busy ?p - participant ?t - timeslot)   ;; hard constraints: participant is busy at slot
    (candidate ?t - timeslot)               ;; allowed choice(s) (encodes preference / recommended slot)
    (meeting_scheduled)
  )

  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (candidate ?t)
      (not (meeting_scheduled))
      (not (busy heather ?t))
      (not (busy nicholas ?t))
      (not (busy zachary ?t))
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)