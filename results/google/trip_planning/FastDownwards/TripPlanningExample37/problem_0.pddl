(define (problem itinerary-10days)
  (:domain travel-scheduling)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Problem comment:
  ; The traveler requested a 10-day itinerary visiting Reykjavik, Milan, and Porto,
  ; and must attend the Porto show on days d9 and d10. To respect fixed constraints
  ; (10 total days and the Porto-show dates), I allocate days as follows:
  ;   - Reykjavik: days d1, d2, d3
  ;   - Milan:     days d4, d5, d6
  ;   - Porto:     days d7, d8, d9, d10 (show on d9 and d10)
  ; This allocation fits the 10-day fixed horizon and preserves the Porto-show
  ; requirement. If a different initial city or a different day-allocation was
  ; specified by the traveler, that would be a conflict with the fixed 10-day
  ; horizon and the Porto show dates; this allocation prioritizes those fixed
  ; constraints and chooses the earliest feasible schedule consistent with them.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    traveler - agent

    reykjavik milan porto - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    ;; Temporal day succession
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    ;; Direct flight facts (the planner must use only these direct flights)
    ;; The network below allows the itinerary Reykjavik -> Milan -> Porto in sequence.
    (direct reykjavik milan)
    (direct milan reykjavik)
    (direct milan porto)
    (direct porto milan)
    (direct reykjavik porto)
    (direct porto reykjavik)

    ;; Starting location: earliest feasible plan begins in Reykjavik on day d1.
    ;; This choice respects the requirement to visit Reykjavik and uses the earliest
    ;; times consistent with the fixed Porto show dates.
    (at traveler reykjavik d1)
    (visited reykjavik)
  )

  (:goal
    (and
      ;; Must visit all three required cities at least once within the 10-day horizon
      (visited reykjavik)
      (visited milan)
      (visited porto)

      ;; Fixed event constraints: the traveler must be in Porto on days d9 and d10
      (at traveler porto d9)
      (at traveler porto d10)
    )
  )
)