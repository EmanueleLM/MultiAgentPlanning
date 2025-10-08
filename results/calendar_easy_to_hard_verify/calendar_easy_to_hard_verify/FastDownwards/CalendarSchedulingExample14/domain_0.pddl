(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent timeslot)
  (:predicates
    (available ?a - agent ?t - timeslot)
    (meeting-scheduled ?t - timeslot)
  )

  ;; A single action that schedules a meeting at a given timeslot.
  ;; It requires every participant to be available at that slot.
  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (available karen ?t)
      (available brandon ?t)
      (available donald ?t)
      (available kelly ?t)
    )
    :effect (meeting-scheduled ?t)
  )
)