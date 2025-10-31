(define (domain integrated_scheduling)
  (:requirements :strips :typing :fluents :negative-preconditions :numeric-fluents)
  (:types location person schedule)

  (:predicates
    ;; from schedule_generator
    (at ?l - location)
    (met ?p - person)

    ;; from feasibility
    (valid ?s - schedule)
    (at-john ?l - location)
    (at-user ?l - location)
  )

  (:functions
    ;; global time and scoring
    (time)                 ; current time in minutes since midnight
    (met-count)            ; number of friends met (to maximize)

    ;; schedule / feasibility related
    (start ?s - schedule)            ; schedule start time (minutes)
    (duration ?s - schedule)         ; schedule duration (minutes)
    (john-start)                     ; John's availability window start (minutes)
    (john-end)                       ; John's availability window end (minutes)
    (john-latest-start)              ; latest start to fit minimum meeting (minutes)
    (initial-arrival)                ; arrival time at initial location (minutes)
    (travel-time ?from - location ?to - location) ; travel time in minutes
  )

  ;; ---------------------------
  ;; Actions from schedule_generator
  ;; (kept distinct)
  ;; ---------------------------

  ;; Travel from Russian Hill to Golden Gate Park (21 minutes)
  (:action travel-rh-to-ggp
    :parameters ()
    :precondition (at russian_hill)
    :effect (and
      (not (at russian_hill))
      (at golden_gate_park)
      (increase (time) 21)
    )
  )

  ;; Travel from Golden Gate Park to Russian Hill (19 minutes)
  (:action travel-ggp-to-rh
    :parameters ()
    :precondition (at golden_gate_park)
    :effect (and
      (not (at golden_gate_park))
      (at russian_hill)
      (increase (time) 19)
    )
  )

  ;; Wait action that advances time to John's availability start (useful if you arrive early)
  (:action wait-until-john-available
    :parameters ()
    :precondition (<= (time) (john-start))
    :effect (and
      (assign (time) (john-start))
    )
  )

  ;; Wait at Golden Gate Park until John's availability (if you are already there early)
  (:action wait-at-ggp-until-john-available
    :parameters ()
    :precondition (and (at golden_gate_park) (<= (time) (john-start)))
    :effect (and
      (assign (time) (john-start))
    )
  )

  ;; Original meet action (90 minutes minimum meeting). Kept distinct.
  ;; Also increments met-count so metric can maximize number met.
  (:action meet-john
    :parameters ()
    :precondition (and
      (at golden_gate_park)
      (>= (time) (john-start))
      (<= (time) (john-latest-start))
    )
    :effect (and
      (increase (time) 90)
      (met john)
      (increase (met-count) 1)
    )
  )

  ;; ---------------------------
  ;; Actions from feasibility checker
  ;; (kept distinct)
  ;; ---------------------------

  ;; Validate a candidate schedule: marks a schedule as valid if temporal and travel constraints hold.
  (:action validate-schedule
    :parameters (?s - schedule ?from - location ?to - location)
    :precondition (and
      (at-john ?to)                                   ; meeting location must be John's location
      (at-user ?from)                                 ; user starts at this location
      (>= (start ?s) (john-start))                    ; meeting starts no earlier than John is available
      (<= (+ (start ?s) (duration ?s)) (john-end))    ; meeting ends no later than John leaves
      (>= (duration ?s) 90)                           ; meeting duration must meet minimum (90 min)
      (>= (start ?s) (+ (initial-arrival) (travel-time ?from ?to))) ; you must be able to arrive before meeting start
    )
    :effect (and
      (valid ?s)
    )
  )

  ;; Apply a validated schedule: perform the meeting according to the schedule's start and duration.
  ;; Requires that the agent be at the meeting location and current time is at or after the schedule start.
  ;; Increases met-count by 1 and advances the global time by the schedule's duration.
  (:action apply-schedule
    :parameters (?s - schedule ?from - location ?to - location)
    :precondition (and
      (valid ?s)
      (at ?to)
      (at-john ?to)
      (>= (time) (start ?s))
      ;; ensure meeting fits within John's window (redundant with validate but kept for safety)
      (<= (+ (start ?s) (duration ?s)) (john-end))
    )
    :effect (and
      (increase (time) (duration ?s))
      (met john)
      (increase (met-count) 1)
    )
  )
)