(define (domain meet-james-combined)
  (:requirements :typing :durative-actions :fluents :negative-preconditions)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
    (met ?p1 - person ?p2 - person)
    (available-window ?p - person ?l - location)
    (available-for-meeting ?p - person)
  )

  (:functions
    (travel-time ?from - location ?to - location)
    (current-time) ; minutes since midnight (optional knowledge)
  )

  ;; ---------------------------
  ;; Agent 1 actions (from meet-james)
  ;; ---------------------------
  ;; Generic travel action that uses the travel-time function.
  (:durative-action agent1_travel
    :parameters (?p - person ?from - location ?to - location)
    :duration (= ?duration (travel-time ?from ?to))
    :condition (and
      (at start (at ?p ?from))
    )
    :effect (and
      (at end (not (at ?p ?from)))
      (at end (at ?p ?to))
    )
  )

  ;; Meeting action requires both people to be at the same location for 15 minutes.
  (:durative-action agent1_meet
    :parameters (?a - person ?b - person ?loc - location)
    :duration (= ?duration 15)
    :condition (and
      (over all (at ?a ?loc))
      (over all (at ?b ?loc))
    )
    :effect (and
      (at end (met ?a ?b))
      (at end (met ?b ?a)) ; record symmetric meeting
    )
  )

  ;; ---------------------------
  ;; Agent 2 actions (from meeting-prep) - kept distinct
  ;; ---------------------------
  ;; Travel from Golden Gate Park to Marina District: fixed 16 minutes
  (:durative-action agent2_travel_ggp_to_marina
    :parameters (?p - person ?from - location ?to - location)
    :duration (= ?duration 16)
    :condition (and (at start (at ?p ?from)))
    :effect (and
      (at start (not (at ?p ?from)))
      (at end (at ?p ?to))
    )
  )

  ;; Travel from Marina District to Golden Gate Park: fixed 18 minutes
  (:durative-action agent2_travel_marina_to_ggp
    :parameters (?p - person ?from - location ?to - location)
    :duration (= ?duration 18)
    :condition (and (at start (at ?p ?from)))
    :effect (and
      (at start (not (at ?p ?from)))
      (at end (at ?p ?to))
    )
  )

  ;; Reserve a contiguous 15-minute block while present and within the known availability window.
  (:durative-action agent2_reserve_15_min_availability
    :parameters (?p - person ?l - location)
    :duration (= ?duration 15)
    :condition (and
      (at start (at ?p ?l))
      (over all (available-window ?p ?l))
    )
    :effect (at end (available-for-meeting ?p))
  )

)