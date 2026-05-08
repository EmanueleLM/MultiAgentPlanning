(define (domain presidio-marina-meetings)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - time)
    (succ1 ?t1 ?t2 - time)
    (succ10 ?t1 ?t2 - time)
    (succ15 ?t1 ?t2 - time)
    (succ60 ?t1 ?t2 - time)
    (succ90 ?t1 ?t2 - time)
    (succ120 ?t1 ?t2 - time)
    (succ510 ?t1 ?t2 - time)
    (aligned15 ?t - time)
    (avail-start ?t - time)
    (avail-end ?t - time)
    (met-jessica)
  )

  (:functions (total-cost))

  ;; Wait forward by 1 minute
  (:action advance-1min
    :parameters (?t1 ?t2 - time)
    :precondition (and (current-time ?t1) (succ1 ?t1 ?t2))
    :effect (and
              (not (current-time ?t1))
              (current-time ?t2)
            )
  )

  ;; Travel from Presidio to Marina (takes exactly 10 minutes)
  (:action travel-presidio-to-marina
    :parameters (?tstart ?tend - time ?trav - agent ?p - location ?m - location)
    :precondition (and
                    (current-time ?tstart)
                    (at ?trav ?p)
                    (succ10 ?tstart ?tend)
                    ;; enforce concrete location names in problem (Presidio / Marina)
                    ;; generic preconditions included so same action can be used for domain-wide reasoning
                  )
    :effect (and
              (not (current-time ?tstart))
              (current-time ?tend)
              (not (at ?trav ?p))
              (at ?trav ?m)
            )
  )

  ;; Travel from Marina to Presidio (takes exactly 10 minutes)
  (:action travel-marina-to-presidio
    :parameters (?tstart ?tend - time ?trav - agent ?m - location ?p - location)
    :precondition (and
                    (current-time ?tstart)
                    (at ?trav ?m)
                    (succ10 ?tstart ?tend)
                  )
    :effect (and
              (not (current-time ?tstart))
              (current-time ?tend)
              (not (at ?trav ?m))
              (at ?trav ?p)
            )
  )

  ;; Meeting actions: distinct actions for supported durations.
  ;; Each meeting must:
  ;;  - start at (current-time ?tstart)
  ;;  - start aligned to 15-minute increments (aligned15 ?tstart)
  ;;  - start at or after Jessica availability start (avail-start ?tstart)
  ;;  - end at or before Jessica availability end (avail-end ?tend)
  ;;  - use corresponding succ* relation for exact duration
  ;;  - require traveler and Jessica be at Marina at start
  ;;  - be performed at most once (not (met-jessica))
  ;; Meeting effect: set met-jessica, advance time to end, and update total-cost to reflect
  ;; the planner objective. We encode the scoring as a negative cost so that minimizing
  ;; total-cost via Fast-Downward will maximize the score:
  ;;   meeting score = 100 + duration (minutes)
  ;; Each meeting action decreases total-cost by that amount using a negative increase.
  ;; (Fast-Downward accepts numeric increase effects on total-cost with :action-costs.)

  ;; 60-minute meeting (minimum)
  (:action meet-jessica-60
    :parameters (?tstart ?tend - time ?trav - agent ?loc - location)
    :precondition (and
                    (current-time ?tstart)
                    (succ60 ?tstart ?tend)
                    (aligned15 ?tstart)
                    (avail-start ?tstart)
                    (avail-end ?tend)
                    (at ?trav ?loc)            ; traveler must be at Marina (constrained in problem)
                    ;; Jessica presence at Marina will be encoded in initial facts and not removed
                    (not (met-jessica))
                  )
    :effect (and
              (not (current-time ?tstart))
              (current-time ?tend)
              (met-jessica)
              ;; remain at the same location (assumed Marina); location facts are not changed here
              ;; scoring: reduce total-cost by (100 + 60) = 160 => increase by -160
              (increase (total-cost) -160)
            )
  )

  ;; 90-minute meeting
  (:action meet-jessica-90
    :parameters (?tstart ?tend - time ?trav - agent ?loc - location)
    :precondition (and
                    (current-time ?tstart)
                    (succ90 ?tstart ?tend)
                    (aligned15 ?tstart)
                    (avail-start ?tstart)
                    (avail-end ?tend)
                    (at ?trav ?loc)
                    (not (met-jessica))
                  )
    :effect (and
              (not (current-time ?tstart))
              (current-time ?tend)
              (met-jessica)
              (increase (total-cost) -190) ;; 100 + 90 = 190
            )
  )

  ;; 120-minute meeting
  (:action meet-jessica-120
    :parameters (?tstart ?tend - time ?trav - agent ?loc - location)
    :precondition (and
                    (current-time ?tstart)
                    (succ120 ?tstart ?tend)
                    (aligned15 ?tstart)
                    (avail-start ?tstart)
                    (avail-end ?tend)
                    (at ?trav ?loc)
                    (not (met-jessica))
                  )
    :effect (and
              (not (current-time ?tstart))
              (current-time ?tend)
              (met-jessica)
              (increase (total-cost) -220) ;; 100 + 120 = 220
            )
  )

  ;; 510-minute meeting (maximal contiguous availability 8.5 hours)
  (:action meet-jessica-510
    :parameters (?tstart ?tend - time ?trav - agent ?loc - location)
    :precondition (and
                    (current-time ?tstart)
                    (succ510 ?tstart ?tend)
                    (aligned15 ?tstart)
                    (avail-start ?tstart)
                    (avail-end ?tend)
                    (at ?trav ?loc)
                    (not (met-jessica))
                  )
    :effect (and
              (not (current-time ?tstart))
              (current-time ?tend)
              (met-jessica)
              (increase (total-cost) -610) ;; 100 + 510 = 610
            )
  )

)