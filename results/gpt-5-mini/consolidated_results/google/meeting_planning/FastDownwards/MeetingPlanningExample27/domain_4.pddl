(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent friend location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)                ; agent at location at a timepoint
    (friend-at ?f - friend ?l - location)                 ; friend's static location
    (wait-seg ?l - location ?t1 - time ?t2 - time)        ; allowed contiguous wait from t1 to t2 at location
    (travel-seg ?from - location ?to - location ?t1 - time ?t2 - time) ; allowed directed travel from t1 to t2
    (meet-seg ?f - friend ?t1 - time ?t2 - time)          ; allowed contiguous meeting segment for friend from t1 to t2
    (met ?f - friend ?t1 - time ?t2 - time)               ; friend met over specified segment
  )

  (:action wait
    :parameters (?a - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (wait-seg ?l ?t1 ?t2))
    :effect (and
              (not (at ?a ?l ?t1))
              (at ?a ?l ?t2)
            )
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from ?t1) (travel-seg ?from ?to ?t1 ?t2))
    :effect (and
              (not (at ?a ?from ?t1))
              (at ?a ?to ?t2)
            )
  )

  (:action meet
    :parameters (?a - agent ?f - friend ?l - location ?t1 - time ?t2 - time)
    :precondition (and
                    (at ?a ?l ?t1)
                    (friend-at ?f ?l)
                    (meet-seg ?f ?t1 ?t2)
                  )
    :effect (and
              (not (at ?a ?l ?t1))
              (at ?a ?l ?t2)
              (met ?f ?t1 ?t2)
            )
  )
)