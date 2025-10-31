(define (domain meeting-scheduling)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types agent location)

  ;; Predicates
  (:predicates
    (at ?a - agent ?l - location)
    (meeting-active)
    (meeting-scheduled)
  )

  ;; Numeric fluents (time measured in integer minutes)
  (:functions
    (time)                      ;; current global time in minutes
    (meeting-progress)          ;; minutes of meeting completed
    (avail-from ?a - agent)     ;; agent availability start (minutes)
    (avail-to ?a - agent)       ;; agent availability end (minutes)
    (travel-time ?from - location ?to - location) ;; minutes to travel between locations
    (meeting-start-time)        ;; recorded meeting start time
  )

  ;; Actions

  ;; Generic travel action: moves an agent and advances time by travel-time(from,to)
  (:action travel
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (not (meeting-active)) ;; cannot start travel while a meeting is active
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (increase (time) (travel-time ?from ?to))
    )
  )

  ;; Waiting action: agent waits at current location for 1 minute (advances time)
  (:action wait
    :parameters (?a - agent)
    :precondition (and
      (exists (?l - location) (at ?a ?l)) ;; agent must be located somewhere
      (not (meeting-active))
    )
    :effect (and
      (increase (time) 1)
    )
  )

  ;; Start the meeting at a location where all participants are present and available now
  (:action start-meeting
    :parameters (?loc - location ?a1 - agent ?a2 - agent)
    :precondition (and
      (at ?a1 ?loc)
      (at ?a2 ?loc)
      (not (meeting-active))
      ;; current time must be within both agents' availability windows for starting
      (>= (time) (avail-from ?a1))
      (>= (time) (avail-from ?a2))
      (<= (time) (avail-to ?a1))
      (<= (time) (avail-to ?a2))
    )
    :effect (and
      (meeting-active)
      ;; initialize meeting-progress to 0 and record start time
      (assign (meeting-progress) 0)
      (assign (meeting-start-time) (time))
      ;; also set the planner metric (total-cost) implicitly by setting meeting-start-time;
      ;; problem will use meeting-start-time for objective minimization if desired
    )
  )

  ;; Advance the meeting by 1 minute (must remain within availability windows)
  (:action meet-one-minute
    :parameters (?loc - location ?a1 - agent ?a2 - agent)
    :precondition (and
      (meeting-active)
      (at ?a1 ?loc)
      (at ?a2 ?loc)
      ;; this minute (the minute we are about to consume) must be within both agents' availability
      (>= (time) (avail-from ?a1))
      (>= (time) (avail-from ?a2))
      ;; after consuming 1 minute, time must still be <= avail-to (i.e., minute is allowed)
      (<= (+ (time) 1) (avail-to ?a1))
      (<= (+ (time) 1) (avail-to ?a2))
    )
    :effect (and
      (increase (time) 1)
      (increase (meeting-progress) 1)
    )
  )

  ;; End the meeting once minimum required minutes reached
  (:action end-meeting
    :parameters ()
    :precondition (and
      (meeting-active)
      (>= (meeting-progress) 105) ;; enforce meeting length >= 105 minutes
    )
    :effect (and
      (not (meeting-active))
      (meeting-scheduled)
    )
  )
)