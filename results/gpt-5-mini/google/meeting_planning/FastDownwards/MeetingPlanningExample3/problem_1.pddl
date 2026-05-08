(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    visitor barbara - agent
    bayview golden_gate_park - location
    t0900 t0922 t1052 t1115 - time
  )

  (:init
    ;; Initial location and time
    (at visitor bayview t0900)

    ;; Declared successor ordering between the timepoints used in the schedule.
    ;; These succ facts make time progression explicit and enforce contiguous occupancy
    ;; over any interval that is represented by a single succ pair.
    (succ t0900 t0922)
    (succ t0922 t1052)
    (succ t1052 t1115)

    ;; Travel legs encode exact permitted departure->arrival timepairs (no slack).
    ;; Bayview -> Golden Gate Park: depart t0900 arrive t0922 (22 minutes)
    (travel-leg bayview golden_gate_park t0900 t0922)
    ;; Golden Gate Park -> Bayview: depart t1052 arrive t1115 (23 minutes)
    (travel-leg golden_gate_park bayview t1052 t1115)

    ;; Barbara's availability is encoded at the timepoints used by the chosen meeting interval.
    ;; Ensuring presence at both interval endpoints plus the existence of a succ link means
    ;; the meeting interval is within Barbara's availability window and is contiguous.
    (barbara-present golden_gate_park t0922)
    (barbara-present golden_gate_park t1052)
  )

  (:goal
    (and
      ;; Visitor must have a recorded continuous meeting with Barbara spanning the chosen interval.
      (met-with-barbara visitor t0922 t1052)
      ;; Visitor must end back at Bayview at the scheduled arrival time after travel back.
      (at visitor bayview t1115)
    )
  )
)