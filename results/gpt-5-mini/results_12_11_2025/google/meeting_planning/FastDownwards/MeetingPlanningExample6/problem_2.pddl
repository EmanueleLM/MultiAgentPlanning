(define (problem visit-kenneth)
  (:domain meeting-domain)

  (:objects
    visitor - agent
    fishermans_wharf nob_hill - location
    t540 t844 t855 t1185 - time
  )

  (:init
    ;; Initial location and time: 09:00 = 540 minutes since midnight
    (at visitor fishermans_wharf t540)

    ;; Temporal next edge allowing waiting from 09:00 to 14:04 (contiguous occupancy while idle)
    ;; This is a single declared "next" stage (no other intermediate timepoints are provided),
    ;; so waiting from t540 to t844 is an explicit allowed stage jump.
    (next t540 t844)

    ;; Travel edges must represent exact 11-minute hops. Kenneth is at Nob Hill at 14:15 (t855).
    ;; To arrive exactly at 14:15, include the travel_edge from 14:04 (t844) to 14:15 (t855).
    (travel_edge t844 t855)

    ;; The meeting must be contiguous and lie within Kenneth's availability [14:15 (t855) .. 19:45 (t1185)]
    ;; and be at least 90 minutes long. We provide the full-window allowed_meeting pair for a 330-minute meeting.
    (allowed_meeting t855 t1185)

    ;; Note: no travel_edge exists from t540->t844, so travel cannot be used to jump directly from 09:00 to 14:04.
    ;; The planner must use wait on next edges and only use travel_edge facts for 11-minute travel hops.
  )

  ;; Goal: meet Kenneth (met_kenneth must hold). The schedule must execute a contiguous schedule_meeting_kenneth
  ;; action that respects the availability and minimum duration encoded in allowed_meeting.
  (:goal (met_kenneth))
)