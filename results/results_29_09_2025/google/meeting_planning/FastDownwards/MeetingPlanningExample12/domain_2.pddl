(define (domain multiagent-travel)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person)
    (now ?t - time)
    (plus1 ?t1 - time ?t2 - time)
    (plus15 ?t1 - time ?t2 - time)
    (plus16 ?t1 - time ?t2 - time)
    (plus90 ?t1 - time ?t2 - time)
    (can-start-meeting ?t - time)
  )
  (:functions (total-cost))

  (:action travel-northbeach-to-alamosquare
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (at traveler north-beach) (plus16 ?t1 ?t2))
    :effect (and
              (not (now ?t1))
              (now ?t2)
              (not (at traveler north-beach))
              (at traveler alamo-square)
              (increase (total-cost) 16)
            )
  )

  (:action travel-alamosquare-to-northbeach
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (at traveler alamo-square) (plus15 ?t1 ?t2))
    :effect (and
              (not (now ?t1))
              (now ?t2)
              (not (at traveler alamo-square))
              (at traveler north-beach)
              (increase (total-cost) 15)
            )
  )

  (:action wait-one-minute
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (plus1 ?t1 ?t2))
    :effect (and
              (not (now ?t1))
              (now ?t2)
              (increase (total-cost) 1)
            )
  )

  (:action meet-barbara-at-alamosquare
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (now ?t1)
                    (can-start-meeting ?t1)
                    (plus90 ?t1 ?t2)
                    (at traveler alamo-square)
                    (at barbara alamo-square)
                    (not (met barbara))
                  )
    :effect (and
              (met barbara)
              (not (now ?t1))
              (now ?t2)
            )
  )
)