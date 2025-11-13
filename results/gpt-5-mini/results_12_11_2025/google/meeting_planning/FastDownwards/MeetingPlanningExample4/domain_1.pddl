(define (domain MeetingPlanningExample4)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time friend)

  (:predicates
    (at ?loc - location ?t - time)                ; you are at location at a specific time
    (present ?f - friend ?loc - location ?t - time) ; friend present at loc at time
    (succ ?t1 - time ?t2 - time)                 ; t2 is the immediate next time step after t1
    (met ?f - friend)                            ; you have met friend for required duration
  )

  ;; Wait: stay at the same location from one time step to the immediate next.
  (:action wait
    :parameters (?loc - location ?t - time ?t1 - time)
    :precondition (and (at ?loc ?t) (succ ?t ?t1))
    :effect (and (at ?loc ?t1))
  )

  ;; Move: travel from one location to another consuming exactly two time steps (10 minutes).
  (:action move
    :parameters (?from - location ?to - location ?t - time ?t1 - time ?t2 - time)
    :precondition (and (at ?from ?t) (succ ?t ?t1) (succ ?t1 ?t2))
    :effect (and (at ?to ?t2))
  )

  ;; Meet: meet a friend for a contiguous block of 12 consecutive 5-minute steps = 60 minutes.
  ;; The action requires that both you and the friend are at the same location for each of the 12 consecutive steps.
  ;; We explicitly enumerate the 12 time parameters t0..t11 and require the succ chain between them.
  (:action meet-60min
    :parameters (?f - friend ?loc - location
                 ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
                 ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time)
    :precondition (and
      ;; contiguous chain of 11 successor relations to cover 12 consecutive steps
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4) (succ ?t4 ?t5)
      (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8) (succ ?t8 ?t9) (succ ?t9 ?t10)
      (succ ?t10 ?t11)
      ;; the friend must be present at the location for every step
      (present ?f ?loc ?t0) (present ?f ?loc ?t1) (present ?f ?loc ?t2) (present ?f ?loc ?t3)
      (present ?f ?loc ?t4) (present ?f ?loc ?t5) (present ?f ?loc ?t6) (present ?f ?loc ?t7)
      (present ?f ?loc ?t8) (present ?f ?loc ?t9) (present ?f ?loc ?t10) (present ?f ?loc ?t11)
      ;; you must be at the same location at each of those times
      (at ?loc ?t0) (at ?loc ?t1) (at ?loc ?t2) (at ?loc ?t3)
      (at ?loc ?t4) (at ?loc ?t5) (at ?loc ?t6) (at ?loc ?t7)
      (at ?loc ?t8) (at ?loc ?t9) (at ?loc ?t10) (at ?loc ?t11)
    )
    :effect (and (met ?f))
  )
)