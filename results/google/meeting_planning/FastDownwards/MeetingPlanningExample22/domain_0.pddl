(define (domain day-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location friend minute
  )
  (:predicates
    ; state
    (current_location ?l - location)
    (time ?m - minute)
    (friend_at ?f - friend ?l - location)
    (at_window ?f - friend ?m - minute)
    (met ?f - friend)

    ; discrete time-step relations
    (next15 ?m1 - minute ?m2 - minute)   ; exactly +15 minutes
    (add22  ?m1 - minute ?m2 - minute)   ; exactly +22 minutes
    (add24  ?m1 - minute ?m2 - minute)   ; exactly +24 minutes
    (waitedge ?m1 - minute ?m2 - minute) ; arbitrary allowed waiting jump

    ; meeting progress (7 steps of 15 minutes = 105 minutes)
    (p0) (p1) (p2) (p3) (p4) (p5) (p6) (p7)
  )
  (:functions
    (total-cost) ; used here only for time accounting; no metric is specified
  )

  ; asymmetric travel Presidio -> UnionSquare (+22)
  (:action travel-presidio-unionsquare
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and
      (current_location presidio)
      (time ?t1)
      (add22 ?t1 ?t2)
    )
    :effect (and
      (not (current_location presidio))
      (current_location unionsquare)
      (not (time ?t1))
      (time ?t2)
      (increase (total-cost) 22)
    )
  )

  ; asymmetric travel UnionSquare -> Presidio (+24)
  (:action travel-unionsquare-presidio
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and
      (current_location unionsquare)
      (time ?t1)
      (add24 ?t1 ?t2)
    )
    :effect (and
      (not (current_location unionsquare))
      (current_location presidio)
      (not (time ?t1))
      (time ?t2)
      (increase (total-cost) 24)
    )
  )

  ; waiting (advance time along allowed wait-edge)
  (:action wait
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and
      (time ?t1)
      (waitedge ?t1 ?t2)
    )
    :effect (and
      (not (time ?t1))
      (time ?t2)
      ; no cost contribution needed for optimization (no metric specified)
    )
  )

  ; Meeting Andrew in 7 chunks of 15 minutes each (total 105 minutes).
  ; Each step requires start and end to be within Andrew's availability window.

  (:action meet-andrew-15-step1
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and
      (p0)
      (current_location unionsquare)
      (friend_at andrew unionsquare)
      (time ?t1)
      (next15 ?t1 ?t2)
      (at_window andrew ?t1)
      (at_window andrew ?t2)
    )
    :effect (and
      (not (p0)) (p1)
      (not (time ?t1)) (time ?t2)
      (increase (total-cost) 15)
    )
  )

  (:action meet-andrew-15-step2
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and
      (p1)
      (current_location unionsquare)
      (friend_at andrew unionsquare)
      (time ?t1)
      (next15 ?t1 ?t2)
      (at_window andrew ?t1)
      (at_window andrew ?t2)
    )
    :effect (and
      (not (p1)) (p2)
      (not (time ?t1)) (time ?t2)
      (increase (total-cost) 15)
    )
  )

  (:action meet-andrew-15-step3
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and
      (p2)
      (current_location unionsquare)
      (friend_at andrew unionsquare)
      (time ?t1)
      (next15 ?t1 ?t2)
      (at_window andrew ?t1)
      (at_window andrew ?t2)
    )
    :effect (and
      (not (p2)) (p3)
      (not (time ?t1)) (time ?t2)
      (increase (total-cost) 15)
    )
  )

  (:action meet-andrew-15-step4
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and
      (p3)
      (current_location unionsquare)
      (friend_at andrew unionsquare)
      (time ?t1)
      (next15 ?t1 ?t2)
      (at_window andrew ?t1)
      (at_window andrew ?t2)
    )
    :effect (and
      (not (p3)) (p4)
      (not (time ?t1)) (time ?t2)
      (increase (total-cost) 15)
    )
  )

  (:action meet-andrew-15-step5
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and
      (p4)
      (current_location unionsquare)
      (friend_at andrew unionsquare)
      (time ?t1)
      (next15 ?t1 ?t2)
      (at_window andrew ?t1)
      (at_window andrew ?t2)
    )
    :effect (and
      (not (p4)) (p5)
      (not (time ?t1)) (time ?t2)
      (increase (total-cost) 15)
    )
  )

  (:action meet-andrew-15-step6
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and
      (p5)
      (current_location unionsquare)
      (friend_at andrew unionsquare)
      (time ?t1)
      (next15 ?t1 ?t2)
      (at_window andrew ?t1)
      (at_window andrew ?t2)
    )
    :effect (and
      (not (p5)) (p6)
      (not (time ?t1)) (time ?t2)
      (increase (total-cost) 15)
    )
  )

  (:action meet-andrew-15-step7
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and
      (p6)
      (current_location unionsquare)
      (friend_at andrew unionsquare)
      (time ?t1)
      (next15 ?t1 ?t2)
      (at_window andrew ?t1)
      (at_window andrew ?t2)
    )
    :effect (and
      (not (p6)) (p7)
      (met andrew)
      (not (time ?t1)) (time ?t2)
      (increase (total-cost) 15)
    )
  )
)