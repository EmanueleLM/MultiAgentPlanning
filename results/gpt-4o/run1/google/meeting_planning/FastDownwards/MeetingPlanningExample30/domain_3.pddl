(define (domain san_francisco_visit)
  (:requirements :strips :typing)

  (:types
    location person time
  )

  (:predicates
    (at ?person - person ?location - location)
    (can_meet ?person1 - person ?person2 - person)
    (visited ?person - person ?location - location)
    (time_reached ?time - time)
    (met_stephanie)
  )

  (:constants
    richmond_district north_beach - location
    you stephanie - person
    time_0900 time_0917 time_0930 time_1130 time_1330 time_1630 - time
  )

  (:action travel_to_north_beach
    :parameters (?current_time - time ?next_time - time)
    :precondition (and
      (at you richmond_district)
      (time_reached ?current_time)
      (not (time_reached time_0917))  ;; ensure this is done early
    )
    :effect (and
      (at you north_beach)
      (time_reached ?next_time)
      (visited you north_beach)
    )
  )

  (:action meet_stephanie_0900_1130
    :parameters (?current_time - time ?next_time - time)
    :precondition (and
      (at you north_beach)
      (time_reached time_0930)
      (not (met_stephanie))
    )
    :effect (and
      (can_meet you stephanie)
      (time_reached time_1130)
    )
  )

  (:action meet_stephanie_1130_1330
    :parameters (?current_time - time ?next_time - time)
    :precondition (and
      (at you north_beach)
      (time_reached time_1130)
    )
    :effect (and
      (met_stephanie)
      (time_reached ?next_time)
    )
  )

  (:action travel_to_richmond
    :parameters (?current_time - time ?next_time - time)
    :precondition (and
      (at you north_beach)
      (met_stephanie)
      (time_reached time_1330)
    )
    :effect (and
      (at you richmond_district)
      (time_reached ?next_time)
      (visited you richmond_district)
    )
  )
)