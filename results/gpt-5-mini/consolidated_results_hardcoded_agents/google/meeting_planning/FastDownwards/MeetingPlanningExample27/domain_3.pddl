(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent friend location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)                ; agent at location at a specific timepoint
    (friend-at ?f - friend ?l - location)                 ; friend's static location
    (wait-seg ?l - location ?t1 - time ?t2 - time)        ; permitted wait from t1 to t2 at location
    (travel-seg ?from - location ?to - location ?t1 - time ?t2 - time) ; permitted directed travel segment
    (meet-seg ?f - friend ?t1 - time ?t2 - time)          ; permitted meeting segment for a friend
    (met ?f - friend ?t1 - time ?t2 - time)               ; friend met over given time segment
  )

  ;; Wait: remain at same location from t1 to t2, contiguous occupancy enforced by wait-seg facts.
  (:action wait
    :parameters (?a - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (wait-seg ?l ?t1 ?t2))
    :effect (and
              (not (at ?a ?l ?t1))
              (at ?a ?l ?t2)
            )
  )

  ;; Travel: directed movement from ?from at time ?t1 to ?to at time ?t2, requires matching travel-seg.
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from ?t1) (travel-seg ?from ?to ?t1 ?t2))
    :effect (and
              (not (at ?a ?from ?t1))
              (at ?a ?to ?t2)
            )
  )

  ;; Meet: contiguous meeting block for friend ?f from ?t1 to ?t2 at their location.
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