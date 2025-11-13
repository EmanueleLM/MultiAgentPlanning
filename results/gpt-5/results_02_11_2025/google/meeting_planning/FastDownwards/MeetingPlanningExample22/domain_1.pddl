(define (domain day-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location friend minute
  )
  (:predicates
    (current_location ?l - location)
    (time ?m - minute)
    (friend_at ?f - friend ?l - location)
    (at_window ?f - friend ?m - minute)
    (met ?f - friend)

    ; discrete time-step relations
    (next15 ?m1 - minute ?m2 - minute)   ; exactly +15 minutes
    (add22  ?m1 - minute ?m2 - minute)   ; exactly +22 minutes
    (add24  ?m1 - minute ?m2 - minute)   ; exactly +24 minutes
    (waitedge ?m1 - minute ?m2 - minute) ; allowed waiting jump

    ; meeting progress tokens (24 chunks of 15 minutes cover 11:15–17:15)
    (p0) (p1) (p2) (p3) (p4) (p5) (p6) (p7) (p8) (p9) (p10) (p11) (p12)
    (p13) (p14) (p15) (p16) (p17) (p18) (p19) (p20) (p21) (p22) (p23) (p24)
  )
  (:functions
    (total-cost)
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
    )
  )

  ; Meeting Andrew in 15-minute chunks.
  ; Reaching p7 (7 chunks = 105 min) sets (met andrew) to enforce the minimum.
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
    :precondition (and (p1) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p1)) (p2) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step3
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p2) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p2)) (p3) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step4
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p3) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p3)) (p4) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step5
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p4) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p4)) (p5) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step6
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p5) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p5)) (p6) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step7
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p6) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and
      (not (p6)) (p7)
      (met andrew)
      (not (time ?t1)) (time ?t2)
      (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step8
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p7) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p7)) (p8) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step9
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p8) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p8)) (p9) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step10
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p9) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p9)) (p10) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step11
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p10) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p10)) (p11) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step12
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p11) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p11)) (p12) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step13
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p12) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p12)) (p13) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step14
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p13) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p13)) (p14) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step15
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p14) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p14)) (p15) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step16
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p15) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p15)) (p16) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step17
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p16) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p16)) (p17) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step18
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p17) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p17)) (p18) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step19
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p18) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p18)) (p19) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step20
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p19) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p19)) (p20) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step21
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p20) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p20)) (p21) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step22
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p21) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p21)) (p22) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step23
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p22) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p22)) (p23) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
  (:action meet-andrew-15-step24
    :parameters (?t1 - minute ?t2 - minute)
    :precondition (and (p23) (current_location unionsquare)
      (friend_at andrew unionsquare) (time ?t1) (next15 ?t1 ?t2)
      (at_window andrew ?t1) (at_window andrew ?t2))
    :effect (and (not (p23)) (p24) (not (time ?t1)) (time ?t2) (increase (total-cost) 15))
  )
)