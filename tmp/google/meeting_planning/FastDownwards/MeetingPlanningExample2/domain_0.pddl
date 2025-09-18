(define (domain integrated-meetup)
  ;; Combined domain integrating two agents' action models.
  ;; Agent1 actions (prefixed a1-) are durative and use a numeric clock and score.
  ;; Agent2 action (prefixed a2-) is an instantaneous action that uses slot-based availability
  ;; but is constrained to require the agent to be at the meeting location and to advance the same clock.
  (:requirements :strips :typing :durative-actions :negative-preconditions :fluents)
  (:types location person slot)

  (:predicates
    ;; Agent1-style predicates
    (at ?l - location)                         ; agent's current location
    (available ?p - person ?l - location)     ; availability by location (agent1 view)

    ;; Agent2-style predicates (slot-based)
    (available-slot ?p - person ?l - location ?s - slot)
    (next ?s - slot ?s2 - slot)

    ;; Unified met predicate (who has been met)
    (met ?p - person)
  )

  (:functions
    (clock)   ; minutes since 9:00 (start of the day)
    (score)   ; number of friends met (to maximize)
  )

  ;; -----------------------
  ;; Agent 1 actions (durative)
  ;; -----------------------
  ;; Travel between two locations (fixed 15 minutes)
  (:durative-action a1-travel
    :parameters (?from ?to - location)
    :duration (= ?duration 15)
    :condition (at start (at ?from))
    :effect (and
              (at end (not (at ?from)))
              (at end (at ?to))
              (at end (increase (clock) 15))
            )
  )

  ;; Wait at a location for an arbitrary amount of time (non-negative)
  (:durative-action a1-wait
    :parameters (?loc - location)
    :duration (>= ?duration 0)
    :condition (at start (at ?loc))
    :effect (and
              (at end (increase (clock) ?duration))
            )
  )

  ;; Meet a specific person at a location. Meeting must:
  ;; - start while the agent is at the location
  ;; - the person must be available at that location (agent1-style availability fact)
  ;; - start no earlier than 3:15PM (375 minutes after 9:00)
  ;; - finish no later than 8:15PM (675 minutes after 9:00)
  ;; - last at least 90 minutes
  ;; Meeting increases the score by 1 and marks the person as met.
  (:durative-action a1-meet-person
    :parameters (?p - person ?loc - location)
    :duration (>= ?duration 90)
    :condition (and
                 (at start (at ?loc))
                 (at start (available ?p ?loc))
                 ;; meeting must start no earlier than 3:15PM (375)
                 (at start (>= (clock) 375))
                 ;; meeting must finish no later than 8:15PM (675):
                 ;; start_time + duration <= 675
                 (at start (<= (+ (clock) ?duration) 675))
               )
    :effect (and
              (at end (met ?p))
              (at end (increase (clock) ?duration))
              (at end (increase (score) 1))
            )
  )

  ;; -----------------------
  ;; Agent 2 action (slot-based, instantaneous)
  ;; -----------------------
  ;; Start a meeting that occupies six consecutive 15-minute slots (90 minutes).
  ;; This action respects the slot-availability facts from agent2, requires the agent to be at
  ;; the meeting location, and advances the common clock and score so both agents coordinate.
  (:action a2-start-meeting
    :parameters (?p - person ?loc - location
                 ?s  - slot ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot ?s5 - slot)
    :precondition (and
      ;; slot-based availability for six consecutive 15-min slots
      (available-slot ?p ?loc ?s)  (available-slot ?p ?loc ?s1)  (available-slot ?p ?loc ?s2)
      (available-slot ?p ?loc ?s3) (available-slot ?p ?loc ?s4)  (available-slot ?p ?loc ?s5)
      ;; consecutive slots
      (next ?s ?s1) (next ?s1 ?s2) (next ?s2 ?s3) (next ?s3 ?s4) (next ?s4 ?s5)
      ;; agent must be physically at the meeting location (so agent1's movements are relevant)
      (at ?loc)
      ;; start not before 3:15PM (375) and finish no later than 8:15PM (675)
      (>= (clock) 375)
      (<= (+ (clock) 90) 675)
    )
    :effect (and
      ;; mark the person as met (unified predicate)
      (met ?p)
      ;; advance the unified clock by 90 minutes and increase the score
      (increase (clock) 90)
      (increase (score) 1)
    )
  )
)