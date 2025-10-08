(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types agent timeslot)
  (:predicates
    (available ?a - agent ?t - timeslot)
    (meeting-scheduled ?t - timeslot)
  )
  (:action schedule
    :parameters (?t - timeslot ?k - agent ?b - agent ?d - agent ?l - agent)
    :precondition (and
      (available ?k ?t)
      (available ?b ?t)
      (available ?d ?t)
      (available ?l ?t)
    )
    :effect (and (meeting-scheduled ?t))
  )
)