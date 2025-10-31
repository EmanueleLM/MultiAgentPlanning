(define (domain trip-planning-multiagent)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality)
  (:types day city venice_slot mykonos_slot vienna_slot)

  (:predicates
    (assigned ?d - day)
    (in ?d - day ?c - city)
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
    :effect (and (assigned ?d) (in ?d venice) (not (vacant-venice ?s)) (visited-venice))
  )

  (:action traveler-assign-first-to-mykonos
    :parameters (?d - day ?s - mykonos_slot)
    :precondition (and (first-day ?d) (not (assigned ?d)) (vacant-mykonos ?s))
    :effect (and (assigned ?d) (in ?d mykonos) (not (vacant-mykonos ?s)) (visited-mykonos))
  )

  (:action traveler-assign-first-to-vienna
    :parameters (?d - day ?s - vienna_slot)
    :precondition (and (first-day ?d) (not (assigned ?d)) (vacant-vienna ?s))
    :effect (and (assigned ?d) (in ?d vienna) (not (vacant-vienna ?s)) (visited-vienna))
  )

  (:action traveler-assign-next-to-venice
    :parameters (?d - day ?pd - day ?prevcity - city ?s - venice_slot)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?prevcity)
        (not (assigned ?d))
        (or (in ?pd venice) (direct-flight ?prevcity venice))
        (vacant-venice ?s)
      )
    :effect (and (assigned ?d) (in ?d venice) (not (vacant-venice ?s)) (visited-venice))
  )

  (:action traveler-assign-next-to-mykonos
    :parameters (?d - day ?pd - day ?prevcity - city ?s - mykonos_slot)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?prevcity)
        (not (assigned ?d))
        (or (in ?pd mykonos) (direct-flight ?prevcity mykonos))
        (vacant-mykonos ?s)
      )
    :effect (and (assigned ?d) (in ?d mykonos) (not (vacant-mykonos ?s)) (visited-mykonos))
  )

  (:action traveler-assign-next-to-vienna
    :parameters (?d - day ?pd - day ?prevcity - city ?s - vienna_slot)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?prevcity)
        (not (assigned ?d))
        (or (in ?pd vienna) (direct-flight ?prevcity vienna))
        (vacant-vienna ?s)
      )
    :effect (and (assigned ?d) (in ?d vienna) (not (vacant-vienna ?s)) (visited-vienna))
  )

  (:action traveler-attend-workshop
    :parameters (?d - day)
    :precondition (and (workshop-window ?d) (in ?d venice))
    :effect (workshop-attended)
  )

  (:action flight_agent-fly-to-venice
    :parameters (?d - day ?pd - day ?from - city ?s - venice_slot)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?from)
        (not (assigned ?d))
        (direct-flight ?from venice)
        (vacant-venice ?s)
      )
    :effect (and (assigned ?d) (in ?d venice) (not (vacant-venice ?s)) (visited-venice))
  )

  (:action flight_agent-fly-to-mykonos
    :parameters (?d - day ?pd - day ?from - city ?s - mykonos_slot)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?from)
        (not (assigned ?d))
        (direct-flight ?from mykonos)
        (vacant-mykonos ?s)
      )
    :effect (and (assigned ?d) (in ?d mykonos) (not (vacant-mykonos ?s)) (visited-mykonos))
  )

  (:action flight_agent-fly-to-vienna
    :parameters (?d - day ?pd - day ?from - city ?s - vienna_slot)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?from)
        (not (assigned ?d))
        (direct-flight ?from vienna)
        (vacant-vienna ?s)
      )
    :effect (and (assigned ?d) (in ?d vienna) (not (vacant-vienna ?s)) (visited-vienna))
  )

)