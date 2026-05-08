(define (domain meetup-schedule)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent friend location time)

  (:predicates
    (at ?a - agent ?loc - location ?t - time)
    (can-travel-mh ?t1 - time ?t2 - time)
    (can-travel-hm ?t1 - time ?t2 - time)
    (can-meet-sam ?t1 - time ?t2 - time)
    (can-meet-marg ?t1 - time ?t2 - time)
    (met ?f - friend)
    (finished)
  )

  (:functions (total-cost))

  (:action travel-mission-to-haight
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a mission ?t1)
      (can-travel-mh ?t1 ?t2)
    )
    :effect (and
      (not (at ?a mission ?t1))
      (at ?a haight ?t2)
    )
  )

  (:action travel-haight-to-mission
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a haight ?t1)
      (can-travel-hm ?t1 ?t2)
    )
    :effect (and
      (not (at ?a haight ?t1))
      (at ?a mission ?t2)
    )
  )

  (:action meet-sam
    :parameters (?a - agent ?s - friend ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a mission ?t1)
      (can-meet-sam ?t1 ?t2)
      (not (met ?s))
    )
    :effect (and
      (not (at ?a mission ?t1))
      (at ?a mission ?t2)
      (met ?s)
      (increase (total-cost) 1)
    )
  )

  (:action meet-margaret
    :parameters (?a - agent ?m - friend ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a haight ?t1)
      (can-meet-marg ?t1 ?t2)
      (not (met ?m))
    )
    :effect (and
      (not (at ?a haight ?t1))
      (at ?a haight ?t2)
      (met ?m)
      (increase (total-cost) 1)
    )
  )

  (:action finish-day
    :parameters (?a - agent ?loc - location ?t - time)
    :precondition (and
      (at ?a ?loc ?t)
    )
    :effect (and
      (finished)
    )
  )
)