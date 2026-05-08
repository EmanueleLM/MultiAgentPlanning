(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location friend time)
  
  (:predicates
    (at ?loc - location)
    (friend_at ?friend - friend ?loc - location ?time - time)
    (met ?friend - friend)
    (current_time ?time - time)
  )
  
  (:action travel_richmond_to_north_beach
    :parameters ()
    :precondition (and
      (at richmond_district)
      (current_time arrival_at_richmond_0900)
    )
    :effect (and
      (at north_beach)
      (not (at richmond_district))
      (current_time start_window_north_beach_1515)
    )
  )
  
  (:action travel_north_beach_to_richmond
    :parameters ()
    :precondition (and
      (at north_beach)
      (current_time end_window_north_beach_1715)
    )
    :effect (and
      (at richmond_district)
      (not (at north_beach))
    )
  )
  
  (:action meet_john
    :parameters ()
    :precondition (and
      (at north_beach)
      (friend_at john north_beach start_window_north_beach_1515)
      (current_time start_window_north_beach_1515)
    )
    :effect (met john)
  )
)