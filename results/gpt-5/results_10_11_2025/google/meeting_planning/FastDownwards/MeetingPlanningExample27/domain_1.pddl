(define (domain sf-meet-margaret)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location time person agent
  )

  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?t - time)
    (succ ?t1 - time ?t2 - time)
    (in-window ?t - time)          ; Margaret availability minute starts (600..644)
    (friend ?p - person)
    (friend-at ?p - person ?l - location)
    (met ?p - person)
    (free)                          ; agent is not moving/meeting
    ; Movement stages (directed, minute-by-minute)
    (moving-mp-s1) (moving-mp-s2) (moving-mp-s3) (moving-mp-s4) (moving-mp-s5) (moving-mp-s6) (moving-mp-s7)
    (moving-pm-s1) (moving-pm-s2) (moving-pm-s3) (moving-pm-s4) (moving-pm-s5) (moving-pm-s6)
    ; Meeting stages for a full 45-minute contiguous meeting
    (meeting-s1) (meeting-s2) (meeting-s3) (meeting-s4) (meeting-s5)
    (meeting-s6) (meeting-s7) (meeting-s8) (meeting-s9) (meeting-s10)
    (meeting-s11) (meeting-s12) (meeting-s13) (meeting-s14) (meeting-s15)
    (meeting-s16) (meeting-s17) (meeting-s18) (meeting-s19) (meeting-s20)
    (meeting-s21) (meeting-s22) (meeting-s23) (meeting-s24) (meeting-s25)
    (meeting-s26) (meeting-s27) (meeting-s28) (meeting-s29) (meeting-s30)
    (meeting-s31) (meeting-s32) (meeting-s33) (meeting-s34) (meeting-s35)
    (meeting-s36) (meeting-s37) (meeting-s38) (meeting-s39) (meeting-s40)
    (meeting-s41) (meeting-s42) (meeting-s43) (meeting-s44)
  )

  (:functions
    (total-cost)    ; sum of travel minutes (used for minimizing travel)
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

  ; Progress Marina -> Pacific (minutes 1..6), cost 1 per minute
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

  ; Complete Marina -> Pacific (7th minute), cost last minute
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

  ; Optional: Start moving Pacific -> Marina (6-minute directed travel)
  (:action start-move-pacific-to-marina
    :parameters (?a - agent ?p - location ?m - location ?t - time ?t2 - time)
    :precondition (and
      (free)
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
  (:action progress-move-pm-1
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-pm-s1) (at-time ?t) (succ ?t ?t2))
    :effect (and (not (moving-pm-s1)) (moving-pm-s2) (not (at-time ?t)) (at-time ?t2) (increase (total-cost) 1))
  )
  (:action progress-move-pm-2
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-pm-s2) (at-time ?t) (succ ?t ?t2))
    :effect (and (not (moving-pm-s2)) (moving-pm-s3) (not (at-time ?t)) (at-time ?t2) (increase (total-cost) 1))
  )
  (:action progress-move-pm-3
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-pm-s3) (at-time ?t) (succ ?t ?t2))
    :effect (and (not (moving-pm-s3)) (moving-pm-s4) (not (at-time ?t)) (at-time ?t2) (increase (total-cost) 1))
  )
  (:action progress-move-pm-4
    :parameters (?t - time ?t2 - time)
    :precondition (and (moving-pm-s4) (at-time ?t) (succ ?t ?t2))
    :effect (and (not (moving-pm-s4)) (moving-pm-s5) (not (at-time ?t)) (at-time ?t2) (increase (total-cost) 1))
  )
  (:action complete-move-pm-6
    :parameters (?a - agent ?m - location ?t - time ?t2 - time)
    :precondition (and (moving-pm-s5) (at-time ?t) (succ ?t ?t2))
    :effect (and
      (not (moving-pm-s5))
      (at ?a ?m)
      (free)
      (not (at-time ?t)) (at-time ?t2)
      (increase (total-cost) 1)
    )
  )

  ; Start a contiguous meeting with Margaret, ensuring it begins in her window
  (:action start-meeting-margaret
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (free)
      (friend margaret)
      (friend-at margaret ?loc)
      (at ?a ?loc)
      (at-time ?t)
      (succ ?t ?t2)
      (in-window ?t)
      (not (met margaret))
    )
    :effect (and
      (not (free))
      (meeting-s1)
      (not (at-time ?t)) (at-time ?t2)
    )
  )

  ; Progress the meeting minute-by-minute inside the availability window (43 steps)
  (:action progress-meeting-1
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s1) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s1)) (meeting-s2) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-2
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s2) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s2)) (meeting-s3) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-3
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s3) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s3)) (meeting-s4) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-4
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s4) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s4)) (meeting-s5) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-5
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s5) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s5)) (meeting-s6) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-6
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s6) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s6)) (meeting-s7) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-7
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s7) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s7)) (meeting-s8) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-8
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s8) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s8)) (meeting-s9) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-9
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s9) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s9)) (meeting-s10) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-10
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s10) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s10)) (meeting-s11) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-11
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s11) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s11)) (meeting-s12) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-12
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s12) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s12)) (meeting-s13) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-13
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s13) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s13)) (meeting-s14) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-14
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s14) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s14)) (meeting-s15) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-15
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s15) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s15)) (meeting-s16) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-16
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s16) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s16)) (meeting-s17) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-17
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s17) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s17)) (meeting-s18) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-18
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s18) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s18)) (meeting-s19) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-19
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s19) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s19)) (meeting-s20) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-20
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s20) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s20)) (meeting-s21) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-21
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s21) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s21)) (meeting-s22) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-22
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s22) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s22)) (meeting-s23) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-23
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s23) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s23)) (meeting-s24) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-24
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s24) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s24)) (meeting-s25) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-25
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s25) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s25)) (meeting-s26) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-26
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s26) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s26)) (meeting-s27) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-27
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s27) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s27)) (meeting-s28) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-28
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s28) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s28)) (meeting-s29) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-29
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s29) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s29)) (meeting-s30) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-30
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s30) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s30)) (meeting-s31) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-31
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s31) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s31)) (meeting-s32) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-32
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s32) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s32)) (meeting-s33) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-33
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s33) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s33)) (meeting-s34) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-34
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s34) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s34)) (meeting-s35) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-35
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s35) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s35)) (meeting-s36) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-36
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s36) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s36)) (meeting-s37) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-37
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s37) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s37)) (meeting-s38) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-38
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s38) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s38)) (meeting-s39) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-39
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s39) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s39)) (meeting-s40) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-40
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s40) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s40)) (meeting-s41) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-41
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s41) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s41)) (meeting-s42) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-42
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s42) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s42)) (meeting-s43) (not (at-time ?t)) (at-time ?t2))
  )
  (:action progress-meeting-43
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (meeting-s43) (friend-at margaret ?loc) (at ?a ?loc) (at-time ?t) (succ ?t ?t2) (in-window ?t))
    :effect (and (not (meeting-s43)) (meeting-s44) (not (at-time ?t)) (at-time ?t2))
  )

  ; Complete the meeting at the 45th minute boundary, ensuring the last in-window minute (t=644) is respected
  (:action complete-meeting-45
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (meeting-s44)
      (friend-at margaret ?loc)
      (at ?a ?loc)
      (at-time ?t)
      (succ ?t ?t2)
      (in-window ?t)  ; forces the final minute start (t=644) to be within the window
    )
    :effect (and
      (not (meeting-s44))
      (met margaret)
      (free)
      (not (at-time ?t)) (at-time ?t2)
    )
  )
)