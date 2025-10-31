(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :disjunctive-goals)
  (:types person time)

  (:predicates
    (free ?p - person ?t - time)     ;; person p is free at half-hour slot t
    (succ ?t - time ?t2 - time)      ;; t2 is the next half-hour after t
    (scheduled ?t - time)            ;; meeting scheduled starting at t (covers t and its successor)
  )

  ;; A single distinct scheduling action that chooses a start time t and its successor t2.
  ;; It requires all participants to be free at both half-hour slots.
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
    )
  )
)