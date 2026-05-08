(define (problem meeting_barbara_instance)
  (:domain meeting_planning_instance)

  (:objects
    ;; Coarse, instance-specific timepoints (symbolic stages). Chosen so travel durations (16 / 15 min)
    ;; and Barbara's availability (18:00-21:30) can be represented without numeric fluents.
    t09_00 t17_44 t18_00 t19_30 t21_30 - timepoint

    north_beach alamo_square - location

    traveler barbara - person
  )

  (:init
    ;; start time and location
    (current_time t09_00)
    (at traveler north_beach t09_00)

    ;; Barbara's presence at key boundary timepoints within her availability window (18:00-21:30).
    ;; For the meeting-action preconditions we require Barbara to be at the meeting start and at the meeting end.
    (at barbara alamo_square t18_00)
    (at barbara alamo_square t19_30)
    (at barbara alamo_square t21_30)

    ;; Allowed wait intervals (coarse symbolic waits to move from morning to just before travel).
    (allowed_wait t09_00 t17_44)
    ;; optionally allow waiting after meeting if needed
    (allowed_wait t19_30 t21_30)

    ;; Allowed travel intervals encoded explicitly for this instance.
    ;; Travel NB -> Alamo Square takes 16 minutes. We represent the feasible leg that departs at t17_44
    ;; and arrives at t18_00 (t17_44 + 16min = t18_00).
    (allowed_travel north_beach alamo_square t17_44 t18_00)

    ;; Note: reverse travel legs or more refined departure times are omitted intentionally;
    ;; this instance encodes the concrete feasible leg necessary to arrive by Barbara's earliest window.
    ;; If additional legs are required they should be added similarly as allowed_travel facts.
    ;; Meeting intervals: require at least 90 minutes with Barbara. We include the concrete 90-minute slot.
    (allowed_meeting_interval t18_00 t19_30)
  )

  ;; Hard goal: ensure Barbara is met (the problem instance enforces the 90-minute meeting interval above).
  (:goal (and
    (met barbara)
  ))
)