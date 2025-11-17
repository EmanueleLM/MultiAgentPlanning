(define (domain meet-margaret-fixed-schedule)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location time person agent
  )
  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?t - time)
    (succ ?t1 - time ?t2 - time)
    (in-window ?t - time)
    (friend ?p - person)
    (friend-at ?p - person ?l - location)
    (met ?p - person)
    (free)
    (permit-return)
    (returned-to-marina)
    ; movement stages: Marina -> Pacific (7 minutes)
    (moving-mp-s1) (moving-mp-s2) (moving-mp-s3) (moving-mp-s4) (moving-mp-s5) (moving-mp-s6) (moving-mp-s7)
    ; movement stages: Pacific -> Marina (6 minutes)
    (moving-pm-s1) (moving-pm-s2) (moving-pm-s3) (moving-pm-s4) (moving-pm-s5) (moving-pm-s6)
    ; meeting stages: 30 contiguous minutes
    (meeting-s1) (meeting-s2) (meeting-s3) (meeting-s4) (meeting-s5) (meeting-s6) (meeting-s7) (meeting-s8) (meeting-s9) (meeting-s10)
    (meeting-s11) (meeting-s12) (meeting-s13) (meeting-s14) (meeting-s15) (meeting-s16) (meeting-s17) (meeting-s18) (meeting-s19) (meeting-s20)
    (meeting-s21) (meeting-s22) (meeting-s23) (meeting-s24) (meeting-s25) (meeting-s26) (meeting-s27) (meeting-s28) (meeting-s29) (meeting-s30)
  )
  (:functions
    (total-cost)
  )

  ; Wait exactly one minute while idle
  (:action wait-1
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (free)
      (at-time ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ; Start moving Marina -> Pacific (7-minute directed travel)
  (:action start-move-marina-to-pacific
    :parameters (?a - agent ?m - location ?p - location ?t - time ?t2 - time)
    :precondition (and
      (free)
      (at ?a ?m)
      (at-time ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (free))
      (not (at ?a ?m))
      (moving-mp-s1)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ; Progress Marina -> Pacific (minutes 1..6)
  (:action progress-move-mp-1
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-mp-s1) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-mp-s1)) (moving-mp-s2)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )
  (:action progress-move-mp-2
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-mp-s2) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-mp-s2)) (moving-mp-s3)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )
  (:action progress-move-mp-3
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-mp-s3) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-mp-s3)) (moving-mp-s4)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )
  (:action progress-move-mp-4
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-mp-s4) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-mp-s4)) (moving-mp-s5)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )
  (:action progress-move-mp-5
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-mp-s5) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-mp-s5)) (moving-mp-s6)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )
  ; Complete Marina -> Pacific (7th minute)
  (:action complete-move-mp-7
    :parameters (?a - agent ?p - location ?t - time ?t2 - time)
    :precondition (and (moving-mp-s6) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-mp-s6))
      (at ?a ?p)
      (free)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )

  ; Start a contiguous 30-minute meeting with Margaret inside her window
  (:action start-meeting-margaret
    :parameters (?a - agent ?p - person ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (free)
      (friend ?p)
      (friend-at ?p ?loc)
      (at ?a ?loc)
      (at-time ?t)
      (succ ?t ?t2)
      (in-window ?t)
      (not (met ?p))
    )
    :effect (and
      (not (free))
      (meeting-s1)
      (not (at-time ?t)) (at-time ?t2)
    )
  )

  ; Progress meeting minute-by-minute inside the window (1..29)
  (:action progress-meeting-1
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s1) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s1)) (meeting-s2) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-2
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s2) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s2)) (meeting-s3) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-3
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s3) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s3)) (meeting-s4) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-4
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s4) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s4)) (meeting-s5) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-5
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s5) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s5)) (meeting-s6) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-6
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s6) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s6)) (meeting-s7) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-7
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s7) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s7)) (meeting-s8) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-8
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s8) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s8)) (meeting-s9) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-9
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s9) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s9)) (meeting-s10) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-10
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s10) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s10)) (meeting-s11) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-11
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s11) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s11)) (meeting-s12) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-12
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s12) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s12)) (meeting-s13) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-13
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s13) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s13)) (meeting-s14) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-14
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s14) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s14)) (meeting-s15) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-15
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s15) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s15)) (meeting-s16) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-16
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s16) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s16)) (meeting-s17) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-17
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s17) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s17)) (meeting-s18) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-18
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s18) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s18)) (meeting-s19) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-19
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s19) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s19)) (meeting-s20) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-20
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s20) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s20)) (meeting-s21) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-21
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s21) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s21)) (meeting-s22) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-22
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s22) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s22)) (meeting-s23) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-23
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s23) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s23)) (meeting-s24) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-24
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s24) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s24)) (meeting-s25) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-25
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s25) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s25)) (meeting-s26) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-26
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s26) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s26)) (meeting-s27) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-27
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s27) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s27)) (meeting-s28) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-28
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s28) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s28)) (meeting-s29) (not (at-time ?t)) (at-time ?t2))
  )
  ; Complete meeting (30th minute)
  (:action complete-meeting-30
    :parameters (?a - agent ?p - person ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (meeting-s29)
      (friend ?p)
      (friend-at ?p ?loc)
      (at ?a ?loc)
      (at-time ?t)
      (succ ?t ?t2)
      (in-window ?t)
    )
    :effect (and
      (not (meeting-s29))
      (met ?p)
      (permit-return)
      (free)
      (not (at-time ?t)) (at-time ?t2)
    )
  )

  ; Start moving Pacific -> Marina (6-minute directed travel), only after meeting complete
  (:action start-move-pacific-to-marina
    :parameters (?a - agent ?p - location ?m - location ?t - time ?t2 - time)
    :precondition (and
      (free)
      (permit-return)
      (at ?a ?p)
      (at-time ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (free))
      (not (at ?a ?p))
      (moving-pm-s1)
      (not (at-time ?t)) (at-time ?t2)
    )
  )

  ; Progress Pacific -> Marina (minutes 1..5)
  (:action progress-move-pm-1
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-pm-s1) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-pm-s1)) (moving-pm-s2)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )
  (:action progress-move-pm-2
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-pm-s2) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-pm-s2)) (moving-pm-s3)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )
  (:action progress-move-pm-3
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-pm-s3) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-pm-s3)) (moving-pm-s4)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )
  (:action progress-move-pm-4
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-pm-s4) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-pm-s4)) (moving-pm-s5)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )
  ; Complete Pacific -> Marina (6th minute)
  (:action complete-move-pm-6
    :parameters (?a - agent ?m - location ?t - time ?t2 - time)
    :precondition (and (moving-pm-s5) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-pm-s5))
      (at ?a ?m)
      (returned-to-marina)
      (free)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )
)