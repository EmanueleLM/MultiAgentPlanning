(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent friend location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)                ; agent at a location at a specific timepoint
    (friend-at ?f - friend ?l - location)                 ; friend is located at a location (static)
    (wait-seg ?l - location ?t1 - time ?t2 - time)        ; permitted waiting segment at a location
    (travel-seg ?from - location ?to - location ?t1 - time ?t2 - time) ; permitted directed travel segment
    (meet-seg ?f - friend ?t1 - time ?t2 - time)          ; permitted meeting segment for a friend
    (met ?f - friend ?t1 - time ?t2 - time)               ; friend met over given time segment
  )

  (:functions
    (total-cost)  ; accumulated travel time to be minimized
  )

  ;; Wait action: remain in same location from t1 to t2 (used for scheduled waits)
  (:action wait
    :parameters (?a - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (wait-seg ?l ?t1 ?t2))
    :effect (and
              (not (at ?a ?l ?t1))
              (at ?a ?l ?t2)
             )
  )

  ;; Travel action for 7-minute directed leg (Marina District -> Pacific Heights)
  (:action travel-7min
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from ?t1) (travel-seg ?from ?to ?t1 ?t2))
    :effect (and
              (not (at ?a ?from ?t1))
              (at ?a ?to ?t2)
              (increase (total-cost) 7)
            )
  )

  ;; Travel action for 6-minute directed leg (Pacific Heights -> Marina District)
  (:action travel-6min
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from ?t1) (travel-seg ?from ?to ?t1 ?t2))
    :effect (and
              (not (at ?a ?from ?t1))
              (at ?a ?to ?t2)
              (increase (total-cost) 6)
            )
  )

  ;; Meeting action: meet a friend at their location from t1 to t2 (must match a meet-seg)
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