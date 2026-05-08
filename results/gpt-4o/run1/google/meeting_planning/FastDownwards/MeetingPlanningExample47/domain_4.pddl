(define (domain meeting_with_paul)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates 
    (at ?who - person ?place - location)
    (available ?who - person ?from - time ?to - time)
    (current_time ?t - time)
    (visited ?who - person)
  )
  
  (:action travel_to_nob_hill
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

  (:action wait_for_paul
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
      (current_time time_9_45))
  )
)