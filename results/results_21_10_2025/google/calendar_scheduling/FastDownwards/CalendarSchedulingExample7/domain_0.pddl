(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)

  (:predicates
    (available ?p - participant ?t - timeslot)
    (scheduled)                      ; true once a meeting slot has been chosen
    (meeting-at ?t - timeslot)       ; records which timeslot was chosen
  )

  ;; Schedule a meeting at timeslot ?t if all required participants are available
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available heather ?t)
      (available nicholas ?t)
      (available zachary ?t)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?t)
    )
  )
)