(define (problem visit-kenneth)
  (:domain meeting-domain)

  (:objects
    visitor - agent
    fishermans_wharf nob_hill - location
    ;; timepoints (minutes since midnight): 09:00=540, 14:04=844, 14:15=855, 15:45=945 (855+90), 19:45=1185
    t540 t844 t855 t945 t1185 - time
  )

  (:init
    ;; Initial location/time.
    (at visitor fishermans_wharf t540)

    ;; Time ordering (successor relation).
    (next t540 t844)
    (next t844 t855)
    (next t855 t945)
    (next t945 t1185)

    ;; Travel edge modeling the 11-minute hop from t844 to t855.
    (travel_edge t844 t855)

    ;; Kenneth's availability and allowed meeting start/end pairs (enforce minimum 90 minutes).
    (allowed_meeting t855 t945)   ;; 90-minute meeting (855 -> 945)
    (allowed_meeting t855 t1185)  ;; extended meeting (855 -> 1185)

    ;; Allowed per-step transitions for each declared meeting plan to enforce contiguous occupancy.
    (allowed_meeting_step t855 t945 t855 t945)

    (allowed_meeting_step t855 t945 t855 t1185)
    (allowed_meeting_step t945 t1185 t855 t1185)
  )

  (:goal (met_kenneth))
)