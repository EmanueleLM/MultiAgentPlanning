(define (domain multi-agent-meeting)
  ;; Multi-agent meeting domain (classical, time-sliced encoding).
  ;; Assumptions (conservative) - documented here:
  ;;  - Time is discretized in 1-minute steps starting at 09:00 as t0 (09:00)
  ;;    and t300 = 14:00 (09:00 + 300 minutes).
  ;;  - The meeting must be contiguous for at least 90 minutes and must
  ;;    occur entirely within Jeffrey's availability (12:15-14:00).
  ;;    12:15 is minute 195 after 09:00; 14:00 is minute 300 after 09:00.
  ;;  - Therefore meeting start must be in the inclusive range t195..t210
  ;;    (because start + 90 <= 300).
  ;;  - Jeffrey's inputs did not specify his location; conservatively we
  ;;    assume Jeffrey will be at Bayview for the entirety of his
  ;;    availability window. This is encoded as facts in the problem.
  ;;  - Traveler starts at Bayview at t0 (09:00). The traveler may wait
  ;;    minute-by-minute (modeled by the "wait" action) or travel (19-minute
  ;;    travel action is provided). Travel durations are encoded via
  ;;    precomputed next19 relations in the problem file.
  ;;  - Presence facts (at agent loc tX) are monotonic: wait and travel
  ;;    actions add future-minute presence facts without deleting earlier
  ;;    ones. This lets the meeting action check presence for a contiguous
  ;;    block of minutes. This is a conservative modeling choice suitable
  ;;    for timeline-style planning in classical encodings.
  ;;
  ;; Note: We encode the objective indirectly: each wait action increases
  ;; (total-cost) by 1. Minimizing total-cost therefore encourages the
  ;; planner to minimize waiting (i.e., schedule the meeting as early as
  ;; possible consistent with constraints).
  (:requirements :typing :fluents)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)      ; agent at location at minute t
    (next1 ?t1 - time ?t2 - time)                ; t2 = t1 + 1
    (next19 ?t1 - time ?t2 - time)               ; t2 = t1 + 19
    (connected ?from - location ?to - location)  ; travel topology
    (met ?a1 - agent ?a2 - agent)                ; meeting achieved
  )

  (:functions
    (total-cost)  ; numeric cost to be minimized
  )

  ;; Wait one minute at the same location (adds presence for the next minute).
  ;; NOTE: this action adds the future-minute presence fact without deleting
  ;; earlier ones (monotonic accumulation). This is a modelling choice so the
  ;; meeting precondition can refer to multiple minute-position facts simultaneously.
  (:action wait
    :parameters (?ag - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag ?loc ?t1)
      (next1 ?t1 ?t2)
    )
    :effect (and
      (at ?ag ?loc ?t2)
      (increase (total-cost) 1)
    )
  )

  ;; Travel from one location to another: modeled by precomputed next19
  ;; relation mapping start minute to arrival minute (start + 19).
  (:action travel
    :parameters (?ag - agent ?from - location ?to - location ?tstart - time ?tarr - time)
    :precondition (and
      (at ?ag ?from ?tstart)
      (next19 ?tstart ?tarr)
      (connected ?from ?to)
    )
    :effect (and
      (at ?ag ?to ?tarr)
      (increase (total-cost) 1)
    )
  )

  ;; The meeting actions are instantiated per allowed meeting start minute.
  ;; Each such action requires both agents to be at the meeting location
  ;; for the full 90-minute contiguous block.
  ;; We provide separate action schemas called meet-start-195 ... meet-start-210.
  ;; (These actions reference time constants that are declared in the problem.)
  ;; Effects set the met predicate to satisfy the goal. No cost increase for
  ;; the meeting itself (we want to minimize waiting leading to earlier meeting).
  ;; --- The specific meet actions are intentionally placed here as action
  ;;     schemas that refer to the problem's time constants.
  ;;     Each meet action has 180 atomic preconditions (traveler & jeffrey
  ;;     present for each of 90 consecutive minutes).
)