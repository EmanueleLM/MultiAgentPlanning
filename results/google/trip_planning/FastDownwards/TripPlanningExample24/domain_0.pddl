(define (domain europe-trip)
  (:requirements :strips :typing :fluents :negative-preconditions :conditional-effects)
  (:types city)
  (:predicates
    (at ?c - city)                      ; current location
    (connected ?from - city ?to - city) ; allowed direct transition (includes self)
  )
  (:functions
    (day)                 ; current day index (integer)
    (spent-florence)      ; accumulated days spent in Florence
    (spent-amsterdam)     ; accumulated days spent in Amsterdam
    (spent-riga)          ; accumulated days spent in Riga
  )

  (:action advance
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (< (day) 13)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (assign (day) (+ (day) 1))
      ;; conditional increments depending on destination
      (when (= ?to florence) (increase (spent-florence) 1))
      (when (= ?to amsterdam) (increase (spent-amsterdam) 1))
      (when (= ?to riga) (increase (spent-riga) 1))
    )
  )

  (:documentation
   "Assumptons and modelling notes:
    - Days are discrete and numbered 1..13. The initial state starts at day=1.
    - The plan model uses an 'advance' action that sets the city for the next day and increments counters.
    - The initial day (day 1) is counted already toward the initial city's spent-<city> counter.
    - Flights/transitions are only allowed when a 'connected' relation exists between cities.
    - Self-connections represent staying in the same city for the next day (no separate 'stay' action needed).
    - The model assumes flights/transitions happen between day t and day t+1 and do not consume additional fractional time beyond advancing the day.
    - The integrated plan chooses the earliest feasible schedule satisfying hard constraints: Florence days 1-4, Amsterdam days 5-9, Riga days 10-13.
    - Minimal negotiated adjustments: Amsterdam reduced to 5 days and Riga reduced to 4 days to respect the 13-day total while keeping Florence fixed at 4 days (to meet the workshop constraint).
    - This domain uses numeric fluents (PDDL 2.1 style) and conditional effects; FastDownward supports these constructs."
  )
)