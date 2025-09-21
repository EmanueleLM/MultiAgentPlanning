(define (domain integrated_trip)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types city)

  ;; Predicates (shared world)
  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (unstarted)
    (wedding-between-day9-day10)
    (wedding-in ?c - city)
    (wedding-held)
    (is-dubrovnik ?c - city)
    (direct ?from - city ?to - city)
  )

  ;; Numeric fluents
  (:functions
    (day)            ; current day number, we count from 0 upward; goal day = 10
    (days-left)      ; remaining days to allocate (starts at 10)
    (krakow-days)    ; number of days in Krakow (for Krakow preference)
    (dubrovnik-left) ; remaining Dubrovnik preference counter (kept for compatibility)
    (stay-days ?c - city) ; per-city stay counters (Frankfurt agent's bookkeeping)
  )

  ;; -------------------------
  ;; Start actions (multiple agents kept distinct)
  ;; Only one start action may be used because all require (unstarted).
  ;; They set day to day+1 and consume one day from the budget.
  ;; -------------------------

  ;; Krakow-agent start actions (kept distinct)
  (:action krakow-start-in-frankfurt
    :parameters ()
    :precondition (and (unstarted))
    :effect (and
      (not (unstarted))
      (at frankfurt)
      (visited frankfurt)
      (increase (day) 1)
      (decrease (days-left) 1)
    )
  )

  (:action krakow-start-in-krakow
    :parameters ()
    :precondition (and (unstarted))
    :effect (and
      (not (unstarted))
      (at krakow)
      (visited krakow)
      (increase (day) 1)
      (decrease (days-left) 1)
      (increase (krakow-days) 1)
    )
  )

  (:action krakow-start-in-dubrovnik
    :parameters ()
    :precondition (and (unstarted))
    :effect (and
      (not (unstarted))
      (at dubrovnik)
      (visited dubrovnik)
      (increase (day) 1)
      (decrease (days-left) 1)
    )
  )

  ;; Dubrovnik-agent parameterized start (kept distinct)
  (:action dubrovnik-start-at
    :parameters (?c - city)
    :precondition (and (unstarted))
    :effect (and
      (not (unstarted))
      (at ?c)
      (visited ?c)
      (increase (day) 1)
      (decrease (days-left) 1)
    )
  )

  ;; Frankfurt-agent parameterized start (kept distinct)
  (:action frankfurt-start-at
    :parameters (?c - city)
    :precondition (and (unstarted))
    :effect (and
      (not (unstarted))
      (at ?c)
      (visited ?c)
      (increase (day) 1)
      (decrease (days-left) 1)
    )
  )

  ;; -------------------------
  ;; Stay actions (kept distinct per agent)
  ;; All stay actions consume day(s) from the shared (days-left) and increment (day).
  ;; We keep the three agents' stay actions distinct so planners can choose among them.
  ;; -------------------------

  ;; Krakow-agent stay actions (explicit per city; staying in Krakow increases krakow-days)
  (:action krakow-stay-in-frankfurt
    :parameters ()
    :precondition (and (at frankfurt) (< (day) 10))
    :effect (and
      (at frankfurt)
      (visited frankfurt)
      (increase (day) 1)
      (decrease (days-left) 1)
    )
  )

  (:action krakow-stay-in-krakow
    :parameters ()
    :precondition (and (at krakow) (< (day) 10))
    :effect (and
      (at krakow)
      (visited krakow)
      (increase (day) 1)
      (decrease (days-left) 1)
      (increase (krakow-days) 1)
    )
  )

  (:action krakow-stay-in-dubrovnik
    :parameters ()
    :precondition (and (at dubrovnik) (< (day) 10))
    :effect (and
      (at dubrovnik)
      (visited dubrovnik)
      (increase (day) 1)
      (decrease (days-left) 1)
    )
  )

  ;; Dubrovnik-agent stay actions (kept distinct). These allow multi-day stays;
  ;; they update the global day counter and days-left.
  (:action dubrovnik-stay-dubrovnik-7
    :parameters ()
    :precondition (and
      (at dubrovnik)
      (>= (days-left) 7)
      (>= (dubrovnik-left) 7)
    )
    :effect (and
      (increase (day) 7)
      (decrease (days-left) 7)
      (decrease (dubrovnik-left) 7)
      (visited dubrovnik)
    )
  )

  (:action dubrovnik-stay-other-1
    :parameters (?c - city)
    :precondition (and
      (at ?c)
      (not (is-dubrovnik ?c))
      (>= (days-left) 1)
    )
    :effect (and
      (increase (day) 1)
      (decrease (days-left) 1)
      (visited ?c)
    )
  )

  (:action dubrovnik-stay-other-2
    :parameters (?c - city)
    :precondition (and
      (at ?c)
      (not (is-dubrovnik ?c))
      (>= (days-left) 2)
    )
    :effect (and
      (increase (day) 2)
      (decrease (days-left) 2)
      (visited ?c)
    )
  )

  (:action dubrovnik-stay-other-3
    :parameters (?c - city)
    :precondition (and
      (at ?c)
      (not (is-dubrovnik ?c))
      (>= (days-left) 3)
    )
    :effect (and
      (increase (day) 3)
      (decrease (days-left) 3)
      (visited ?c)
    )
  )

  ;; Frankfurt-agent single-day stay action (increment per-city stay counters).
  (:action frankfurt-stay
    :parameters (?c - city)
    :precondition (and (at ?c) (> (days-left) 0))
    :effect (and
      (increase (stay-days ?c) 1)
      (decrease (days-left) 1)
      (increase (day) 1)
      (visited ?c)
    )
  )

  ;; -------------------------
  ;; Flight actions: only direct flights allowed (keep agents' flight actions distinct)
  ;; Flights consume one day (increase day by 1) and decrease days-left by 1.
  ;; For flights that arrive in Krakow we also increase krakow-days to account the arrival day.
  ;; -------------------------

  ;; Krakow-agent explicit flights (kept from the Krakow agent)
  (:action krakow-fly-frankfurt-to-krakow
    :parameters ()
    :precondition (and (at frankfurt) (< (day) 10))
    :effect (and
      (not (at frankfurt))
      (at krakow)
      (visited krakow)
      (increase (day) 1)
      (decrease (days-left) 1)
      (increase (krakow-days) 1)
    )
  )

  (:action krakow-fly-krakow-to-frankfurt
    :parameters ()
    :precondition (and (at krakow) (< (day) 10))
    :effect (and
      (not (at krakow))
      (at frankfurt)
      (visited frankfurt)
      (increase (day) 1)
      (decrease (days-left) 1)
    )
  )

  (:action krakow-fly-dubrovnik-to-frankfurt
    :parameters ()
    :precondition (and (at dubrovnik) (< (day) 10))
    :effect (and
      (not (at dubrovnik))
      (at frankfurt)
      (visited frankfurt)
      (increase (day) 1)
      (decrease (days-left) 1)
    )
  )

  (:action krakow-fly-frankfurt-to-dubrovnik
    :parameters ()
    :precondition (and (at frankfurt) (< (day) 10))
    :effect (and
      (not (at frankfurt))
      (at dubrovnik)
      (visited dubrovnik)
      (increase (day) 1)
      (decrease (days-left) 1)
    )
  )

  ;; Dubrovnik-agent generic flight (kept distinct)
  (:action dubrovnik-take-flight
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to) (< (day) 10))
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (increase (day) 1)
      (decrease (days-left) 1)
      ;; If destination is krakow we also reflect a day spent there for Krakow preference.
      ;; Because PDDL does not support conditional numeric effects portably here, we
      ;; provide a specialized version below for the krakow destination; this generic
      ;; action will not increase krakow-days except when explicit specialized action is used.
    )
  )

  ;; Frankfurt-agent generic flight (kept distinct)
  (:action frankfurt-fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to) (< (day) 10))
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (increase (day) 1)
      (decrease (days-left) 1)
    )
  )

  ;; A specialized flight action that ensures arriving in Krakow also increases krakow-days,
  ;; to reflect the Krakow agent semantics (kept distinct).
  (:action dubrovnik-fly-to-krakow
    :parameters (?from - city)
    :precondition (and (at ?from) (direct ?from krakow) (< (day) 10))
    :effect (and
      (not (at ?from))
      (at krakow)
      (visited krakow)
      (increase (day) 1)
      (decrease (days-left) 1)
      (increase (krakow-days) 1)
    )
  )

  ;; -------------------------
  ;; Wedding action (Krakow agent) - must be held in Krakow on day 9 or day 10.
  ;; This is included as a hard goal conjunct to ensure the planner schedules Krakow
  ;; presence around day 9-10.
  ;; -------------------------
  (:action krakow-hold-wedding
    :parameters ()
    :precondition (and
      (at krakow)
      (wedding-in krakow)
      (>= (day) 9)
      (<= (day) 10)
    )
    :effect (and
      (wedding-held)
    )
  )

)