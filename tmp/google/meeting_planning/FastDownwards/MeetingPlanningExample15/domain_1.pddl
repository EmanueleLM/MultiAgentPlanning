(define (domain integrated_scheduling_strips)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs :equality)
  (:types location person schedule time)

  (:predicates
    (at ?l - location)
    (at-user ?l - location)
    (at-john ?l - location)
    (met ?p - person)
    (valid ?s - schedule)

    ;; time/state predicates
    (now ?t - time)
    (succ21 ?t1 - time ?t2 - time)
    (succ19 ?t1 - time ?t2 - time)
    (le ?t1 - time ?t2 - time)

    ;; schedule temporal facts (precomputed in the problem)
    (start-time ?s - schedule ?t - time)
    (end-time ?s - schedule ?t - time)
    (arrive-before ?s - schedule)   ; you can arrive before the schedule start
    (fits-window ?s - schedule)     ; schedule fits within John's availability
    (min-duration ?s - schedule)    ; schedule meets minimum duration requirement
    (john-start ?t - time)
    (john-end ?t - time)
  )

  ;; Travel from Russian Hill to Golden Gate Park (advances time by 21 minutes)
  (:action travel-rh-to-ggp
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at russian_hill)
      (now ?t1)
      (succ21 ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (not (at russian_hill))
      (at golden_gate_park)
    )
    :cost 0
  )

  ;; Travel from Golden Gate Park to Russian Hill (advances time by 19 minutes)
  (:action travel-ggp-to-rh
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at golden_gate_park)
      (now ?t1)
      (succ19 ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (not (at golden_gate_park))
      (at russian_hill)
    )
    :cost 0
  )

  ;; Wait at Golden Gate Park until John's availability start (sets now to John's start time)
  (:action wait-at-ggp-until-john-available
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at golden_gate_park)
      (now ?t1)
      (john-start ?t2)
      (le ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
    )
    :cost 0
  )

  ;; Validate a candidate schedule using precomputed symbolic checks
  (:action validate-schedule
    :parameters (?s - schedule ?from - location ?to - location)
    :precondition (and
      (at-user ?from)
      (at-john ?to)
      (arrive-before ?s)
      (fits-window ?s)
      (min-duration ?s)
    )
    :effect (and
      (valid ?s)
    )
    :cost 0
  )

  ;; Apply a validated schedule: requires current time equals schedule start (discretized)
  ;; Advances time to the schedule's end-time and marks the person met.
  (:action apply-schedule
    :parameters (?s - schedule ?from - location ?to - location ?tstart - time ?tend - time ?p - person)
    :precondition (and
      (valid ?s)
      (at ?to)
      (at-john ?to)
      (start-time ?s ?tstart)
      (end-time ?s ?tend)
      (now ?tstart)
      (met ?p) ; allow repetition-safe effect (met is idempotent); require person object to be bound
      ;; Note: the goal and initial facts will ensure p = john is used in practice
    )
    :effect (and
      (not (now ?tstart))
      (now ?tend)
      (met ?p)
    )
    :cost -1
  )

  ;; A variant of apply-schedule that does not require met predicate preexist (for planners that disallow re-requiring)
  (:action apply-schedule-simple
    :parameters (?s - schedule ?from - location ?to - location ?tstart - time ?tend - time ?p - person)
    :precondition (and
      (valid ?s)
      (at ?to)
      (at-john ?to)
      (start-time ?s ?tstart)
      (end-time ?s ?tend)
      (now ?tstart)
    )
    :effect (and
      (not (now ?tstart))
      (now ?tend)
      (met ?p)
    )
    :cost -1
  )
)