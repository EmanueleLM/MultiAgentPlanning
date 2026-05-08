(define (domain meeting_friend)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates 
    (at_location ?person - person ?location - location)
    (at_time ?time - time)
    (next_time ?current_time - time ?next_time - time)
    (can_meet_betty)
    (met_betty)
  )
  (:action travel_to_financial_district
    :parameters (?agent - person ?current_time - time ?next_time - time)
    :precondition (and
      (at_location ?agent richmond_district)
      (at_time ?current_time)
      (next_time ?current_time ?next_time)
    )
    :effect (and
      (not (at_location ?agent richmond_district))
      (at_location ?agent financial_district)
      (not (at_time ?current_time))
      (at_time ?next_time)
    )
  )
  (:action travel_to_richmond_district
    :parameters (?agent - person ?current_time - time ?next_time - time)
    :precondition (and
      (at_location ?agent financial_district)
      (at_time ?current_time)
      (next_time ?current_time ?next_time)
    )
    :effect (and
      (not (at_location ?agent financial_district))
      (at_location ?agent richmond_district)
      (not (at_time ?current_time))
      (at_time ?next_time)
    )
  )
  (:action wait_for_betty
    :parameters (?current_time - time ?next_time - time)
    :precondition (and
      (at_time ?current_time)
      (next_time ?current_time ?next_time)
    )
    :effect (and
      (not (at_time ?current_time))
      (at_time ?next_time)
      (can_meet_betty)
    )
  )
  (:action meet_betty
    :parameters (?agent - person ?current_time - time)
    :precondition (and
      (at_location ?agent financial_district)
      (at_time ?current_time)
      (can_meet_betty)
    )
    :effect (met_betty)
  )
)