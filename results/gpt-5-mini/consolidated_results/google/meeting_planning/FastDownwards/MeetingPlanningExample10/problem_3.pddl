(define (problem MeetingPlanningExample10-problem)
  (:domain meeting-planning)
  (:objects
    golden_gate_park marina_district - location
    t540 t599 t615 t630 - time
  )

  (:init
    ; initial time = 09:00 => minute 540
    (now t540)
    (at golden_gate_park)

    ; mark which location is the Marina District for meet-james precondition
    (is_marina marina_district)

    ; contiguous stage links (enforce contiguous occupancy for each declared duration)
    ; 09:00 -> 09:59  (t540 -> t599) : waiting block (59 minutes)
    ; 09:59 -> 10:15  (t599 -> t615) : travel block (16 minutes)
    ; 10:15 -> 10:30  (t615 -> t630) : meeting block (15 minutes)
    (next t540 t599)
    (next t599 t615)
    (next t615 t630)

    ; allowed travel with direction-dependent duration:
    ; Golden Gate Park -> Marina District is allowed specifically from t599 to t615 (16 minutes)
    (travel_allowed golden_gate_park marina_district t599 t615)

    ; James availability includes the meeting block t615 -> t630 (10:15 -> 10:30)
    (james_available t615 t630)
  )

  (:goal (met_james))
)