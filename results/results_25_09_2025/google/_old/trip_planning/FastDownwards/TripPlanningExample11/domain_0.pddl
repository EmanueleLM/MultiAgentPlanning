(define (domain integrated_trip)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types city)

  (:predicates
    (at ?c - city)
    (direct ?from ?to - city)
    (started)
    (conf9-done)    ; predicate from agent1
    (conf15-done)   ; predicate from agent1
    (attended9)     ; predicate from agent2
    (attended15)    ; predicate from agent2
  )

  (:functions
    (day)                ; global day counter (starts at 1). After 15 days goal is day = 16
    (spent ?c - city)    ; days spent in each city (for tracking)
  )

  ;; ---------------------------
  ;; Agent1 actions (names kept distinct)
  ;; ---------------------------

  ;; Agent1: begin the itinerary in a city (consumes the first day)
  (:action agent1-begin
    :parameters (?c - city)
    :precondition (and (not (started)) (<= (day) 15))
    :effect (and
      (started)
      (at ?c)
      (increase (day) 1)
      (increase (spent ?c) 1)
    )
  )

  ;; Agent1: stay one day in the current city
  (:action agent1-stay
    :parameters (?c - city)
    :precondition (and (at ?c) (<= (day) 15))
    :effect (and
      (increase (day) 1)
      (increase (spent ?c) 1)
    )
  )

  ;; Agent1: take a direct flight (consumes one day)
  (:action agent1-fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to) (<= (day) 15))
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (day) 1)
    )
  )

  ;; Agent1: attend conference actions (Valencia on exact days)
  (:action agent1-attend-day9
    :parameters ()
    :precondition (and (at valencia) (= (day) 9) (not (conf9-done)))
    :effect (and
      (conf9-done)
      (attended9)    ; also synchronize agent2's predicate so both agents see the attendance
    )
  )

  (:action agent1-attend-day15
    :parameters ()
    :precondition (and (at valencia) (= (day) 15) (not (conf15-done)))
    :effect (and
      (conf15-done)
      (attended15)   ; synchronize with agent2
    )
  )

  ;; ---------------------------
  ;; Agent2 actions (names kept distinct)
  ;; ---------------------------

  ;; Agent2: fly (uses direct connectivity). In the integrated model flights consume a day.
  (:action agent2-fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to) (<= (day) 15))
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (day) 1)
    )
  )

  ;; Agent2: stay one day in a city (tracks spent counters)
  (:action agent2-stay
    :parameters (?c - city)
    :precondition (and (at ?c) (<= (day) 15))
    :effect (and
      (increase (day) 1)
      (increase (spent ?c) 1)
    )
  )

  ;; Agent2: attend conference actions (Valencia on exact days)
  ;; These also set agent1's predicates to keep both agents' views synchronized.
  (:action agent2-attend-conference-day9
    :parameters ()
    :precondition (and (at valencia) (= (day) 9) (not (attended9)))
    :effect (and
      (attended9)
      (conf9-done)
    )
  )

  (:action agent2-attend-conference-day15
    :parameters ()
    :precondition (and (at valencia) (= (day) 15) (not (attended15)))
    :effect (and
      (attended15)
      (conf15-done)
    )
  )

)