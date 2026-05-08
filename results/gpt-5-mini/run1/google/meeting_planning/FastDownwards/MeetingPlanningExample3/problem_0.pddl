(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    visitor barbara - agent
    bayview golden_gate_park - location
    t0900 t0922 t1130 t1153 - time
  )

  (:init
    ;; Starting condition: visitor is at Bayview at 09:00 and may depart at/after this time.
    (at visitor bayview t0900)

    ;; Travel legs (deterministic). These facts encode exact permitted departure/arrival timepoints
    ;; corresponding to the known fixed travel durations.
    ;; Bayview -> Golden Gate Park: depart t0900, arrive t0922 (22 minutes)
    (travel-leg bayview golden_gate_park t0900 t0922)
    ;; Golden Gate Park -> Bayview: depart t1130, arrive t1153 (23 minutes)
    (travel-leg golden_gate_park bayview t1130 t1153)

    ;; Barbara availability constraints encoded only at the timepoints used by the chosen schedule.
    ;; Barbara present at GGP at meeting start and at meeting end (ensures continuous presence across interval).
    (barbara-present golden_gate_park t0922)
    (barbara-present golden_gate_park t1130)

    ;; Meeting slot: the only allowed meeting interval. This enforces the minimum duration (>= 90 minutes)
    ;; and that the meeting ends no later than Barbara's departure time 11:30.
    (meeting-slot t0922 t1130)
  )

  (:goal
    (and
      ;; The plan must explicitly produce the meeting record for the exact chosen interval.
      (met-with-barbara visitor t0922 t1130)
      ;; The visitor must finish back at Bayview at the scheduled arrival time (11:53).
      (at visitor bayview t1153)
    )
  )
)