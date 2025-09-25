(define (domain meet-domain)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location)
    (time-is ?t - time)
    (succ9 ?t1 - time ?t2 - time)
    (succ75 ?t1 - time ?t2 - time)
    (succ-wait ?t1 - time ?t2 - time)
    (met)
  )
  (:functions (total-cost))

  (:action traveler-travel-us-to-nh
    :parameters (?from - time ?to - time)
    :precondition (and (at traveler union_square) (time-is ?from) (succ9 ?from ?to))
    :effect (and
      (not (at traveler union_square))
      (at traveler nob_hill)
      (not (time-is ?from))
      (time-is ?to)
      (increase (total-cost) 9)
    )
  )

  (:action traveler-wait-540-to-720
    :precondition (and (time-is t540))
    :effect (and
      (not (time-is t540))
      (time-is t720)
      (increase (total-cost) 180)
    )
  )

  (:action traveler-wait-549-to-720
    :precondition (and (time-is t549))
    :effect (and
      (not (time-is t549))
      (time-is t720)
      (increase (total-cost) 171)
    )
  )

  (:action mary-start-at-720
    :precondition (time-is t720)
    :effect (and
      (at mary nob_hill)
    )
  )

  (:action mary-start-at-729
    :precondition (time-is t729)
    :effect (and
      (at mary nob_hill)
    )
  )

  (:action traveler-meet-mary
    :parameters (?from - time ?to - time)
    :precondition (and (at traveler nob_hill) (at mary nob_hill) (time-is ?from) (succ75 ?from ?to) (not (met)))
    :effect (and
      (met)
      (not (time-is ?from))
      (time-is ?to)
      (increase (total-cost) 75)
    )
  )
)