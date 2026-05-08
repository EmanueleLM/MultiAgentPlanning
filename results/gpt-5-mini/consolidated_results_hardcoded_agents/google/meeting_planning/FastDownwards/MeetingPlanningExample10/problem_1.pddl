(define (problem MeetingPlanningExample10-problem)
  (:domain meeting-planning)
  (:objects
    golden_gate_park marina_district - location
    t0 t59 t75 t90 - time
  )

  (:init
    ; Initial time: 09:00 mapped to t0 (0 minutes after 09:00)
    (now t0)
    ; Initial location
    (at golden_gate_park)

    ; Discrete time "next" pairs used by the chosen schedule:
    ; t0 -> t59 represents waiting from 09:00 to 09:59 (59 minutes)
    ; t59 -> t75 represents travel of 16 minutes (09:59 -> 10:15)
    ; t75 -> t90 represents meeting of 15 minutes (10:15 -> 10:30)
    (next t0 t59)
    (next t59 t75)
    (next t75 t90)

    ; James' availability: meeting interval must lie within [10:15, 13:30].
    ; The chosen meeting interval 10:15 (t75) -> 10:30 (t90) is within that window:
    (james_available t75 t90)

    ; Initialize total cost to zero
    (= (total-cost) 0)
  )

  ; Goal: ensure we meet James (at least the 15-minute meeting captured by meet-james)
  (:goal (met_james))

  ; Minimize total travel cost (the planner will prefer solutions with lower accumulated travel minutes).
  (:metric minimize (total-cost))
)