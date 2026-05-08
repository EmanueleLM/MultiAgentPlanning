(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location - object
    agent - object
    friend - object
    time - object
  )
  (:predicates
    (at ?agent - agent ?location - location)
    (available ?friend - friend ?location - location ?start_time - time ?end_time - time)
    (current_time ?time - time)
    (met ?agent - agent ?friend - friend)
  )
  (:constants
    financial_district union_square - location
    you - agent
    joseph - friend
    time_9_00am time_after_travel_to_union_square time_9_30pm time_10_00pm - time
  )
  
  (:action move_to_union_square
    :parameters (?agent - agent ?from - location ?to - location)
    :precondition (and
      (at ?agent ?from)
      (current_time time_9_00am)
      (not (current_time time_after_travel_to_union_square))
      (not (= ?from ?to))
      (= ?from financial_district)
      (= ?to union_square)
    )
    :effect (and
      (not (at ?agent ?from))
      (at ?agent ?to)
      (not (current_time time_9_00am))
      (current_time time_after_travel_to_union_square)
    )
  )

  (:action meet_joseph
    :parameters (?agent - agent ?friend - friend ?location - location)
    :precondition (and
      (at ?agent ?location)
      (available ?friend ?location time_9_30pm time_10_00pm)
      (current_time time_after_travel_to_union_square)
      (= ?location union_square)
      (= ?friend joseph)
    )
    :effect (met ?agent ?friend)
  )
)