(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    visitor barbara - agent
    bayview golden_gate_park - location
    t0900 t0922 t1052 t1115 - time
  )

  (:init
    ;; Start location and time
    (at visitor bayview t0900)

    ;; Explicit successor links representing contiguous intervals.
    (succ t0900 t0922)
    (succ t0922 t1052)
    (succ t1052 t1115)

    ;; Declared travel legs (exact allowed depart->arrive pairs).
    (travel_leg bayview golden_gate_park t0900 t0922)   ;; 22 minutes
    (travel_leg golden_gate_park bayview t1052 t1115)   ;; 23 minutes

    ;; Barbara's availability encoded at the interval endpoints used for the meeting.
    (barbara_present golden_gate_park t0922)
    (barbara_present golden_gate_park t1052)
  )

  (:goal
    (and
      ;; Record a contiguous meeting interval with Barbara that spans the chosen timepoints.
      (met_with_barbara visitor t0922 t1052)
      ;; Visitor must return to Bayview by the declared arrival time.
      (at visitor bayview t1115)
    )
  )
)