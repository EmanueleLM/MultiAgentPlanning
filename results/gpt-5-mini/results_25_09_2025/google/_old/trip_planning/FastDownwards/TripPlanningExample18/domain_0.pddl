(define (domain combined-travel)
  (:requirements :typing :negative-preconditions :equality :numeric-fluents :conditional-effects)
  (:types city)

  (:predicates
    ;; Traveler's location predicates
    (in ?c - city)
    (started)

    ;; Flight planner's location predicates
    (at ?c - city)
    (visited ?c - city)

    ;; Connectivity and meeting predicates
    (direct ?from - city ?to - city)
    (is-bucharest ?c - city)

    ;; Meeting predicates for respective agents
    (met-friends)   ; set by traveler actions
    (met)           ; set by flight planner actions
  )

  (:functions
    (day)                ; current day as integer (starts at 1)
    (remain ?c - city)   ; remaining required stay days for each city (trader's requirement)
  )

  ;; -----------------------
  ;; Traveler-agent actions
  ;; -----------------------

  (:action traveler-start-in
    :parameters (?c - city)
    :precondition (and (= (day) 1) (not (started)))
    :effect (and
      (in ?c)
      (at ?c)                ; synchronize with flight planner's view
      (visited ?c)
      (started)
    )
  )

  ;; Traveler fly does not advance the day (traveler models flight as instantaneous)
  (:action traveler-fly
    :parameters (?from - city ?to - city)
    :precondition (and (in ?from) (direct ?from ?to))
    :effect (and
      (not (in ?from))
      (in ?to)
      (not (at ?from))
      (at ?to)               ; synchronize with flight planner's view
      (visited ?to)
    )
  )

  ;; Traveler advances one day while staying in a city; decrements remain if > 0
  (:action traveler-advance-day
    :parameters (?c - city)
    :precondition (and (in ?c) (<= (day) 11))
    :effect (and
      (increase (day) 1)
      (when (> (remain ?c) 0)
        (decrease (remain ?c) 1)
      )
    )
  )

  ;; Traveler advances a day in Bucharest and marks that friends were met (must be used between day 6 and 11)
  (:action traveler-advance-day-meet
    :parameters (?c - city)
    :precondition (and (in ?c) (= ?c bucharest) (>= (day) 6) (<= (day) 11))
    :effect (and
      (increase (day) 1)
      (when (> (remain ?c) 0)
        (decrease (remain ?c) 1)
      )
      (met-friends)
    )
  )

  ;; -----------------------
  ;; Flight-planner-agent actions
  ;; -----------------------

  ;; Flight planner fly: increments the day when taking a flight (the planner models flight as consuming a day)
  (:action flight-fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to) (< (day) 11))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (in ?from))
      (in ?to)               ; synchronize traveler view
      (visited ?to)
      (increase (day) 1)
    )
  )

  ;; Flight planner can wait / consume a day without moving
  (:action flight-wait
    :parameters ()
    :precondition (< (day) 11)
    :effect (increase (day) 1)
  )

  ;; Flight planner meeting action: marks its own meeting predicate when in Bucharest and day in 6..11
  (:action flight-meet
    :parameters (?c - city)
    :precondition (and (at ?c) (is-bucharest ?c) (not (met)) (>= (day) 6) (<= (day) 11))
    :effect (met)
  )
)