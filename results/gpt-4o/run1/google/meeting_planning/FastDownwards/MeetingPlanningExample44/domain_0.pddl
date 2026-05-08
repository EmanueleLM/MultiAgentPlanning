(define (domain meet_friends_sf)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types 
    location person time)

  (:predicates 
    (at ?person - person ?location - location)
    (visited ?person - person)
    (time_window_open ?location - location ?start - time ?end - time)
    (meeting_possible ?person - person ?location - location)
    (have_time ?start - time)
  )

  (:action move_pacific_to_wharf
    :parameters ( )
    :precondition (and 
      (at you pacific_heights)
      (have_time 9:13AM)
    )
    :effect (and
      (not (at you pacific_heights))
      (at you fishermans_wharf)
    )
  )

  (:action move_wharf_to_pacific
    :parameters ( )
    :precondition (and 
      (at you fishermans_wharf)
      (have_time 3:45PM)
    )
    :effect (and
      (not (at you fishermans_wharf))
      (at you pacific_heights)
    )
  )

  (:action meet_betty
    :parameters ( )
    :precondition (and 
      (at you fishermans_wharf)
      (at betty fishermans_wharf)
      (time_window_open fishermans_wharf 8:45AM 6:00PM)
      (meeting_possible betty fishermans_wharf)
      (have_time 11:00AM)
    )
    :effect (and
      (visited betty)
    )
  )
)