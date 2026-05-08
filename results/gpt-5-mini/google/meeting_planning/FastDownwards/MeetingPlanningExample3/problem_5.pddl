(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    planner barbara auditor orchestrator - agent
    bayview golden_gate_park - location
    t0900 t0922 t1052 t1115 - time
  )

  (:init
    ;; Start location and time: planner arrives at Bayview at 09:00.
    (at planner bayview t0900)

    ;; Barbara's presence encoded using the agent location predicate at the meeting endpoints
    ;; (within her 08:00-11:30 window for these symbolic points).
    (at barbara golden_gate_park t0922)
    (at barbara golden_gate_park t1052)

    ;; Symbolic temporal ordering used in this instance:
    ;; - 22 minutes from 09:00 -> 09:22
    ;; - 90 minutes meeting interval from 09:22 -> 10:52
    ;; - 23 minutes return from 10:52 -> 11:15
    (succ t0900 t0922)
    (succ t0922 t1052)
    (succ t1052 t1115)

    ;; Declared travel legs matching the symbolic timepoints.
    (travel_leg bayview golden_gate_park t0900 t0922)
    (travel_leg golden_gate_park bayview t1052 t1115)
  )

  (:goal
    (and
      ;; Achieve a meeting between planner and Barbara spanning the declared 90-minute interval.
      (met_with_barbara planner t0922 t1052)

      ;; Planner returns to Bayview by the declared return arrival time after the meeting.
      (at planner bayview t1115)
    )
  )
)