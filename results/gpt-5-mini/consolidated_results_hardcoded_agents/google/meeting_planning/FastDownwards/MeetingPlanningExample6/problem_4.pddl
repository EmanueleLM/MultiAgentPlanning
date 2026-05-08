(define (problem visit-kenneth)
  (:domain meeting-domain)

  (:objects
    visitor - agent
    fishermans_wharf nob_hill - location
    ;; timepoints (minutes since midnight): 09:00=540, 14:04=844, 14:15=855, 15:45=945 (855+90), 19:45=1185
    t540 t844 t855 t945 t1185 - time
  )

  (:init
    ;; Initial location and time: at Fisherman's Wharf at 09:00 (t540)
    (at visitor fishermans_wharf t540)

    ;; Ordered time stages (successor relation). These enforce explicit stage progression.
    (next t540 t844)
    (next t844 t855)
    (next t855 t945)
    (next t945 t1185)

    ;; Travel edge: represents the 11-minute travel hop that gets you from t844 to t855.
    (travel_edge t844 t855)

    ;; Allowed contiguous meeting intervals for Kenneth at Nob Hill.
    ;; Kenneth is available from 14:15 (t855) through 19:45 (t1185).
    ;; Only provide allowed meeting pairs that satisfy the minimum 90-minute meeting duration.
    (allowed_meeting t855 t945)
    (allowed_meeting t855 t1185)
  )

  ;; Goal: must have met Kenneth (the plan must perform a contiguous meeting block that satisfies availability and minimum duration).
  (:goal (met_kenneth))
)