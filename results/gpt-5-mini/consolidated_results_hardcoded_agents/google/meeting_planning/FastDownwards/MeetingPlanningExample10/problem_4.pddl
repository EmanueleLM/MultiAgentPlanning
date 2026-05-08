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

    ; designate marina location
    (is_marina marina_district)

    ; explicit contiguous stage links (only allowed stage transitions)
    (next t540 t599)  ; 09:00 -> 09:59 (waiting interval)
    (next t599 t615)  ; 09:59 -> 10:15 (travel interval, 16 minutes)
    (next t615 t630)  ; 10:15 -> 10:30 (meeting interval, 15 minutes)

    ; allowed travel with asymmetric duration encoded as specific allowed time-pair
    (travel_allowed golden_gate_park marina_district t599 t615)

    ; James availability includes the declared meeting interval (10:15 -> 10:30)
    (james_available t615 t630)
  )

  (:goal (met_james))
)