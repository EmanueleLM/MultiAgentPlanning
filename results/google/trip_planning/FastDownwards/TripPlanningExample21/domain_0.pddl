(define (domain trip-planning-multiagent)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :adl :fluents :equality)
  (:types day city)

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
  )

  (:functions
    (count-venice)
    (count-mykonos)
    (count-vienna)
  )

  ;; -------------------------
  ;; Traveler actions (assign days to cities)
  ;; -------------------------
  ;; First-day assignments (no previous-day constraint)
  (:action traveler-assign-first-to-venice
    :parameters (?d - day)
    :precondition (and (first-day ?d) (not (assigned ?d)) (< (count-venice) 6))
    :effect (and (assigned ?d) (in ?d venice) (increase (count-venice) 1) (visited-venice))
  )

  (:action traveler-assign-first-to-mykonos
    :parameters (?d - day)
    :precondition (and (first-day ?d) (not (assigned ?d)) (< (count-mykonos) 2))
    :effect (and (assigned ?d) (in ?d mykonos) (increase (count-mykonos) 1) (visited-mykonos))
  )

  (:action traveler-assign-first-to-vienna
    :parameters (?d - day)
    :precondition (and (first-day ?d) (not (assigned ?d)) (< (count-vienna) 4))
    :effect (and (assigned ?d) (in ?d vienna) (increase (count-vienna) 1) (visited-vienna))
  )

  ;; Subsequent-day assignments (require previous day in some city; must either stay or have direct flight)
  (:action traveler-assign-next-to-venice
    :parameters (?d - day ?pd - day ?prevcity - city)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?prevcity)
        (not (assigned ?d))
        (or (in ?pd venice) (direct-flight ?prevcity venice))
        (< (count-venice) 6)
      )
    :effect (and (assigned ?d) (in ?d venice) (increase (count-venice) 1) (visited-venice))
  )

  (:action traveler-assign-next-to-mykonos
    :parameters (?d - day ?pd - day ?prevcity - city)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?prevcity)
        (not (assigned ?d))
        (or (in ?pd mykonos) (direct-flight ?prevcity mykonos))
        (< (count-mykonos) 2)
      )
    :effect (and (assigned ?d) (in ?d mykonos) (increase (count-mykonos) 1) (visited-mykonos))
  )

  (:action traveler-assign-next-to-vienna
    :parameters (?d - day ?pd - day ?prevcity - city)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?prevcity)
        (not (assigned ?d))
        (or (in ?pd vienna) (direct-flight ?prevcity vienna))
        (< (count-vienna) 4)
      )
    :effect (and (assigned ?d) (in ?d vienna) (increase (count-vienna) 1) (visited-vienna))
  )

  ;; Attend workshop action (must be in venice on a day inside the workshop window)
  (:action traveler-attend-workshop
    :parameters (?d - day)
    :precondition (and (workshop-window ?d) (in ?d venice))
    :effect (workshop-attended)
  )

  ;; -------------------------
  ;; Flight agent actions (alternate way to place a traveler next day by flying)
  ;; Each flight action enforces the direct-flight connectivity as given by flight_agent.
  ;; -------------------------
  (:action flight_agent-fly-to-venice
    :parameters (?d - day ?pd - day ?from - city)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?from)
        (not (assigned ?d))
        (direct-flight ?from vienna) ; allowed only if connection exists into Vienna and then to Venice is enforced via direct-flight facts; but this action only requires direct-flight from previous -> venice
      )
    ;; Note: We keep this action specific. It will be usable when a direct-flight (?from vienna) is present and when that direct-flight to venice exists too.
    :effect (and (assigned ?d) (in ?d venice) (increase (count-venice) 1) (visited-venice))
  )

  ;; More direct flight actions to fill model similarly; to keep flight_agent actions distinct and simple
  (:action flight_agent-fly-to-mykonos
    :parameters (?d - day ?pd - day ?from - city)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?from)
        (not (assigned ?d))
        (direct-flight ?from mykonos)
      )
    :effect (and (assigned ?d) (in ?d mykonos) (increase (count-mykonos) 1) (visited-mykonos))
  )

  (:action flight_agent-fly-to-vienna
    :parameters (?d - day ?pd - day ?from - city)
    :precondition
      (and
        (previous ?d ?pd)
        (in ?pd ?from)
        (not (assigned ?d))
        (direct-flight ?from vienna)
      )
    :effect (and (assigned ?d) (in ?d vienna) (increase (count-vienna) 1) (visited-vienna))
  )

)