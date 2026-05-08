(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?person - person ?location - location ?time - time)
    (can_meet ?person1 - person ?person2 - person ?location - location)
    (visited ?person - person ?location - location)
    (time_less ?time1 - time ?time2 - time)
  )

  (:constants
    richmond_district - location
    north_beach - location
    you - person
    stephanie - person
  )

  (:action travel_to_north_beach
    :parameters ()
    :precondition (and
      (at you richmond_district time_9am)
      (time_less time_9am time_930am)
    )
    :effect (and
      (at you north_beach time_930am)
      (visited you north_beach)
    )
  )

  (:action travel_to_richmond
    :parameters (?time - time)
    :precondition (and
      (at you north_beach ?time)
      (can_meet you stephanie north_beach)
      (time_less ?time time_1115am)
    )
    :effect (and
      (at you richmond_district time_415pm)
      (visited you richmond_district)
    )
  )

  (:action meet_stephanie
    :parameters (?time - time)
    :precondition (and
      (at you north_beach ?time)
      (time_less ?time time_1115am)
    )
    :effect (can_meet you stephanie north_beach)
  )
)