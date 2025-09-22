(define (domain integrated-meet-mary)
  ;; Combined domain for both agents (traveler and mary).
  ;; Requirements: numeric fluents for current-time, typing, and negative preconditions.
  (:requirements :typing :fluents :negative-preconditions :numeric-fluents)
  (:types person location)

  ;; Known locations as domain constants for ease of reference.
  (:constants union-square nob-hill - location)

  ;; Predicates:
  ;;  (at ?p ?l)       : person ?p is at location ?l
  ;;  (met ?p)         : the traveler has met person ?p for the required duration (goal predicate)
  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person)
  )

  ;; Global current time in minutes since midnight.
  (:functions
    (current-time)  ; minutes since midnight
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Traveler-actions (prefixed with traveler_)
  ;; These model instantaneous moves that advance the shared current-time.
  ;; Travel durations are public information and must be respected by both agents.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Traveler: Union Square -> Nob Hill (9 minutes)
  (:action traveler_travel_union_to_nob
    :precondition (at traveler union-square)
    :effect (and
              (not (at traveler union-square))
              (at traveler nob-hill)
              (increase (current-time) 9)
            )
  )

  ;; Traveler: Nob Hill -> Union Square (7 minutes)
  (:action traveler_travel_nob_to_union
    :precondition (at traveler nob-hill)
    :effect (and
              (not (at traveler nob-hill))
              (at traveler union-square)
              (increase (current-time) 7)
            )
  )

  ;; Traveler: Wait until 12:00 (720) if currently earlier than 12:00.
  ;; This is a single jump action to avoid many small increments.
  ;; Precondition ensures it is only used when current-time < 720.
  ;; Effect sets current-time to 720 (fast-forward).
  ;; NOTE: We deliberately model this as an assign to simplify scheduling;
  ;; FastDownward supports numeric assign/increase effects.
  (:action traveler_wait_until_720
    :precondition (< (current-time) 720)
    :effect (assign (current-time) 720)
  )

  ;; Traveler: Meet Mary at Nob Hill for at least 75 minutes.
  ;; Preconditions:
  ;;   - both traveler and mary are at nob-hill at the start of the action
  ;;   - meeting cannot start before Mary's earliest availability (12:00 = 720)
  ;;   - meeting must finish by Mary's latest availability (16:15 = 975)
  ;; Effects:
  ;;   - record that traveler has met Mary (met mary)
  ;;   - advance time by 75 minutes (the meeting duration; models "at least 75")
  (:action traveler_meet_mary
    :precondition (and
                    (at traveler nob-hill)
                    (at mary nob-hill)
                    (>= (current-time) 720)
                    (<= (+ (current-time) 75) 975)
                  )
    :effect (and
              (met mary)
              (increase (current-time) 75)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Mary-actions (prefixed with mary_)
  ;; We include Mary travel actions for completeness, but in this integrated
  ;; problem we assume Mary is present at Nob Hill during her availability
  ;; window. These actions are available if the planner wants to move Mary.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Mary: Union Square -> Nob Hill (9 minutes)
  (:action mary_travel_union_to_nob
    :precondition (at mary union-square)
    :effect (and
              (not (at mary union-square))
              (at mary nob-hill)
              (increase (current-time) 9)
            )
  )

  ;; Mary: Nob Hill -> Union Square (7 minutes)
  (:action mary_travel_nob_to_union
    :precondition (at mary nob-hill)
    :effect (and
              (not (at mary nob-hill))
              (at mary union-square)
              (increase (current-time) 7)
            )
  )

  ;; Optional: allow Mary to wait by fast-forwarding to 720 (same rationale as traveler).
  (:action mary_wait_until_720
    :precondition (< (current-time) 720)
    :effect (assign (current-time) 720)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Notes / Modeling decisions (documented in comments):
  ;; - We unified the two agent PDDL fragments into a single shared-time model
  ;;   using a global numeric function (current-time) that both agents' actions update.
  ;; - To avoid durative actions (FastDownward's classical planner handles numeric
  ;;   effects more portably), meeting and travel are instantaneous actions that
  ;;   increase current-time by their duration.
  ;; - To let the traveler wait until Mary's availability without requiring many
  ;;   1-minute waits, we added "wait_until_720" actions that assign current-time=720
  ;;   when current-time<720. This is a pragmatic resolution to model waiting.
  ;; - We assume Mary's availability window is 12:00 (720) to 16:15 (975) at Nob Hill.
  ;;   For this integrated problem, we assert (at mary nob-hill) in the problem file
  ;;   initial state and do not force Mary to move away during the window. If required,
  ;;   Mary can be moved using mary_travel_* actions, but the meeting action enforces
  ;;   that both agents are at nob-hill during the meeting and that the time window is respected.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)