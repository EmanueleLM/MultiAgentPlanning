(define (problem MeetingPlanningExample10-problem)
  (:domain meeting-planning)
  (:objects
    golden_gate_park marina_district - location
    t540 t599 t615 t630 - time
  )

  (:init
    (now t540)
    (at golden_gate_park)
    (is_marina marina_district)

    ; Stage succession enforces contiguous occupancy for each declared interval
    (next t540 t599)  ; 09:00 -> 09:59 : waiting stage
    (next t599 t615)  ; 09:59 -> 10:15 : travel stage (16 minutes)
    (next t615 t630)  ; 10:15 -> 10:30 : meeting stage (15 minutes)

    ; Asymmetric travel allowance encoded for the specific contiguous stage pair
    (travel_allowed golden_gate_park marina_district t599 t615)

    ; James is available exactly for the meeting stage used
    (james_available t615 t630)
  )

  (:goal (met_james))
)