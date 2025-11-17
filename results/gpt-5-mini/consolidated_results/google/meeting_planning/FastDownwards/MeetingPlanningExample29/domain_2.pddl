(define (domain meeting-planning-sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types location slice)

  (:predicates
    ;; Agent/location/time predicates: at ?loc at the start of slice ?t
    (at ?loc - location ?t - slice)

    ;; Immediate successor relation between slices
    (succ ?t1 - slice ?t2 - slice)

    ;; Permitted directed travel routes
    (route ?from - location ?to - location)

    ;; Nancy availability at slice start
    (nancy-available ?t - slice)

    ;; Marker for the Haight-Ashbury location (keeps meet actions parameterized)
    (is-haight ?loc - location)

    ;; Achievement predicate: met the minimum required time with Nancy
    (met-nancy)
  )

  ;; Travel action: takes one slice (15 minutes) via the succ link.
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

  ;; Wait action: stay at same location for one slice
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

  ;; Meeting actions: contiguous occupancy at a Haight-Ashbury location for a fixed number
  ;; of consecutive slices. Each meet-N requires starting at ?loc at slice ?s0 and that Nancy
  ;; be available at each occupied slice. Effects establish occupancy on each intermediate
  ;; slice (contiguous) and set the met-nancy goal flag.

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
      ;; remove presence at the initial slice and assert presence at each subsequent slice,
      ;; enforcing contiguous occupancy during the meeting, and mark meeting achieved.
      (not (at ?loc ?s0))
      (at ?loc ?s1) (at ?loc ?s2) (at ?loc ?s3) (at ?loc ?s4) (at ?loc ?s5)
      (met-nancy)
    )
  )

  ;; meet-6 : 6 slices = 90 minutes (occupies s0..s5, ends at s6)
  (:action meet-6
    :parameters (?loc - location ?s0 - slice ?s1 - slice ?s2 - slice ?s3 - slice ?s4 - slice ?s5 - slice ?s6 - slice)
    :precondition (and
      (is-haight ?loc)
      (at ?loc ?s0)
      (succ ?s0 ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4) (succ ?s4 ?s5) (succ ?s5 ?s6)
      (nancy-available ?s0) (nancy-available ?s1) (nancy-available ?s2) (nancy-available ?s3) (nancy-available ?s4) (nancy-available ?s5)
    )
    :effect (and
      (not (at ?loc ?s0))
      (at ?loc ?s1) (at ?loc ?s2) (at ?loc ?s3) (at ?loc ?s4) (at ?loc ?s5) (at ?loc ?s6)
      (met-nancy)
    )
  )

  ;; meet-7 : 7 slices = 105 minutes (occupies s0..s6, ends at s7)
  (:action meet-7
    :parameters (?loc - location ?s0 - slice ?s1 - slice ?s2 - slice ?s3 - slice ?s4 - slice ?s5 - slice ?s6 - slice ?s7 - slice)
    :precondition (and
      (is-haight ?loc)
      (at ?loc ?s0)
      (succ ?s0 ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4) (succ ?s4 ?s5) (succ ?s5 ?s6) (succ ?s6 ?s7)
      (nancy-available ?s0) (nancy-available ?s1) (nancy-available ?s2) (nancy-available ?s3) (nancy-available ?s4) (nancy-available ?s5) (nancy-available ?s6)
    )
    :effect (and
      (not (at ?loc ?s0))
      (at ?loc ?s1) (at ?loc ?s2) (at ?loc ?s3) (at ?loc ?s4) (at ?loc ?s5) (at ?loc ?s6) (at ?loc ?s7)
      (met-nancy)
    )
  )

  ;; meet-8 : 8 slices = 120 minutes (occupies s0..s7, ends at s8)
  (:action meet-8
    :parameters (?loc - location ?s0 - slice ?s1 - slice ?s2 - slice ?s3 - slice ?s4 - slice ?s5 - slice ?s6 - slice ?s7 - slice ?s8 - slice)
    :precondition (and
      (is-haight ?loc)
      (at ?loc ?s0)
      (succ ?s0 ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4) (succ ?s4 ?s5) (succ ?s5 ?s6) (succ ?s6 ?s7) (succ ?s7 ?s8)
      (nancy-available ?s0) (nancy-available ?s1) (nancy-available ?s2) (nancy-available ?s3) (nancy-available ?s4) (nancy-available ?s5) (nancy-available ?s6) (nancy-available ?s7)
    )
    :effect (and
      (not (at ?loc ?s0))
      (at ?loc ?s1) (at ?loc ?s2) (at ?loc ?s3) (at ?loc ?s4) (at ?loc ?s5) (at ?loc ?s6) (at ?loc ?s7) (at ?loc ?s8)
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