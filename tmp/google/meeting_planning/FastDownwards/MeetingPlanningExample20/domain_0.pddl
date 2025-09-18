(define (domain joint-meeting)
  ;; Joint domain for two agents to meet Joseph.
  ;; Requirements: durative actions, numeric fluents, timed initial literals
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents :timed-initial-literals)
  (:types agent location person)

  ;; Predicates
  (:predicates
    (at ?a - agent ?l - location)           ; agent is at location
    (at-person ?p - person ?l - location)  ; person is at location
    (available ?a - agent)                  ; agent is available for meeting now
    (person-available ?p - person)         ; person is available for meeting now
    (in-transit ?a - agent)                ; agent is currently traveling
    (in-meeting ?a - agent)                ; agent is currently in the meeting
    (met-joseph)                           ; meeting (>=75 minutes) with Joseph has occurred
  )

  ;; Numeric function(s) -- travel-time is used as (travel-time from to agent)
  (:functions (travel-time))

  ;; Travel actions are agent-specific and distinct.
  (:durative-action agent1_travel
    :parameters (?from ?to - location)
    :duration (= ?duration (travel-time ?from ?to agent1))
    :condition (and
                 (at start (at agent1 ?from))
                 (at start (not (in-transit agent1)))
               )
    :effect (and
              (at start (not (at agent1 ?from)))
              (at start (in-transit agent1))
              (at end (not (in-transit agent1)))
              (at end (at agent1 ?to))
            )
  )

  (:durative-action agent2_travel
    :parameters (?from ?to - location)
    :duration (= ?duration (travel-time ?from ?to agent2))
    :condition (and
                 (at start (at agent2 ?from))
                 (at start (not (in-transit agent2)))
               )
    :effect (and
              (at start (not (at agent2 ?from)))
              (at start (in-transit agent2))
              (at end (not (in-transit agent2)))
              (at end (at agent2 ?to))
            )
  )

  ;; Joint meeting action that requires both agents and Joseph to be present and available
  ;; throughout the meeting. The duration must be at least 75 (minutes).
  ;; This is a synchronized action named to reflect both agents (keeps actions distinct in name).
  (:durative-action agent1_agent2_meet_joseph
    :parameters (?loc - location ?p - person)
    :duration (>= ?duration 75)
    :condition (and
                 (at start (at agent1 ?loc))
                 (at start (at agent2 ?loc))
                 (at start (at-person ?p ?loc))
                 ;; require availability throughout the meeting
                 (over all (available agent1))
                 (over all (available agent2))
                 (over all (person-available ?p))
               )
    :effect (and
              (at start (in-meeting agent1))
              (at start (in-meeting agent2))
              (at end (not (in-meeting agent1)))
              (at end (not (in-meeting agent2)))
              (at end (met-joseph))
            )
  )
)