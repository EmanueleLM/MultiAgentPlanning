(define (domain multiagent-meet)
  (:requirements :strips :typing)
  (:types agent location time)

  (:constants
    traveler nancy - agent
    sunset haight - location
  )

  (:predicates
    (at ?x - agent ?l - location)
    (met ?a - agent ?b - agent)
    (now ?t - time)
    (succ ?t1 - time ?t2 - time)
    (after5 ?t1 - time ?t2 - time)
    (allowed-start ?t - time)
  )

  (:action traveler-move-sunset-to-haight
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at traveler sunset) (now ?t1) (succ ?t1 ?t2))
    :effect (and
              (not (at traveler sunset))
              (at traveler haight)
              (not (now ?t1))
              (now ?t2)
            )
  )

  (:action traveler-move-haight-to-sunset
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at traveler haight) (now ?t1) (succ ?t1 ?t2))
    :effect (and
              (not (at traveler haight))
              (at traveler sunset)
              (not (now ?t1))
              (now ?t2)
            )
  )

  (:action traveler-wait-15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (or (at traveler sunset) (at traveler haight)) (now ?t1) (succ ?t1 ?t2))
    :effect (and
              (not (now ?t1))
              (now ?t2)
            )
  )

  (:action nancy-wait-15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at nancy haight) (now ?t1) (succ ?t1 ?t2))
    :effect (and
              (not (now ?t1))
              (now ?t2)
            )
  )

  (:action traveler-meet-nancy
    :parameters (?tstart - time ?tend - time)
    :precondition (and (at traveler haight) (at nancy haight) (now ?tstart) (after5 ?tstart ?tend) (allowed-start ?tstart))
    :effect (and
              (met traveler nancy)
              (not (now ?tstart))
              (now ?tend)
            )
  )
)