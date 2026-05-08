(define (domain alamo-scheduling)
  ; Domain revised for MeetingPlanningExample17
  ; Discrete timepoints with explicit next-time relation.
  ; Actions: wait (advance clock along allowed timepoints),
  ; travel (move between locations using declared travel slots),
  ; meet-friend (meet during declared meeting slot).
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent friend location time
  )

  (:predicates
    (at ?a - agent ?l - location)             ; agent is at a location
    (time-now ?t - time)                      ; global current timepoint
    (met ?f - friend)                         ; friend has been met

    (friend-loc ?f - friend ?l - location)    ; friend's location
    (slot-meeting ?f - friend ?s - time ?e - time) ; allowed meeting start/end
    (travel-slot ?from - location ?to - location ?d - time ?a - time) ; allowed travel depart->arrive
    (next-time ?t1 - time ?t2 - time)         ; temporal ordering between discrete timepoints
  )

  ; Wait: advance the global clock along declared next-time links without changing location.
  (:action wait
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and
      (time-now ?t1)
      (next-time ?t1 ?t2)
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
    )
  )

  ; Travel: move between locations using declared travel-slot, advancing the clock to arrival time.
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?d - time ?arr - time)
    :precondition (and
      (time-now ?d)
      (at ?a ?from)
      (travel-slot ?from ?to ?d ?arr)
    )
    :effect (and
      (not (time-now ?d))
      (time-now ?arr)
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  ; Meet a friend: must start exactly at the slot start; advances time to slot end and marks met.
  (:action meet-friend
    :parameters (?a - agent ?f - friend ?loc - location ?s - time ?e - time)
    :precondition (and
      (time-now ?s)
      (at ?a ?loc)
      (friend-loc ?f ?loc)
      (slot-meeting ?f ?s ?e)
      (not (met ?f))
    )
    :effect (and
      (not (time-now ?s))
      (time-now ?e)
      (met ?f)
    )
  )
)