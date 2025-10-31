(define (domain sf-meet)
  ; Domain for two agents (traveler, andrew) with temporal actions and numeric tracking.
  (:requirements :typing :durative-actions :negative-preconditions :conditional-effects :fluents)
  (:types agent location)

  (:constants
    traveler andrew - agent
    Presidio UnionSquare - location
  )

  (:predicates
    (at ?ag - agent ?loc - location)
    (met-andrew) ; true once traveler has been counted as having met Andrew
  )

  (:functions
    (current-time)    ; minutes since midnight, global clock
    (andrew-time)     ; cumulative minutes spent meeting Andrew
    (num-friends-met) ; integer count of distinct friends met
  )

  ; TRAVEL: traveler moves from Presidio -> Union Square (fixed discrete duration 22)
  (:durative-action travel-presidio-to-unionsq
    :duration (= ?duration 22)
    :condition (and
      (at start (at traveler Presidio))
    )
    :effect (and
      (at start (not (at traveler Presidio)))
      (at end (at traveler UnionSquare))
      (at end (increase (current-time) 22))
    )
  )

  ; TRAVEL: traveler moves from Union Square -> Presidio (fixed discrete duration 24)
  (:durative-action travel-unionsq-to-presidio
    :duration (= ?duration 24)
    :condition (and
      (at start (at traveler UnionSquare))
    )
    :effect (and
      (at start (not (at traveler UnionSquare)))
      (at end (at traveler Presidio))
      (at end (increase (current-time) 24))
    )
  )

  ; MEETING: joint (distinct) meeting action requiring traveler and Andrew at Union Square.
  ; Duration variable ?d (minutes) with hard lower bound 105 (user requirement),
  ; and an upper bound constrained by Andrew's availability window (max 360 here to bound variable).
  ; Temporal constraints ensure meeting starts no earlier than Andrew arrival (11:15 = 675)
  ; and ends no later than Andrew departure (17:15 = 1035). The meeting increments numeric tracking:
  ; - increases current-time by ?d
  ; - increases andrew-time by ?d
  ; - increases num-friends-met by 1 only the first time (sets met-andrew predicate).
  (:durative-action meet-with-andrew
    :parameters (?d - number)
    :duration (and (>= ?duration ?d) (= ?duration ?d) (>= ?d 105) (<= ?d 360))
    :condition (and
      (at start (at traveler UnionSquare))
      (at start (at andrew UnionSquare))
      ; Andrew is present only from 11:15 (675) to 17:15 (1035)
      (at start (>= (current-time) 675)) ; cannot start before Andrew arrives
      (at end (<= (+ (current-time) ?d) 1035)) ; ensure end time <= Andrew departure
    )
    :effect (and
      ; advance global time by meeting duration and accumulate Andrew meeting minutes
      (at end (increase (current-time) ?d))
      (at end (increase (andrew-time) ?d))
      ; if traveler hasn't been counted as met yet, mark and increment friend-count once
      (at end (when (not (met-andrew))
                  (and
                    (increase (num-friends-met) 1)
                    (met-andrew)
                  )))
    )
  )

  ; No separate Andrew-specific action is required for availability because Andrew's availability
  ; is enforced by temporal constraints on durations and the meeting preconditions. Actions remain
  ; distinct by name (traveler travel actions vs. joint meeting action).
)