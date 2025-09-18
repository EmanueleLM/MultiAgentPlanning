(define (domain combined-europe-trip)
  (:requirements :strips :typing :negative-preconditions :equality :numeric-fluents :conditional-effects)
  (:types city day)

  ;; Predicates (union of predicates from all agents, kept distinct where agents used different names)
  (:predicates
    ;; agent1 / agent2 style current-location (no day)
    (at ?c - city)

    ;; agent3 style location tagged with a day
    (at-day ?c - city ?d - day)

    ;; connectivity predicates (both flavors present in fragments)
    (connected ?from - city ?to - city)
    (flight ?from - city ?to - city)

    ;; simple visited flag (shared)
    (visited ?c - city)

    ;; relatives-visited names used by the different fragments
    (relatives-visited)
    (visited-relatives)

    ;; agent3 bookkeeping
    (next ?d1 - day ?d2 - day)
    (is-dublin ?c - city)
    (is-valencia ?c - city)
    (in-rel-window ?d - day)
  )

  ;; Numeric functions: maintain numeric day index and per-city day counters from fragments
  (:functions
    (day)             ; numeric day counter (1..9)
    (oslo-days)       ; days spent in Oslo
    (valencia-days)   ; days spent in Valencia
    (dublin-days)     ; days spent in Dublin (from agent3)
  )

  ;-------------------------
  ; Helper / start actions
  ;-------------------------
  ;; Choose a starting city for the trip. This sets both the simple (at) and the day-tagged (at-day ... day1)
  ;; so the planner can use actions from any agent-fragment representation.
  (:action start-at
    :parameters (?c - city ?dstart - day)
    :precondition (and (= (day) 1) (not (at ?c)) (not (at-day ?c ?dstart)))
    :effect (and
      (at ?c)
      (at-day ?c ?dstart)
    )
  )

  ;; Mark a city as visited without consuming a day (useful to record a visit when passing through)
  (:action record-visited
    :parameters (?c - city)
    :precondition (at ?c)
    :effect (visited ?c)
  )

  ;; Mark a city as visited for the day-annotated representation
  (:action record-visited-day
    :parameters (?c - city ?d - day)
    :precondition (at-day ?c ?d)
    :effect (visited ?c)
  )

  ;-------------------------
  ; Agent 1 actions (from europe-trip)
  ; kept distinct by prefix a1-
  ;-------------------------
  ;; Agent1: direct flight (does NOT advance numeric day in original fragment).
  (:action a1-fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (connected ?from ?to))
    :effect (and
      (not (at ?from))
      (at ?to)
      ;; record arrival as a visit (helpful to satisfy visit goals when using A1 flights)
      (visited ?to)
    )
  )

  ;; Agent1: stay in Oslo (advances numeric day and increments oslo-days).
  (:action a1-stay-in-oslo
    :parameters ()
    :precondition (and (at oslo) (< (day) 9))
    :effect (and
      (increase (day) 1)
      (increase (oslo-days) 1)
      (visited oslo)
    )
  )

  ;; Agent1: stay in other city (advances day and marks visited)
  (:action a1-stay-in-city
    :parameters (?c - city)
    :precondition (and (at ?c) (not (= ?c oslo)) (< (day) 9))
    :effect (and
      (increase (day) 1)
      (visited ?c)
    )
  )

  ;; Agent1: visit relatives (valencia) (does not consume a day in original fragment)
  (:action a1-visit-relatives
    :parameters ()
    :precondition (and (at valencia) (>= (day) 5) (<= (day) 9))
    :effect (and
      (relatives-visited)
      (visited-relatives)
      (visited valencia)
    )
  )

  ;-------------------------
  ; Agent 2 actions (from valencia-trip)
  ; kept distinct by prefix a2-
  ;-------------------------
  ;; Agent2: fly (consumes one numeric day)
  (:action a2-fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (connected ?from ?to) (< (day) 9))
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (increase (day) 1)
    )
  )

  ;; Agent2: stay one day in any city (consumes one day)
  (:action a2-stay
    :parameters (?c - city)
    :precondition (and (at ?c) (< (day) 9))
    :effect (and
      (visited ?c)
      (increase (day) 1)
    )
  )

  ;; Agent2: specialized stay for Valencia (increments valencia-days)
  (:action a2-stay-valencia
    :parameters ()
    :precondition (and (at valencia) (< (day) 9))
    :effect (and
      (visited valencia)
      (increase (day) 1)
      (increase (valencia-days) 1)
    )
  )

  ;; Agent2: visit relatives in Valencia (allowed between numeric day 5..9)
  (:action a2-visit-relatives
    :parameters ()
    :precondition (and (at valencia) (>= (day) 5) (<= (day) 9))
    :effect (and
      (relatives-visited)
      (visited-relatives)
    )
  )

  ;-------------------------
  ; Agent 3 actions (from trip-planning)
  ; kept distinct by prefix a3-
  ; Uses day-objects and conditional effects
  ;-------------------------
  (:action a3-stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at-day ?c ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at-day ?c ?d))
      (at-day ?c ?d2)

      ;; conditional effects:
      (when (is-dublin ?c)
        (and
          (increase (dublin-days) 1)
          (visited ?c)
        )
      )

      (when (is-valencia ?c)
        (visited ?c)
      )
      (when (and (is-valencia ?c) (in-rel-window ?d))
        (visited-relatives)
      )
    )
  )

  (:action a3-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at-day ?from ?d)
      (flight ?from ?to)
      (next ?d ?d2)
    )
    :effect (and
      (not (at-day ?from ?d))
      (at-day ?to ?d2)
      ;; conditional bookkeeping on departure
      (when (is-dublin ?from)
        (and
          (increase (dublin-days) 1)
          (visited ?from)
        )
      )
      (when (is-valencia ?from)
        (visited ?from)
      )
      (when (and (is-valencia ?from) (in-rel-window ?d))
        (visited-relatives)
      )

      ;; arrival marks the destination visited
      (visited ?to)
    )
  )

)