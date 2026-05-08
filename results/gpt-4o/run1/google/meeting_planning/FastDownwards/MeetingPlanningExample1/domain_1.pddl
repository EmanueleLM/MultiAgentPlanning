(define (domain meeting_friend)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)
  (:predicates 
    (at_location ?person - person ?location - location)
    (at_time ?time - time)
    (met_betty)
    (can_meet_betty)
    (next_time ?current_time - time ?next_time - time)
  )
  (:action travel
    :parameters (?from - location ?to - location ?current_time - time ?next_time - time)
    :precondition (and
      (at_location agent ?from)
      (at_time ?current_time)
      (next_time ?current_time ?next_time)
    )
    :effect (and
      (not (at_location agent ?from))
      (at_location agent ?to)
      (not (at_time ?current_time))
      (at_time ?next_time)
    )
  )
  (:action meet_betty
    :parameters (?current_time - time)
    :precondition (and
      (at_location agent financial_district)
      (at_time ?current_time)
      (can_meet_betty)
      (next_time ?current_time time_6_15PM)
    )
    :effect (met_betty)
  )
  (:action wait_for_betty
    :parameters (?current_time - time ?next_time - time)
    :precondition (and
      (at_location agent financial_district)
      (at_time ?current_time)
      (next_time ?current_time ?next_time)
    )
    :effect (and
      (not (at_time ?current_time))
      (at_time ?next_time)
      (can_meet_betty)
    )
  )
)