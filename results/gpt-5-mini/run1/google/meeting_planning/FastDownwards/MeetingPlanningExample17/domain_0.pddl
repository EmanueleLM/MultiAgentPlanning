(define (domain alamo-scheduling)
  ; Domain: models a single traveler who meets friends at discrete time slots
  ; Locations: alamo-square and sunset-district
  ; Time is modeled as explicit time-point objects (discrete). Actions advance the global time by deleting the current (time-now X) fact and asserting (time-now Y).
  ; Travel durations and meeting slots are encoded as static predicates (travel-slot and slot-meeting). Actions may only be taken at the exact start time listed in those static predicates.
  ; This design enforces temporal constraints (no concurrency / no overlap) by forcing the planner to move the single global clock forward only via valid meeting or travel actions.
  ; All user preferences are treated as hard constraints: meeting durations, travel durations, availability windows and minimum meeting durations are encoded as allowed slots only.
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent friend location time
  )

  (:predicates
    ; dynamic state
    (at ?p - agent ?l - location)        ; agent is at location (location is a physical site)
    (time-now ?t - time)                 ; global current time is this time-point (unique)
    (met ?f - friend)                    ; friend has been met

    ; static knowledge
    (friend-loc ?f - friend ?l - location)    ; friend is located at this location (for allowed meetings)
    (slot-meeting ?f - friend ?s - time ?e - time) ; allowed meeting slot for friend (start / end)
    (travel-slot ?from - location ?to - location ?d - time ?a - time) ; allowed travel leg (depart / arrive)

    ; successor relation among explicitly modeled timepoints (informational; not required by actions but provided to document chronology)
    (succ ?t1 - time ?t2 - time)
  )

  ; Meeting action: meet a friend at the friend's declared location in a pre-declared slot.
  ; Preconditions:
  ;  - the global clock must be exactly the slot start,
  ;  - agent must be at the friend's location,
  ;  - the friend must be at that location (static),
  ;  - slot-meeting must define this start/end pair,
  ;  - friend has not already been met.
  ; Effects:
  ;  - advance the global clock from start -> end,
  ;  - mark friend as met.
  (:action meet-friend
    :parameters (?p - agent ?f - friend ?loc - location ?s - time ?e - time)
    :precondition (and
      (time-now ?s)
      (at ?p ?loc)
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

  ; Travel action: move the agent from one location to another using a declared travel-slot (enforces travel durations exactly).
  ; Preconditions:
  ;  - the global clock must equal the tenant departure time,
  ;  - the agent must currently be at the departure location,
  ;  - the travel-slot must exist for the depart/arrive time pair.
  ; Effects:
  ;  - advance the global clock to the arrival time,
  ;  - update agent location.
  (:action travel
    :parameters (?p - agent ?from - location ?to - location ?d - time ?a - time)
    :precondition (and
      (time-now ?d)
      (at ?p ?from)
      (travel-slot ?from ?to ?d ?a)
    )
    :effect (and
      (not (time-now ?d))
      (time-now ?a)
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  ; No other actions are provided; there is no token/penalty mechanism and no actions that can violate encoded meeting or travel durations.
)