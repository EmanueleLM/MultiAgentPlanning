(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    agent
    friend
    time
  )
  (:predicates
    (at ?agent - agent ?location - location)
    (available ?friend - friend ?location - location ?start_time - time ?end_time - time)
    (current_time ?time - time)
    (met ?agent - agent ?friend - friend)
  )
  
  (:action move_to_union_square
    :parameters (?agent - agent ?from - location ?to - location ?start_time - time ?end_time - time)
    :precondition (and
      (at ?agent ?from)
      (current_time ?start_time)
      (not (current_time ?end_time))
      (not (= ?from ?to))
      (= ?from financial_district)
      (= ?to union_square)
    )
    :effect (and
      (not (at ?agent ?from))
      (at ?agent ?to)
      (not (current_time ?start_time))
      (current_time ?end_time)
    )
  )

  (:action meet_joseph
    :parameters (?agent - agent ?friend - friend ?location - location ?start_time - time ?end_time - time)
    :precondition (and
      (at ?agent ?location)
      (available ?friend ?location ?start_time ?end_time)
      (current_time ?start_time)
      (= ?location union_square)
      (= ?friend joseph)
    )
    :effect (met ?agent ?friend)
  )
)