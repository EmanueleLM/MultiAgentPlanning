(define (domain combined-meet-john)
  (:requirements :typing :negative-preconditions :equality :numeric-fluents)
  (:types location)

  (:predicates
    (at-you ?l - location)    ; location of agent "you" (agent 1)
    (at ?l - location)        ; location of agent "other" (agent 2)
    (met)                     ; meeting with John accomplished
  )

  (:functions
    (current-time)            ; unified current time in minutes since midnight
    (john-available-start)    ; John's availability start (minutes)
    (john-available-end)      ; John's availability end (minutes)
  )

  ;; Agent 1 (from first agent): travel Richmond District -> North Beach (17 min)
  (:action travel_richmond_to_north_agent1
    :parameters ()
    :precondition (at-you richmond-district)
    :effect (and
      (not (at-you richmond-district))
      (at-you north-beach)
      (increase (current-time) 17)
    )
  )

  ;; Agent 1: travel North Beach -> Richmond District (18 min)
  (:action travel_north_to_richmond_agent1
    :parameters ()
    :precondition (at-you north-beach)
    :effect (and
      (not (at-you north-beach))
      (at-you richmond-district)
      (increase (current-time) 18)
    )
  )

  ;; Agent 1: wait by 1 minute while located somewhere (discrete increment)
  (:action wait_agent1
    :parameters (?l - location)
    :precondition (at-you ?l)
    :effect (and
      (increase (current-time) 1)
    )
  )

  ;; Agent 2 (from second agent): travel richmond-district -> north-beach (17 min)
  (:action travel_rd_to_nb_agent2
    :parameters ()
    :precondition (at richmond-district)
    :effect (and
      (not (at richmond-district))
      (at north-beach)
      (increase (current-time) 17)
    )
  )

  ;; Agent 2: travel north-beach -> richmond-district (18 min)
  (:action travel_nb_to_rd_agent2
    :parameters ()
    :precondition (at north-beach)
    :effect (and
      (not (at north-beach))
      (at richmond-district)
      (increase (current-time) 18)
    )
  )

  ;; Agent 2: wait by 1 minute while located somewhere (discrete increment)
  (:action wait_agent2
    :parameters (?l - location)
    :precondition (at ?l)
    :effect (and
      (increase (current-time) 1)
    )
  )

  ;; Joint meeting action: requires both agents present at north-beach,
  ;; meeting lasts 75 minutes (satisfies "at least 75 minutes").
  ;; Meeting can only start within John's availability window and must finish by his end time.
  (:action meet_john_both_agents
    :parameters ()
    :precondition (and
      (at-you north-beach)
      (at north-beach)
      (>= (current-time) (john-available-start))
      (<= (+ (current-time) 75) (john-available-end))
    )
    :effect (and
      (met)
      (increase (current-time) 75)
    )
  )

)