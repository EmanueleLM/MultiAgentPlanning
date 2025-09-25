(define (domain meet-domain)
  ;; Domain modeling two agents (traveler, mary), locations, discrete time as a numeric function.
  ;; Modeling decisions (documented here):
  ;; - Global numeric function (time) models minutes since midnight. Initial time = 540 (09:00).
  ;; - Mary is not assumed to be at Nob Hill before 12:00 (720). To model her availability window,
  ;;   there is an action (mary-start) that places Mary at Nob Hill at or after time >= 720.
  ;; - To avoid a huge number of 1-minute wait actions, a jump-wait action (traveler-wait-to-720)
  ;;   assigns the global time to 720 in one step when time <= 720. This is a modeling convenience
  ;;   (explicitly chosen; no other implicit waits are assumed).
  ;; - Travel actions increase time by the given travel durations (9 and 7 minutes).
  ;; - The meeting is modeled as a single traveler-prefixed action (traveler-meet-mary) that
  ;;   requires both agents to be at Nob Hill and the meeting to finish by Mary's end time (975).
  ;;   The meeting increases time by 75 (the required minimum meeting duration) and achieves (met).
  ;; - All agent-specific actions are prefixed with the agent name (traveler-*, mary-*).
  (:requirements :strips :typing :fluents :negative-preconditions :equality)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (met) ; true once the traveler & Mary have met for the required duration
  )

  (:functions
    (time) ; minutes since midnight, e.g., 540 == 09:00, 720 == 12:00, 975 == 16:15
  )

  ;; Traveler can jump-wait to 12:00 (720) if current time is <= 720.
  (:action traveler-wait-to-720
    :precondition (and (<= (time) 720))
    :effect (and
      (assign (time) 720)
    )
  )

  ;; Traveler travel from Union Square to Nob Hill: takes 9 minutes.
  (:action traveler-travel-us-to-nh
    :precondition (and (at traveler union_square))
    :effect (and
      (not (at traveler union_square))
      (at traveler nob_hill)
      (increase (time) 9)
    )
  )

  ;; Traveler travel from Nob Hill to Union Square: takes 7 minutes.
  (:action traveler-travel-nh-to-us
    :precondition (and (at traveler nob_hill))
    :effect (and
      (not (at traveler nob_hill))
      (at traveler union_square)
      (increase (time) 7)
    )
  )

  ;; The meeting action is prefixed with traveler. It requires both agents at Nob Hill,
  ;; meeting start no earlier than 12:00 and meeting end (time + 75) no later than 16:15 (975).
  ;; It increases global time by 75 minutes and achieves (met).
  (:action traveler-meet-mary
    :precondition (and
      (at traveler nob_hill)
      (at mary nob_hill)
      (>= (time) 720)                      ; meeting cannot start before Mary's earliest presence
      (<= (+ (time) 75) 975)               ; meeting must end by Mary's end time (16:15 == 975)
      (not (met))
    )
    :effect (and
      (met)
      (increase (time) 75)
    )
  )

  ;; Mary becomes present at Nob Hill at or after 12:00 (720). We model this as an explicit action
  ;; (mary-start). It places Mary at Nob Hill and can only occur at time >= 720 (and <= 975).
  ;; This models Mary's private availability window [720,975].
  (:action mary-start
    :precondition (and (>= (time) 720) (<= (time) 975))
    :effect (and
      (at mary nob_hill)
    )
  )
)