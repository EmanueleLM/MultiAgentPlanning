(define (domain sunset-meetings)
  (:requirements :strips :typing :negative-preconditions)
  (:types location slice)

  (:predicates
    (at ?loc - location ?t - slice)                    ; agent is at location at start of slice ?t
    (succ ?t1 - slice ?t2 - slice)                     ; ?t2 is the immediate successor slice of ?t1
    (route ?from - location ?to - location)            ; permitted directed route (explicitly provided)
    (allowed-depart ?from - location ?to - location ?t - slice) ; only departures at explicitly allowed times
    (nancy-available ?t - slice)                       ; Nancy is present during slice ?t
    (met-nancy)                                        ; Nancy has been met (any duration)
    (met-nancy-5)                                      ; met for 5 slices (75min)
    (met-nancy-6)
    (met-nancy-7)
    (met-nancy-8)
    (met-nancy-9)                                      ; met for 9 slices (135min) — the top-ranked meeting
  )

  ;; Travel consumes a single 15-minute slice: start at ?t, arrive at ?t2 where (succ ?t ?t2).
  ;; Travel is only allowed on explicitly allowed-depart triples (from,to,t).
  (:action travel
    :parameters (?from - location ?to - location ?t - slice ?t2 - slice)
    :precondition (and
      (at ?from ?t)
      (succ ?t ?t2)
      (route ?from ?to)
      (allowed-depart ?from ?to ?t)
    )
    :effect (and
      (not (at ?from ?t))
      (at ?to ?t2)
    )
  )

  ;; Wait advances one slice while staying at the same location
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

  ;; Meeting actions of explicit discrete lengths (5..9 slices). Each requires the agent to be at Haight-Ashbury at the start slice,
  ;; requires Nancy to be available for each occupied slice, consumes N slices and produces presence at Haight at the slice after meeting,
  ;; and sets the corresponding met-nancy-N predicate. Meeting also sets the generic met-nancy flag.
  ;; meet-5 : 75 minutes (5 slices)
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

  ;; meet-6 : 90 minutes
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

  ;; meet-7 : 105 minutes
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

  ;; meet-8 : 120 minutes
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

  ;; meet-9 : 135 minutes (the full-window meeting — top-ranked). This action encodes the largest allowed meeting.
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