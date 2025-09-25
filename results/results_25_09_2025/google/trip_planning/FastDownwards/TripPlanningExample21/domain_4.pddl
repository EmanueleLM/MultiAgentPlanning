(define (domain trip-planning-multiagent)
  (:requirements :typing :negative-preconditions :equality)
  (:types day city venice_slot mykonos_slot vienna_slot)
  (:constants venice mykonos vienna - city)

  (:predicates
    (assigned ?d - day)
    (at ?d - day ?c - city)
    (previous ?d - day ?pd - day)
    (first-day ?d - day)
    (direct-flight ?c1 - city ?c2 - city)
    (workshop-window ?d - day)
    (workshop-attended)
    (visited-venice)
    (visited-mykonos)
    (visited-vienna)
    (vacant-venice ?s - venice_slot)
    (vacant-mykonos ?s - mykonos_slot)
    (vacant-vienna ?s - vienna_slot)
  )

  (:action traveler-assign-first-to-venice
    :parameters (?d - day ?s - venice_slot)
    :precondition (and (first-day ?d) (not (assigned ?d)) (vacant-venice ?s))
    :effect (and (assigned ?d) (at ?d venice) (not (vacant-venice ?s)) (visited-venice))
  )

  (:action traveler-assign-first-to-mykonos
    :parameters (?d - day ?s - mykonos_slot)
    :precondition (and (first-day ?d) (not (assigned ?d)) (vacant-mykonos ?s))
    :effect (and (assigned ?d) (at ?d mykonos) (not (vacant-mykonos ?s)) (visited-mykonos))
  )

  (:action traveler-assign-first-to-vienna
    :parameters (?d - day ?s - vienna_slot)
    :precondition (and (first-day ?d) (not (assigned ?d)) (vacant-vienna ?s))
    :effect (and (assigned ?d) (at ?d vienna) (not (vacant-vienna ?s)) (visited-vienna))
  )

  ;; same-city continuation actions (no flight needed)
  (:action traveler-assign-next-venice-same
    :parameters (?d - day ?pd - day ?s - venice_slot)
    :precondition (and (previous ?d ?pd) (at ?pd venice) (not (assigned ?d)) (vacant-venice ?s))
    :effect (and (assigned ?d) (at ?d venice) (not (vacant-venice ?s)) (visited-venice))
  )

  (:action traveler-assign-next-mykonos-same
    :parameters (?d - day ?pd - day ?s - mykonos_slot)
    :precondition (and (previous ?d ?pd) (at ?pd mykonos) (not (assigned ?d)) (vacant-mykonos ?s))
    :effect (and (assigned ?d) (at ?d mykonos) (not (vacant-mykonos ?s)) (visited-mykonos))
  )

  (:action traveler-assign-next-vienna-same
    :parameters (?d - day ?pd - day ?s - vienna_slot)
    :precondition (and (previous ?d ?pd) (at ?pd vienna) (not (assigned ?d)) (vacant-vienna ?s))
    :effect (and (assigned ?d) (at ?d vienna) (not (vacant-vienna ?s)) (visited-vienna))
  )

  ;; flight arrival actions (require direct flight from previous city)
  (:action traveler-assign-next-venice-by-flight
    :parameters (?d - day ?pd - day ?prevcity - city ?s - venice_slot)
    :precondition (and (previous ?d ?pd) (at ?pd ?prevcity) (not (assigned ?d)) (direct-flight ?prevcity venice) (vacant-venice ?s))
    :effect (and (assigned ?d) (at ?d venice) (not (vacant-venice ?s)) (visited-venice))
  )

  (:action traveler-assign-next-mykonos-by-flight
    :parameters (?d - day ?pd - day ?prevcity - city ?s - mykonos_slot)
    :precondition (and (previous ?d ?pd) (at ?pd ?prevcity) (not (assigned ?d)) (direct-flight ?prevcity mykonos) (vacant-mykonos ?s))
    :effect (and (assigned ?d) (at ?d mykonos) (not (vacant-mykonos ?s)) (visited-mykonos))
  )

  (:action traveler-assign-next-vienna-by-flight
    :parameters (?d - day ?pd - day ?prevcity - city ?s - vienna_slot)
    :precondition (and (previous ?d ?pd) (at ?pd ?prevcity) (not (assigned ?d)) (direct-flight ?prevcity vienna) (vacant-vienna ?s))
    :effect (and (assigned ?d) (at ?d vienna) (not (vacant-vienna ?s)) (visited-vienna))
  )

  (:action traveler-attend-workshop
    :parameters (?d - day)
    :precondition (and (workshop-window ?d) (at ?d venice))
    :effect (workshop-attended)
  )

  ;; Flight agent actions (perform moves using direct flights and consume slots)
  (:action flight_agent-fly-to-venice
    :parameters (?d - day ?pd - day ?from - city ?s - venice_slot)
    :precondition (and (previous ?d ?pd) (at ?pd ?from) (not (assigned ?d)) (direct-flight ?from venice) (vacant-venice ?s))
    :effect (and (assigned ?d) (at ?d venice) (not (vacant-venice ?s)) (visited-venice))
  )

  (:action flight_agent-fly-to-mykonos
    :parameters (?d - day ?pd - day ?from - city ?s - mykonos_slot)
    :precondition (and (previous ?d ?pd) (at ?pd ?from) (not (assigned ?d)) (direct-flight ?from mykonos) (vacant-mykonos ?s))
    :effect (and (assigned ?d) (at ?d mykonos) (not (vacant-mykonos ?s)) (visited-mykonos))
  )

  (:action flight_agent-fly-to-vienna
    :parameters (?d - day ?pd - day ?from - city ?s - vienna_slot)
    :precondition (and (previous ?d ?pd) (at ?pd ?from) (not (assigned ?d)) (direct-flight ?from vienna) (vacant-vienna ?s))
    :effect (and (assigned ?d) (at ?d vienna) (not (vacant-vienna ?s)) (visited-vienna))
  )

)