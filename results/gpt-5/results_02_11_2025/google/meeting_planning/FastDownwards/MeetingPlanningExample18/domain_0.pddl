(define (domain meet-betty-travel)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location time quota
  )
  (:constants
    marina richmond - location
  )
  (:predicates
    (at ?l - location)
    (now ?t - time)
    (step ?t1 - time ?t2 - time)          ; allowed waiting jump from t1 to later t2
    (next ?t1 - time ?t2 - time)          ; exactly 1-minute successor
    (plus11 ?t1 - time ?t2 - time)        ; Marina -> Richmond (11 minutes)
    (plus9 ?t1 - time ?t2 - time)         ; Richmond -> Marina (9 minutes)
    (betty-available ?t - time)           ; Betty is available starting at minute t
    (unused ?m - quota)                   ; meeting-minute quota token not yet used
    (used ?m - quota)                     ; meeting-minute quota token used
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (now ?t1) (step ?t1 ?t2))
    :effect (and (not (now ?t1)) (now ?t2))
  )

  (:action travel-marina-to-richmond
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at marina) (now ?t1) (plus11 ?t1 ?t2))
    :effect (and (not (at marina)) (at richmond) (not (now ?t1)) (now ?t2))
  )

  (:action travel-richmond-to-marina
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at richmond) (now ?t1) (plus9 ?t1 ?t2))
    :effect (and (not (at richmond)) (at marina) (not (now ?t1)) (now ?t2))
  )

  (:action meet-betty-one-minute
    :parameters (?t1 - time ?t2 - time ?m - quota)
    :precondition (and (at richmond) (now ?t1) (next ?t1 ?t2) (betty-available ?t1) (unused ?m))
    :effect (and (used ?m) (not (unused ?m)) (not (now ?t1)) (now ?t2))
  )
)