(define (domain friend_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time friend)
  (:predicates
    (at ?loc - location ?t - time)
    (available ?fri - friend ?loc - location ?start - time ?end - time)
    (time_before ?t1 - time ?t2 - time)
    (meeting_planned ?fri - friend)
    (meeting_duration ?fri - friend ?dur_start - time ?dur_end - time ?dur_min - time)
  )
  
  (:action travel_bayview_to_chinatown
    :parameters (?current_time_start - time ?current_time_end - time)
    :precondition (and
      (at bayview ?current_time_start)
      (time_before ?current_time_start ?current_time_end)
      (time_before time9_18 ?current_time_end)
    )
    :effect (and
      (not (at bayview ?current_time_start))
      (at chinatown ?current_time_end)
    )
  )
  
  (:action travel_chinatown_to_bayview
    :parameters (?current_time_start - time ?current_time_end - time)
    :precondition (and
      (at chinatown ?current_time_start)
      (time_before ?current_time_start ?current_time_end)
      (time_before time9_22 ?current_time_end)
    )
    :effect (and
      (not (at chinatown ?current_time_start))
      (at bayview ?current_time_end)
    )
  )
  
  (:action meet_jason
    :parameters (?current_time_start - time ?current_time_end - time)
    :precondition (and
      (at chinatown ?current_time_start)
      (available jason chinatown ?current_time_start ?current_time_end)
      (time_before ?current_time_start ?current_time_end)
      (time_before time90min_start ?current_time_end)
      (not (meeting_planned jason))
    )
    :effect (and
      (meeting_planned jason)
      (meeting_duration jason ?current_time_start ?current_time_end time90min_start)
    )
  )
)