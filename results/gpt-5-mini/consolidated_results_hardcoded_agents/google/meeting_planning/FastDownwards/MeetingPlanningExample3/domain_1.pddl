(define (domain MeetingPlanningExample3)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time metcount person)
  (:constants Bayview GoldenGatePark - location
              barbara - person)

  (:predicates
    (now ?t - time)
    (at ?loc - location)                         ; traveler's current location (single fluent)
    (at-person ?p - person ?loc - location)     ; where persons are (static)
    (plus1 ?t1 ?t2 - time)
    (plus22 ?t1 ?t2 - time)
    (plus23 ?t1 ?t2 - time)
    (allowed_meet ?t - time)                    ; minute t is allowed as a 1-minute meeting start (ends <= 11:30)
    (have-met ?m - metcount)                    ; current accumulated meeting minute marker
    (nextmet ?m1 ?m2 - metcount)                ; progression relation for meeting minute counters
  )

  ;; Move from Bayview to Golden Gate Park consuming 22 minutes (advances now by 22)
  (:action move_Bayview_to_GGP
    :parameters (?t1 ?t2 - time)
    :precondition (and (at Bayview) (now ?t1) (plus22 ?t1 ?t2))
    :effect (and (not (at Bayview)) (at GoldenGatePark) (not (now ?t1)) (now ?t2))
  )

  ;; Move from Golden Gate Park to Bayview consuming 23 minutes (advances now by 23)
  (:action move_GGP_to_Bayview
    :parameters (?t1 ?t2 - time)
    :precondition (and (at GoldenGatePark) (now ?t1) (plus23 ?t1 ?t2))
    :effect (and (not (at GoldenGatePark)) (at Bayview) (not (now ?t1)) (now ?t2))
  )

  ;; Wait one minute (advance now by 1) without changing location
  (:action wait_1min
    :parameters (?t1 ?t2 - time)
    :precondition (and (now ?t1) (plus1 ?t1 ?t2))
    :effect (and (not (now ?t1)) (now ?t2))
  )

  ;; Meet Barbara for one minute: must be at Golden Gate Park, time start allowed, and progress meeting counter by one step
  (:action meet_barbara_1min
    :parameters (?t1 ?t2 - time ?m1 ?m2 - metcount)
    :precondition (and (at GoldenGatePark) (now ?t1) (plus1 ?t1 ?t2) (allowed_meet ?t1) (have-met ?m1) (nextmet ?m1 ?m2))
    :effect (and (not (now ?t1)) (now ?t2) (not (have-met ?m1)) (have-met ?m2))
  )
)