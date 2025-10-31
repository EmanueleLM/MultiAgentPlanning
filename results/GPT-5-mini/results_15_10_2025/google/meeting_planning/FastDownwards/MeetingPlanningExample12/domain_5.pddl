(define (domain multiagent-travel)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person location time)
  (:constants traveler barbara - person north-beach alamo-square - location)
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

  (:action travel-northbeach-to-alamosquare
    :parameters (?t1 - time ?t2 - time ?p - person)
    :precondition (and (now ?t1) (at ?p north-beach) (plus16 ?t1 ?t2))
    :effect (and
              (not (now ?t1))
              (now ?t2)
              (not (at ?p north-beach))
              (at ?p alamo-square)
            )
    :cost 16
  )

  (:action travel-alamosquare-to-northbeach
    :parameters (?t1 - time ?t2 - time ?p - person)
    :precondition (and (now ?t1) (at ?p alamo-square) (plus15 ?t1 ?t2))
    :effect (and
              (not (now ?t1))
              (now ?t2)
              (not (at ?p alamo-square))
              (at ?p north-beach)
            )
    :cost 15
  )

  (:action wait-one-minute
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (plus1 ?t1 ?t2))
    :effect (and
              (not (now ?t1))
              (now ?t2)
            )
    :cost 1
  )

  (:action meet-barbara-at-alamosquare
    :parameters (?t1 - time ?t2 - time ?p - person ?b - person)
    :precondition (and
                    (now ?t1)
                    (can-start-meeting ?t1)
                    (plus90 ?t1 ?t2)
                    (at ?p alamo-square)
                    (at ?b alamo-square)
                    (not (met ?b))
                  )
    :effect (and
              (met ?b)
              (not (now ?t1))
              (now ?t2)
            )
    :cost 0
  )
)