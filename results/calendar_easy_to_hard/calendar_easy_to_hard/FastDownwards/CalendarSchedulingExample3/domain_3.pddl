(define (domain meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions :action-costs)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (succ ?t - time ?t2 - time)
    (scheduled ?t - time)
  )
  (:action schedule-meeting
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (free arthur ?t) (free arthur ?t2)
      (free michael ?t) (free michael ?t2)
      (free samantha ?t) (free samantha ?t2)
      (not (scheduled ?t))
    )
    :effect (and
      (scheduled ?t)
      (not (free arthur ?t)) (not (free arthur ?t2))
      (not (free michael ?t)) (not (free michael ?t2))
      (not (free samantha ?t)) (not (free samantha ?t2))
    )
    :cost 1
  )
)