(define (problem visit-kenneth)
  (:domain meeting-domain)

  (:objects
    visitor - agent
    fishermans_wharf nob_hill - location
    t540 t844 t855 t945 t1185 - time
  )

  (:init
    ;; initial location/time
    (at visitor fishermans_wharf t540)

    ;; time ordering (successor relation)
    (next t540 t844)
    (next t844 t855)
    (next t855 t945)
    (next t945 t1185)

    ;; travel edge representing the 11-minute travel from 14:04 (t844) to 14:15 (t855)
    (travel_edge t844 t855)

    ;; connectivity between locations
    (connected fishermans_wharf nob_hill)
    (connected nob_hill fishermans_wharf)

    ;; meeting place for Kenneth
    (meeting_place nob_hill)

    ;; Kenneth's availability and allowed meeting start/end pairs enforcing minimum 90 minutes.
    ;; Meeting may start at t855 (14:15). Minimum meeting 90 minutes = until at least t945 (15:45).
    ;; Also allow extended meeting until t1185 (19:45) while respecting contiguous occupancy.
    (allowed_meeting t855 t945)
    (allowed_meeting t855 t1185)

    ;; Allowed per-step transitions for the declared meeting plans to enforce contiguous occupancy.
    ;; For the 90-minute plan (t855 -> t945) this is a single step.
    (allowed_meeting_step t855 t945 t855 t945)

    ;; For the extended plan (t855 -> t1185) enforce contiguous steps: t855->t945 and t945->t1185
    (allowed_meeting_step t855 t945 t855 t1185)
    (allowed_meeting_step t945 t1185 t855 t1185)
  )

  (:goal (met_kenneth))
)