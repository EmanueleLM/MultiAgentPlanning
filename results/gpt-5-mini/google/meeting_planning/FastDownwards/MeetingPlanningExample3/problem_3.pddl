(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    visitor barbara - agent
    bayview golden_gate_park - location
    t0900 t0922 t1052 t1115 - time
  )

  (:init
    ;; Start location and time: you arrive at Bayview at 09:00.
    (at visitor bayview t0900)

    ;; Temporal order / contiguous intervals used in this instance.
    ;; These symbolic timepoints encode the travel and meeting windows used below.
    (succ t0900 t0922)   ;; 22 minutes later
    (succ t0922 t1052)   ;; 90 minutes later (meeting duration)
    (succ t1052 t1115)   ;; 23 minutes later

    ;; Declared travel legs (must match the depart/arrive timepoints used).
    ;; Bayview -> Golden Gate Park: 22 minutes (depart t0900 arrive t0922)
    (travel_leg bayview golden_gate_park t0900 t0922)
    ;; Golden Gate Park -> Bayview: 23 minutes (depart t1052 arrive t1115)
    (travel_leg golden_gate_park bayview t1052 t1115)

    ;; Barbara's availability: she is at Golden Gate Park over the meeting endpoints used.
    ;; This encodes that Barbara is present at the start and end of the meeting interval.
    (barbara_present golden_gate_park t0922)
    (barbara_present golden_gate_park t1052)
  )

  (:goal
    (and
      ;; Achieve a meeting with Barbara that spans the declared interval (enforces the minimum 90 minutes).
      (met_with_barbara visitor t0922 t1052)

      ;; Visitor returns to Bayview by the declared arrival time (after meeting and return travel).
      (at visitor bayview t1115)
    )
  )
)