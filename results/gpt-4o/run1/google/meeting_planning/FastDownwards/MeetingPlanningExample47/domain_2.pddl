(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)
  (:predicates 
    (at ?who - person ?place - location)
    (available ?who - person ?from - time ?to - time)
    (current_time ?t - time)
    (visited ?who - person)
  )
  
  (:action move_to_nob_hill
    :parameters (?person - person)
    :precondition (and 
      (at ?person richmond_district)
      (current_time time_9_00))
    :effect (and 
      (not (at ?person richmond_district))
      (at ?person nob_hill)
      (not (current_time time_9_00))
      (current_time time_9_17))
  )

  (:action wait_until_available
    :parameters (?person - person)
    :precondition (and 
      (at ?person nob_hill)
      (current_time time_9_17))
    :effect (and 
      (not (current_time time_9_17))
      (current_time time_9_30))
  )

  (:action meet_paul
    :parameters (?person - person)
    :precondition (and 
      (at ?person nob_hill)
      (current_time time_9_30)
      (available paul time_9_30 time_11_15))
    :effect (and 
      (visited paul)
      (not (current_time time_9_30))
      (current_time time_11_15))
  )
  
  (:action move_back_to_richmond
    :parameters (?person - person)
    :precondition (and 
      (at ?person nob_hill)
      (current_time time_11_15))
    :effect (and 
      (not (at ?person nob_hill))
      (at ?person richmond_district)
      (not (current_time time_11_15))
      (current_time time_11_30))
  )
)