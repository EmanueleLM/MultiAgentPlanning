(define (domain meeting-planning-sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types location slice)

  (:predicates
    (at ?loc - location ?t - slice)            ; agent located at ?loc at slice ?t
    (succ ?t1 - slice ?t2 - slice)             ; immediate successor slice
    (later ?t1 - slice ?t2 - slice)            ; permitted long wait jump (avoids enumerating all intermediate slices)
    (route ?from - location ?to - location)    ; permitted directed travel route (15 min)
    (nancy-available ?t - slice)               ; Nancy is available at slice start ?t
    (is-haight ?loc - location)                ; marks the Haight-Ashbury location
    (met-nancy)                                 ; goal marker: met Nancy for required time
  )

  ;; Travel action: 15-minute directed move from ?from at ?t to ?to at successor ?t2.
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

  ;; Short wait: stay at same location for one successor slice.
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

  ;; Long wait (allowed jump): stay at same location across many unused intermediate slices.
  ;; Uses the explicit (later ?t ?t2) relation so we don't need to enumerate all intermediate succ facts.
  (:action wait-to
    :parameters (?loc - location ?t - slice ?t2 - slice)
    :precondition (and
      (at ?loc ?t)
      (later ?t ?t2)
    )
    :effect (and
      (not (at ?loc ?t))
      (at ?loc ?t2)
    )
  )

  ;; Meeting actions that assert contiguous occupancy at Haight-Ashbury and set met-nancy.
  ;; meet-5 : 5 slices = 75 minutes (occupies s0..s4, ends at s5)
  (:action meet-5
    :parameters (?loc - location ?s0 - slice ?s1 - slice ?s2 - slice ?s3 - slice ?s4 - slice ?s5 - slice)
    :precondition (and
      (is-haight ?loc)
      (at ?loc ?s0)
      (succ ?s0 ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4) (succ ?s4 ?s5)
      (nancy-available ?s0) (nancy-available ?s1) (nancy-available ?s2) (nancy-available ?s3) (nancy-available ?s4)
    )
    :effect (and
      (not (at ?loc ?s0))
      (at ?loc ?s1) (at ?loc ?s2) (at ?loc ?s3) (at ?loc ?s4) (at ?loc ?s5)
      (met-nancy)
    )
  )

  ;; meet-9 : 9 slices = 135 minutes (occupies s0..s8, ends at s9) - covers full confirmed window
  (:action meet-9
    :parameters (?loc - location ?s0 - slice ?s1 - slice ?s2 - slice ?s3 - slice ?s4 - slice ?s5 - slice ?s6 - slice ?s7 - slice ?s8 - slice ?s9 - slice)
    :precondition (and
      (is-haight ?loc)
      (at ?loc ?s0)
      (succ ?s0 ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4) (succ ?s4 ?s5) (succ ?s5 ?s6) (succ ?s6 ?s7) (succ ?s7 ?s8) (succ ?s8 ?s9)
      (nancy-available ?s0) (nancy-available ?s1) (nancy-available ?s2) (nancy-available ?s3) (nancy-available ?s4) (nancy-available ?s5) (nancy-available ?s6) (nancy-available ?s7) (nancy-available ?s8)
    )
    :effect (and
      (not (at ?loc ?s0))
      (at ?loc ?s1) (at ?loc ?s2) (at ?loc ?s3) (at ?loc ?s4) (at ?loc ?s5) (at ?loc ?s6) (at ?loc ?s7) (at ?loc ?s8) (at ?loc ?s9)
      (met-nancy)
    )
  )
)