(define (domain multi-agent-meeting)
  (:requirements :strips :typing :fluents :negative-preconditions :adl)
  (:types agent location)

  ;; numeric functions
  (:functions
    (now)
    (earliest ?a - agent)
    (latest ?a - agent)
    (travel-time ?from - location ?to - location)
  )

  (:predicates
    (at ?a - agent ?l - location)
    (met)  ;; meeting accomplished
  )

  ;; Actions for "you" (prefixed with you_)
  (:action you_move
    :parameters (?from - location ?to - location)
    :precondition (at you ?from)
    :effect (and
              (not (at you ?from))
              (at you ?to)
              ;; advance global time by travel-time for this leg
              (increase (now) (travel-time ?from ?to))
            )
  )

  ;; Actions for "David" (prefixed with david_)
  (:action david_move
    :parameters (?from - location ?to - location)
    :precondition (at david ?from)
    :effect (and
              (not (at david ?from))
              (at david ?to)
              (increase (now) (travel-time ?from ?to))
            )
  )

  ;; Waiting actions to allow time to advance when needed (simple discrete waits).
  ;; These are generic (no agent-specific preconditions) so planner can insert waiting
  ;; to meet availability windows.
  (:action wait_15
    :precondition ()
    :effect (and (increase (now) 15))
  )
  (:action wait_60
    :precondition ()
    :effect (and (increase (now) 60))
  )
  (:action wait_300
    :precondition ()
    :effect (and (increase (now) 300))
  )

  ;; Joint meeting action labeled to show the participants
  ;; Enforces both agents be co-located and that the meeting (>=105 minutes) fits
  ;; into both agents' availability windows.
  (:action meet_you_david
    :parameters (?loc - location)
    :precondition (and
                    (at you ?loc)
                    (at david ?loc)
                    ;; meeting can only start when both are available
                    (>= (now) (earliest you))
                    (>= (now) (earliest david))
                    ;; meeting must finish within each agent's latest available time
                    (<= (+ (now) 105) (latest you))
                    (<= (+ (now) 105) (latest david))
                  )
    :effect (and
              ;; meeting consumes time (at least 105 minutes)
              (increase (now) 105)
              (met)
            )
  )
)