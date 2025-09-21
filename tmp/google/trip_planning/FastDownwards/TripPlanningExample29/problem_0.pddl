(define (problem integrated-trip)
  (:domain integrated_trip)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; NOTES / TRADEOFFS (human-readable comments):
  ;
  ; - The three agents provided partially overlapping PDDL fragments with
  ;   conflicting preferences:
  ;     * Dubrovnik agent wanted 7 days in Dubrovnik (hard in their model).
  ;     * Frankfurt agent wanted 3 days in Frankfurt.
  ;     * Krakow agent wanted >= 2 days in Krakow and the wedding between day 9-10.
  ;
  ; - A strict satisfaction of all three numeric preferences would require
  ;   7 + 3 + 2 = 12 days, exceeding the total-trip constraint of 10 days.
  ;
  ; - To produce a feasible, integrated 10-day plan that respects the hard
  ;   global constraints (10 total days, only direct flights, wedding in
  ;   Krakow on day 9 or 10, visit all three cities) we relax the Dubrovnik
  ;   agent's 7-day wish. The integrated plan aims to:
  ;     * Ensure a Krakow wedding on day 9 or 10 and at least 2 Krakow days.
  ;     * Satisfy the Frankfurt agent's stay requirement of 3 days.
  ;     * Allocate the remaining days to Dubrovnik so the trip totals 10 days.
  ;
  ; - This choice honors the Krakow wedding timing and Frankfurt's 3-day
  ;   requirement while reducing Dubrovnik's requested days (the Dubrovnik
  ;   agent's "7 days" was treated as a strong preference that had to be
  ;   relaxed to achieve global feasibility).
  ;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    frankfurt krakow dubrovnik - city
  )

  (:init
    ;-- public information: direct flights (only these direct connections exist)
    (direct frankfurt krakow)
    (direct krakow frankfurt)
    (direct dubrovnik frankfurt)
    (direct frankfurt dubrovnik)

    ;-- Mark which city is Dubrovnik (used by that agent's predicates)
    (is-dubrovnik dubrovnik)

    ;-- wedding info (kept from Krakow agent input)
    (wedding-between-day9-day10)
    (wedding-in krakow)

    ;-- initial control flag: no start chosen yet
    (unstarted)

    ;-- numeric initial values
    (= (day) 0)
    (= (days-left) 10)
    (= (krakow-days) 0)
    (= (dubrovnik-left) 0)  ; we do not enforce the dubrovnik agent's 7-day requirement here
    (= (stay-days frankfurt) 0)
    (= (stay-days krakow) 0)
    (= (stay-days dubrovnik) 0)
  )

  (:goal (and
    ;-- Visit each city at least once:
    (visited frankfurt)
    (visited krakow)
    (visited dubrovnik)

    ;-- Total trip lasts exactly 10 days:
    (= (day) 10)
    (= (days-left) 0)

    ;-- Respect Frankfurt agent's requirement: 3 days in Frankfurt (stay-count)
    (= (stay-days frankfurt) 3)

    ;-- Respect Krakow agent's preference: at least 2 Krakow days (arrival counts)
    (>= (krakow-days) 2)

    ;-- Ensure the wedding is actually held in Krakow during day 9 or day 10.
    (wedding-held)
  ))
)