(define (problem MeetingPlanningExample10-problem)
  (:domain meeting-planning)
  (:objects
    golden_gate_park marina_district - location
    t0 t59 t75 t90 - time
  )

  (:init
    ; initial time and location (09:00 mapped to t0)
    (now t0)
    (at golden_gate_park)

    ; discrete time "next" steps used to enforce contiguous durations:
    ; t0 -> t59 represents waiting from 09:00 to 09:59 (59-minute block)
    ; t59 -> t75 represents travel block of 16 minutes (09:59 -> 10:15)
    ; t75 -> t90 represents meeting block of 15 minutes (10:15 -> 10:30)
    (next t0 t59)
    (next t59 t75)
    (next t75 t90)

    ; travel_allowed encodes direction-dependent permitted time jumps:
    ; Golden Gate Park -> Marina District allowed from t59 to t75 (16-minute travel)
    (travel_allowed golden_gate_park marina_district t59 t75)

    ; James availability window includes the meeting block t75 -> t90 (10:15 -> 10:30)
    (james_available t75 t90)
  )

  (:goal (met_james))
)