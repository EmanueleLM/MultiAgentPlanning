(define (domain multiagent-meet)
  (:requirements :strips :adl :typing :action-costs)
  (:types agent location time)

  (:predicates
    (at ?x - agent ?l - location)
    (met ?a - agent ?b - agent)
    (nancy-ready)
    (now ?t - time)
    (succ ?t1 - time ?t2 - time)
    (after5 ?t1 - time ?t2 - time)
    (between42to46 ?t - time)
  )

  (:functions
    (total-cost)
  )

  (:action traveler-move-sunset-to-haight
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at traveler Sunset) (now ?t1) (succ ?t1 ?t2))
    :effect (and
              (not (at traveler Sunset))
              (at traveler Haight)
              (not (now ?t1))
              (now ?t2)
              (increase (total-cost) 0)
            )
  )

  (:action traveler-move-haight-to-sunset
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at traveler Haight) (now ?t1) (succ ?t1 ?t2))
    :effect (and
              (not (at traveler Haight))
              (at traveler Sunset)
              (not (now ?t1))
              (now ?t2)
              (increase (total-cost) 0)
            )
  )

  (:action traveler-wait-15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (or (at traveler Sunset) (at traveler Haight)) (now ?t1) (succ ?t1 ?t2))
    :effect (and
              (not (now ?t1))
              (now ?t2)
              (increase (total-cost) 0)
            )
  )

  (:action nancy-wait-15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at nancy Haight) (now ?t1) (succ ?t1 ?t2))
    :effect (and
              (not (now ?t1))
              (now ?t2)
              (increase (total-cost) 0)
            )
  )

  (:action nancy-become-ready
    :parameters (?t - time)
    :precondition (and (at nancy Haight) (now ?t) (between42to46 ?t))
    :effect (and
              (nancy-ready)
              (increase (total-cost) 0)
            )
  )

  (:action traveler-meet-nancy
    :parameters (?tstart - time ?tend - time)
    :precondition (and (at traveler Haight) (at nancy Haight) (now ?tstart) (after5 ?tstart ?tend) (nancy-ready))
    :effect (and
              (met traveler nancy)
              (not (now ?tstart))
              (now ?tend)
              (increase (total-cost) -1)
            )
  )
)