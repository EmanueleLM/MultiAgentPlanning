(define (domain integrated_trip_fd)
  (:requirements :strips :typing :fluents :negative-preconditions :action-costs)
  (:types city day kcount fcount)

  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (unstarted)
    (wedding-in ?c - city)
    (wedding-held)
    (is-dubrovnik ?c - city)
    (direct ?from - city ?to - city)
    (day ?d - day)
    (next ?d1 - day ?d2 - day)
    ;; krakow count predicate and its next relation
    (krakow-count ?k - kcount)
    (next-k ?k1 - kcount ?k2 - kcount)
    ;; frankfurt count predicate and its next relation
    (frankfurt-count ?f - fcount)
    (next-f ?f1 - fcount ?f2 - fcount)
  )

  (:functions
    (total-cost)
  )

  ;; -------------------------
  ;; Start actions (agent-distinct)
  ;; advance day from ?d to ?d' (requires next), set initial location, mark visited
  ;; -------------------------

  (:action krakow-start-in-frankfurt
    :parameters (?d - day ?d' - day)
    :precondition (and (unstarted) (day ?d) (next ?d ?d'))
    :effect (and
      (not (unstarted))
      (not (day ?d)) (day ?d')
      (at frankfurt)
      (visited frankfurt)
      (increase (total-cost) 1)
    )
  )

  (:action krakow-start-in-krakow
    :parameters (?d - day ?d' - day ?k - kcount ?k' - kcount)
    :precondition (and (unstarted) (day ?d) (next ?d ?d') (krakow-count ?k) (next-k ?k ?k'))
    :effect (and
      (not (unstarted))
      (not (day ?d)) (day ?d')
      (at krakow)
      (visited krakow)
      (not (krakow-count ?k)) (krakow-count ?k')
      (increase (total-cost) 1)
    )
  )

  (:action krakow-start-in-dubrovnik
    :parameters (?d - day ?d' - day)
    :precondition (and (unstarted) (day ?d) (next ?d ?d'))
    :effect (and
      (not (unstarted))
      (not (day ?d)) (day ?d')
      (at dubrovnik)
      (visited dubrovnik)
      (increase (total-cost) 1)
    )
  )

  (:action dubrovnik-start-at
    :parameters (?c - city ?d - day ?d' - day)
    :precondition (and (unstarted) (day ?d) (next ?d ?d'))
    :effect (and
      (not (unstarted))
      (not (day ?d)) (day ?d')
      (at ?c)
      (visited ?c)
      (increase (total-cost) 1)
    )
  )

  (:action frankfurt-start-at
    :parameters (?c - city ?d - day ?d' - day)
    :precondition (and (unstarted) (day ?d) (next ?d ?d'))
    :effect (and
      (not (unstarted))
      (not (day ?d)) (day ?d')
      (at ?c)
      (visited ?c)
      (increase (total-cost) 1)
    )
  )

  ;; -------------------------
  ;; Stay actions (agent-distinct)
  ;; advance day by one (d -> d') and optionally increment city-specific counters
  ;; -------------------------

  (:action krakow-stay-in-frankfurt
    :parameters (?d - day ?d' - day)
    :precondition (and (at frankfurt) (day ?d) (next ?d ?d'))
    :effect (and
      (not (day ?d)) (day ?d')
      (visited frankfurt)
      (increase (total-cost) 1)
    )
  )

  (:action krakow-stay-in-krakow
    :parameters (?d - day ?d' - day ?k - kcount ?k' - kcount)
    :precondition (and (at krakow) (day ?d) (next ?d ?d') (krakow-count ?k) (next-k ?k ?k'))
    :effect (and
      (not (day ?d)) (day ?d')
      (visited krakow)
      (not (krakow-count ?k)) (krakow-count ?k')
      (increase (total-cost) 1)
    )
  )

  (:action krakow-stay-in-dubrovnik
    :parameters (?d - day ?d' - day)
    :precondition (and (at dubrovnik) (day ?d) (next ?d ?d'))
    :effect (and
      (not (day ?d)) (day ?d')
      (visited dubrovnik)
      (increase (total-cost) 1)
    )
  )

  (:action dubrovnik-stay-other-1
    :parameters (?c - city ?d - day ?d' - day)
    :precondition (and (at ?c) (day ?d) (next ?d ?d') (not (is-dubrovnik ?c)))
    :effect (and
      (not (day ?d)) (day ?d')
      (visited ?c)
      (increase (total-cost) 1)
    )
  )

  (:action frankfurt-stay-in-frankfurt
    :parameters (?d - day ?d' - day ?f - fcount ?f' - fcount)
    :precondition (and (at frankfurt) (day ?d) (next ?d ?d') (frankfurt-count ?f) (next-f ?f ?f'))
    :effect (and
      (not (day ?d)) (day ?d')
      (visited frankfurt)
      (not (frankfurt-count ?f)) (frankfurt-count ?f')
      (increase (total-cost) 1)
    )
  )

  (:action frankfurt-stay-in-other
    :parameters (?c - city ?d - day ?d' - day)
    :precondition (and (at ?c) (day ?d) (next ?d ?d') (not (= ?c frankfurt)))
    :effect (and
      (not (day ?d)) (day ?d')
      (visited ?c)
      (increase (total-cost) 1)
    )
  )

  ;; -------------------------
  ;; Flight actions (agent-distinct)
  ;; advance day by one, move location, mark visited, optionally increment krakow count
  ;; -------------------------

  (:action krakow-fly-frankfurt-to-krakow
    :parameters (?d - day ?d' - day ?k - kcount ?k' - kcount)
    :precondition (and (at frankfurt) (day ?d) (next ?d ?d') (krakow-count ?k) (next-k ?k ?k'))
    :effect (and
      (not (at frankfurt))
      (at krakow)
      (visited krakow)
      (not (day ?d)) (day ?d')
      (not (krakow-count ?k)) (krakow-count ?k')
      (increase (total-cost) 1)
    )
  )

  (:action krakow-fly-krakow-to-frankfurt
    :parameters (?d - day ?d' - day)
    :precondition (and (at krakow) (day ?d) (next ?d ?d'))
    :effect (and
      (not (at krakow))
      (at frankfurt)
      (visited frankfurt)
      (not (day ?d)) (day ?d')
      (increase (total-cost) 1)
    )
  )

  (:action krakow-fly-dubrovnik-to-frankfurt
    :parameters (?d - day ?d' - day)
    :precondition (and (at dubrovnik) (day ?d) (next ?d ?d'))
    :effect (and
      (not (at dubrovnik))
      (at frankfurt)
      (visited frankfurt)
      (not (day ?d)) (day ?d')
      (increase (total-cost) 1)
    )
  )

  (:action krakow-fly-frankfurt-to-dubrovnik
    :parameters (?d - day ?d' - day)
    :precondition (and (at frankfurt) (day ?d) (next ?d ?d'))
    :effect (and
      (not (at frankfurt))
      (at dubrovnik)
      (visited dubrovnik)
      (not (day ?d)) (day ?d')
      (increase (total-cost) 1)
    )
  )

  (:action dubrovnik-take-flight
    :parameters (?from - city ?to - city ?d - day ?d' - day)
    :precondition (and (at ?from) (direct ?from ?to) (day ?d) (next ?d ?d'))
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (not (day ?d)) (day ?d')
      (increase (total-cost) 1)
    )
  )

  (:action dubrovnik-fly-to-krakow
    :parameters (?from - city ?d - day ?d' - day ?k - kcount ?k' - kcount)
    :precondition (and (at ?from) (direct ?from krakow) (day ?d) (next ?d ?d') (krakow-count ?k) (next-k ?k ?k'))
    :effect (and
      (not (at ?from))
      (at krakow)
      (visited krakow)
      (not (day ?d)) (day ?d')
      (not (krakow-count ?k)) (krakow-count ?k')
      (increase (total-cost) 1)
    )
  )

  (:action frankfurt-fly
    :parameters (?from - city ?to - city ?d - day ?d' - day)
    :precondition (and (at ?from) (direct ?from ?to) (day ?d) (next ?d ?d'))
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (not (day ?d)) (day ?d')
      (increase (total-cost) 1)
    )
  )

  ;; -------------------------
  ;; Wedding actions (two variants for day9 and day10)
  ;; -------------------------
  (:action krakow-hold-wedding-day9
    :parameters (?d - day)
    :precondition (and (at krakow) (wedding-in krakow) (day ?d))
    :effect (and
      (when (day d9) (wedding-held))
      (increase (total-cost) 1)
    )
  )

  (:action krakow-hold-wedding-day10
    :parameters (?d - day)
    :precondition (and (at krakow) (wedding-in krakow) (day ?d))
    :effect (and
      (when (day d10) (wedding-held))
      (increase (total-cost) 1)
    )
  )

)