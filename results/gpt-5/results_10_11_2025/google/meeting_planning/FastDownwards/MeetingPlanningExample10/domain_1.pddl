(define (domain meeting-planning-sf)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location time)
  (:predicates
    (at ?l - location)
    (cur ?t - time)
    (next ?t1 - time ?t2 - time)          ; 1-minute successor
    (plus16 ?t1 - time ?t2 - time)        ; 16-minute jump (GGP->Marina)
    (plus18 ?t1 - time ?t2 - time)        ; 18-minute jump (Marina->GGP)
    (plus15win ?t1 - time ?t2 - time)     ; 15-minute meeting interval fully within James' availability
    (met-james)
  )
  (:functions (total-cost))
  
  ; Wait exactly 1 minute anywhere
  (:action wait1
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (cur ?t1) (next ?t1 ?t2))
    :effect (and
      (not (cur ?t1))
      (cur ?t2)
    )
  )

  ; Travel from Golden Gate Park to Marina District in 16 minutes
  (:action travel_ggp_to_marina
    :parameters (?t1 - time ?t2 - time ?g - location ?m - location)
    :precondition (and
      (cur ?t1)
      (at ?g)
      (plus16 ?t1 ?t2)
    )
    :effect (and
      (not (cur ?t1))
      (cur ?t2)
      (not (at ?g))
      (at ?m)
      (increase (total-cost) 16)
    )
  )

  ; Travel from Marina District to Golden Gate Park in 18 minutes
  (:action travel_marina_to_ggp
    :parameters (?t1 - time ?t2 - time ?m - location ?g - location)
    :precondition (and
      (cur ?t1)
      (at ?m)
      (plus18 ?t1 ?t2)
    )
    :effect (and
      (not (cur ?t1))
      (cur ?t2)
      (not (at ?m))
      (at ?g)
      (increase (total-cost) 18)
    )
  )

  ; Meet James for a 15-minute block entirely within his availability window
  (:action meet_james_15
    :parameters (?t1 - time ?t2 - time ?m - location)
    :precondition (and
      (cur ?t1)
      (at ?m)
      (plus15win ?t1 ?t2)
    )
    :effect (and
      (not (cur ?t1))
      (cur ?t2)
      (met-james)
    )
  )
)