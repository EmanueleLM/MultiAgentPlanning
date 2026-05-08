(define (domain meeting-planning-sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types location slice)

  (:predicates
    ;; Agent/location/time predicates
    (at ?loc - location ?t - slice)           ; agent is at location at start of slice ?t
    (succ ?t1 - slice ?t2 - slice)            ; immediate successor slice

    ;; City graph edges
    (route ?from - location ?to - location)   ; permitted directed route

    ;; Nancy availability per slice
    (nancy-available ?t - slice)

    ;; Meeting achievement flags
    (met-nancy)                               ; met Nancy for at least the minimum required time
    (met-nancy-5)                             ; met for exactly 5 slices (75 min)
    (met-nancy-6)                             ; 90 min
    (met-nancy-7)                             ; 105 min
    (met-nancy-8)                             ; 120 min
    (met-nancy-9)                             ; 135 min
  )

  ;; Travel action: consumes one 15-minute slice (succ relation).
  (:action travel
    :parameters (?from - location ?to - location ?t - slice ?t2 - slice)
    :precondition (and
      (at ?from ?t)
      (succ ?t ?t2)
      (route ?from ?to)
    )
    :effect (and
      (not (at ?from ?t))
      (at ?to ?t2)
    )
  )

  ;; Wait: stay at same location for one slice
  (:action wait
    :parameters (?loc - location ?t - slice ?t2 - slice)
    :precondition (and
      (at ?loc ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (at ?loc ?t))
      (at ?loc ?t2)
    )
  )

  ;; Meeting actions: discrete meeting durations from 5 to 9 slices (75..135 minutes).
  ;; Each meet-N requires starting at Haight-Ashbury at slice s0, having successive slices,
  ;; and Nancy being available on each occupied slice. Effects place the agent at Haight
  ;; at the slice after the last occupied slice and set met-nancy and the corresponding met-nancy-N flag.

  ;; meet-5 : 5 slices = 75 minutes
  (:action meet-5
    :parameters (?s0 - slice ?s1 - slice ?s2 - slice ?s3 - slice ?s4 - slice ?s5 - slice)
    :precondition (and
      (at haight_ashbury ?s0)
      (succ ?s0 ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4) (succ ?s4 ?s5)
      (nancy-available ?s0) (nancy-available ?s1) (nancy-available ?s2) (nancy-available ?s3) (nancy-available ?s4)
    )
    :effect (and
      (not (at haight_ashbury ?s0))
      (at haight_ashbury ?s1) (at haight_ashbury ?s2) (at haight_ashbury ?s3) (at haight_ashbury ?s4) (at haight_ashbury ?s5)
      (met-nancy) (met-nancy-5)
    )
  )

  ;; meet-6 : 6 slices = 90 minutes
  (:action meet-6
    :parameters (?s0 - slice ?s1 - slice ?s2 - slice ?s3 - slice ?s4 - slice ?s5 - slice ?s6 - slice)
    :precondition (and
      (at haight_ashbury ?s0)
      (succ ?s0 ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4) (succ ?s4 ?s5) (succ ?s5 ?s6)
      (nancy-available ?s0) (nancy-available ?s1) (nancy-available ?s2) (nancy-available ?s3) (nancy-available ?s4) (nancy-available ?s5)
    )
    :effect (and
      (not (at haight_ashbury ?s0))
      (at haight_ashbury ?s1) (at haight_ashbury ?s2) (at haight_ashbury ?s3) (at haight_ashbury ?s4) (at haight_ashbury ?s5) (at haight_ashbury ?s6)
      (met-nancy) (met-nancy-6)
    )
  )

  ;; meet-7 : 7 slices = 105 minutes
  (:action meet-7
    :parameters (?s0 - slice ?s1 - slice ?s2 - slice ?s3 - slice ?s4 - slice ?s5 - slice ?s6 - slice ?s7 - slice)
    :precondition (and
      (at haight_ashbury ?s0)
      (succ ?s0 ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4) (succ ?s4 ?s5) (succ ?s5 ?s6) (succ ?s6 ?s7)
      (nancy-available ?s0) (nancy-available ?s1) (nancy-available ?s2) (nancy-available ?s3) (nancy-available ?s4) (nancy-available ?s5) (nancy-available ?s6)
    )
    :effect (and
      (not (at haight_ashbury ?s0))
      (at haight_ashbury ?s1) (at haight_ashbury ?s2) (at haight_ashbury ?s3) (at haight_ashbury ?s4) (at haight_ashbury ?s5) (at haight_ashbury ?s6) (at haight_ashbury ?s7)
      (met-nancy) (met-nancy-7)
    )
  )

  ;; meet-8 : 8 slices = 120 minutes
  (:action meet-8
    :parameters (?s0 - slice ?s1 - slice ?s2 - slice ?s3 - slice ?s4 - slice ?s5 - slice ?s6 - slice ?s7 - slice ?s8 - slice)
    :precondition (and
      (at haight_ashbury ?s0)
      (succ ?s0 ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4) (succ ?s4 ?s5) (succ ?s5 ?s6) (succ ?s6 ?s7) (succ ?s7 ?s8)
      (nancy-available ?s0) (nancy-available ?s1) (nancy-available ?s2) (nancy-available ?s3) (nancy-available ?s4) (nancy-available ?s5) (nancy-available ?s6) (nancy-available ?s7)
    )
    :effect (and
      (not (at haight_ashbury ?s0))
      (at haight_ashbury ?s1) (at haight_ashbury ?s2) (at haight_ashbury ?s3) (at haight_ashbury ?s4) (at haight_ashbury ?s5) (at haight_ashbury ?s6) (at haight_ashbury ?s7) (at haight_ashbury ?s8)
      (met-nancy) (met-nancy-8)
    )
  )

  ;; meet-9 : 9 slices = 135 minutes (full available window)
  (:action meet-9
    :parameters (?s0 - slice ?s1 - slice ?s2 - slice ?s3 - slice ?s4 - slice ?s5 - slice ?s6 - slice ?s7 - slice ?s8 - slice ?s9 - slice)
    :precondition (and
      (at haight_ashbury ?s0)
      (succ ?s0 ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4) (succ ?s4 ?s5) (succ ?s5 ?s6) (succ ?s6 ?s7) (succ ?s7 ?s8) (succ ?s8 ?s9)
      (nancy-available ?s0) (nancy-available ?s1) (nancy-available ?s2) (nancy-available ?s3) (nancy-available ?s4) (nancy-available ?s5) (nancy-available ?s6) (nancy-available ?s7) (nancy-available ?s8)
    )
    :effect (and
      (not (at haight_ashbury ?s0))
      (at haight_ashbury ?s1) (at haight_ashbury ?s2) (at haight_ashbury ?s3) (at haight_ashbury ?s4) (at haight_ashbury ?s5) (at haight_ashbury ?s6) (at haight_ashbury ?s7) (at haight_ashbury ?s8) (at haight_ashbury ?s9)
      (met-nancy) (met-nancy-9)
    )
  )
)