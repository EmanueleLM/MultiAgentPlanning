(define (domain alamo-scheduling)
  ; Revised domain for MeetingPlanningExample17
  ; Simple, explicit time modeling with discrete timepoint objects.
  ; Actions advance the unique global clock (time-now) by deleting current time and asserting the arrival time.
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent friend location time
  )

  (:predicates
    ; dynamic state
    (at ?a - agent ?l - location)        ; agent is at a location
    (time-now ?t - time)                 ; global current time (unique)
    (met ?f - friend)                    ; friend has been met

    ; static knowledge (declarations about allowable meetings and travel legs)
    (friend-loc ?f - friend ?l - location)    ; friend is located at this location
    (slot-meeting ?f - friend ?s - time ?e - time) ; permitted meeting: start -> end
    (travel-slot ?from - location ?to - location ?d - time ?a - time) ; permitted travel depart/arrive
  )

  ; Meet a friend during a declared meeting slot.
  ; Preconditions:
  ;  - global clock must equal meeting start,
  ;  - the agent must be at the friend's location,
  ;  - the friend's location is declared,
  ;  - the slot-meeting exists,
  ;  - the friend has not been met yet.
  ; Effects:
  ;  - advance global time to meeting end,
  ;  - mark friend as met.
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

  ; Travel between locations according to declared travel slots (enforces travel durations).
  ; Preconditions:
  ;  - global clock equals departure time,
  ;  - agent is at departure location,
  ;  - a travel-slot exists for this depart/arrive time pair.
  ; Effects:
  ;  - advance global clock to arrival time,
  ;  - update agent location.
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
)