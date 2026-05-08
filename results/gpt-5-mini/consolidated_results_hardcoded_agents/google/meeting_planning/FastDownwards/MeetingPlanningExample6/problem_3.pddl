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

    ;; Declared successor stage for waiting from 09:00 to 14:04 (contiguous idle occupancy).
    (next t540 t844)

    ;; Travel edges represent the exact 11-minute travel hops.
    ;; To arrive exactly at 14:15 (t855) when departing at 14:04 (t844), include this travel_edge.
    (travel_edge t844 t855)

    ;; Allowed meeting intervals for Kenneth:
    ;; Kenneth is available from t855 (14:15) through t1185 (19:45).
    ;; Enforce the minimum 90-minute meeting by only providing allowed_meeting pairs whose end >= start+90.
    ;; Provide the exact-90 option and the full-window option.
    (allowed_meeting t855 t945)
    (allowed_meeting t855 t1185)
  )

  ;; Goal: meet Kenneth (must hold exactly as specified; meeting action enforces contiguous occupancy and min duration).
  (:goal (met_kenneth))
)