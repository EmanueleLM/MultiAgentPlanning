(define (domain meeting-multiagent)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents)
  (:types location person)

  ;; Agent 1 predicates and functions
  (:predicates
    (at ?l - location)            ; Agent1 location predicate
    (met ?p - person)            ; Agent1 meeting predicate
    (at-nobhill)                 ; Agent2 location predicate (kept distinct)
    (at-presidio)
    (met-agent2)                 ; Agent2 meeting predicate (distinct)
  )

  (:functions
    (clock)    ; Agent1: minutes since 9:00AM
    (busy)     ; Agent1 busy flag: 0 = free, 1 = busy
    (time)     ; Agent2: current time in minutes since midnight
  )

  ;; -------------------------
  ;; Agent 1 actions (prefix: agent1-)
  ;; -------------------------

  ;; Agent1: wait 1 minute at current location (advances clock by 1)
  (:durative-action agent1-wait
    :parameters (?loc - location)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at ?loc))
                 (at start (= (busy) 0))
               )
    :effect (and
              (at start (assign (busy) 1))
              (at end (assign (clock) (+ (clock) 1)))
              (at end (assign (busy) 0))
            )
  )

  ;; Agent1: travel Nob Hill -> Presidio (17 minutes)
  (:durative-action agent1-travel-nobhill-presidio
    :parameters ()
    :duration (= ?duration 17)
    :condition (and
                 (at start (at nobhill))
                 (at start (= (busy) 0))
               )
    :effect (and
              (at start (assign (busy) 1))
              (at end (assign (clock) (+ (clock) 17)))
              (at end (not (at nobhill)))
              (at end (at presidio))
              (at end (assign (busy) 0))
            )
  )

  ;; Agent1: travel Presidio -> Nob Hill (18 minutes)
  (:durative-action agent1-travel-presidio-nobhill
    :parameters ()
    :duration (= ?duration 18)
    :condition (and
                 (at start (at presidio))
                 (at start (= (busy) 0))
               )
    :effect (and
              (at start (assign (busy) 1))
              (at end (assign (clock) (+ (clock) 18)))
              (at end (not (at presidio)))
              (at end (at nobhill))
              (at end (assign (busy) 0))
            )
  )

  ;; Agent1: meet Matthew at Presidio for exactly 30 minutes
  ;; Agent1 clock measured from 9:00AM; Matthew availability window: [120, 375] (since 9:00AM).
  ;; Start must be between 120 and 345 inclusive so meeting ends no later than 375.
  (:durative-action agent1-meet-matthew
    :parameters ()
    :duration (= ?duration 30)
    :condition (and
                 (at start (at presidio))
                 (at start (= (busy) 0))
                 (at start (>= (clock) 120))
                 (at start (<= (clock) 345))
               )
    :effect (and
              (at start (assign (busy) 1))
              (at end (assign (clock) (+ (clock) 30)))
              (at end (met matthew))
              (at end (assign (busy) 0))
            )
  )

  ;; -------------------------
  ;; Agent 2 actions (prefix: agent2-)
  ;; -------------------------

  ;; Agent2: travel Nob Hill -> Presidio (17 minutes)
  (:durative-action agent2-travel-nobhill-presidio
    :parameters ()
    :duration (= ?duration 17)
    :condition (and
      (at start (at-nobhill))
    )
    :effect (and
      (at start (not (at-nobhill)))
      (at end (at-presidio))
      (at end (increase (time) ?duration))
    )
  )

  ;; Agent2: travel Presidio -> Nob Hill (18 minutes)
  (:durative-action agent2-travel-presidio-nobhill
    :parameters ()
    :duration (= ?duration 18)
    :condition (and
      (at start (at-presidio))
    )
    :effect (and
      (at start (not (at-presidio)))
      (at end (at-nobhill))
      (at end (increase (time) ?duration))
    )
  )

  ;; Agent2: wait for arbitrary non-negative duration at current location
  (:durative-action agent2-wait
    :parameters (?d)
    :duration (= ?duration ?d)
    :condition (at start (or (at-presidio) (at-nobhill)))
    :effect (at end (increase (time) ?duration))
  )

  ;; Agent2: meet Matthew at Presidio with duration >= 30 minutes
  ;; Agent2 time measured since midnight; availability window: start >= 660 (11:00),
  ;; and start + duration <= 915 (15:15). Duration variable ?d chosen by planner.
  (:durative-action agent2-meet-matthew
    :parameters (?d)
    :duration (>= ?duration 30)
    :condition (and
      (at start (at-presidio))
      (at start (>= (time) 660))
      (at start (<= (+ (time) ?duration) 915))
    )
    :effect (and
      (at end (met-agent2))
      (at end (increase (time) ?duration))
    )
  )

)