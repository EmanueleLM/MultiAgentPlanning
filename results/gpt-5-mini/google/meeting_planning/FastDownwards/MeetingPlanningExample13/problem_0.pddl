(define (problem meet-betty-2026)
  (:domain itinerary_planner_domain)

  (:objects
    you-agent - agent
    betty-person - person

    Presidio North_Beach - location

    itinerary-A itinerary-B itinerary-C itinerary-D - itinerary
  )

  (:init
    ; Starting facts
    (at you-agent Presidio) ; You arrive / are at Presidio at 09:00 (start condition)

    ; Betty's validated availability and derived feasible meeting intervals:
    ; These flags were produced by validating the candidate itineraries against Betty's strict availability window (18:45–22:00)
    ; and the fixed travel times Presidio->NorthBeach = 18min, NorthBeach->Presidio = 17min.
    ; Each itinerary listed below has been verified as temporally feasible (no soft/penalty allowances).
    (itinerary-feasible itinerary-A) ; Candidate A: depart 18:27, meet 18:45–20:00, return 20:00–20:17
    (itinerary-feasible itinerary-B) ; Candidate B: depart 09:30, stay 09:48–22:00 (includes meeting 18:45–22:00), return 22:00–22:17
    (itinerary-feasible itinerary-C) ; Candidate C: sequences with midday visit and evening meeting 18:45–20:00, returns 20:00–20:17
    (itinerary-feasible itinerary-D) ; Candidate D: depart 18:30, meet 18:48–20:03, return 20:03–20:20

    ; Note: No other itinerary-feasible facts are provided. This forbids any schedules that would violate Betty's
    ; hard availability window or the fixed travel durations derived in the availability report.
  )

  (:goal (and
    (met betty-person)          ; Maximize number of friends met -> with a single friend, require meeting Betty
    (at you-agent Presidio)     ; Mandated terminal condition: end up back at Presidio as each candidate specifies
  ))
)