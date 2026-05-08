(define (problem visit-kenneth)
  (:domain meeting-domain)

  (:objects
    visitor - agent
    fishermans_wharf nob_hill - location
    ;; times in minutes since midnight:
    ;; t540 = 09:00, t844 = 14:04, t855 = 14:15, t945 = 15:45, t1185 = 19:45
    t540 t844 t855 t945 t1185 - time
  )

  (:init
    ;; initial location/time
    (at visitor fishermans_wharf t540)

    ;; discrete time ordering (successor relation)
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

    ;; Kenneth's availability windows and allowed meeting plans that satisfy minimum durations.
    ;; Kenneth available 14:15 (t855) through 19:45 (t1185).
    ;; Minimum meeting 90 minutes: allow plan t855 -> t945 (90 minutes).
    ;; Also allow extended contiguous plan t855 -> t1185 (14:15 - 19:45).
    (allowed_meeting t855 t945)
    (allowed_meeting t855 t1185)

    ;; Allowed per-step transitions for each declared meeting plan to enforce contiguous occupancy.
    ;; For the 90-minute plan (t855 -> t945) a single contiguous step.
    (allowed_meeting_step t855 t945 t855 t945)

    ;; For the extended plan (t855 -> t1185) enforce contiguous steps: t855->t945 and t945->t1185
    (allowed_meeting_step t855 t945 t855 t1185)
    (allowed_meeting_step t945 t1185 t855 t1185)
  )

  ;; Goal: have completed a compliant meeting with Kenneth (minimum duration and within availability)
  (:goal (met_kenneth))
)