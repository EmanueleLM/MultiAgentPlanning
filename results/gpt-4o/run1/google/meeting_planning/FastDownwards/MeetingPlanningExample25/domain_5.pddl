(define (domain friend_meeting)
  (:requirements :strips :typing)
  (:types location time_point person)
  (:predicates 
    (at ?p - person ?l - location)
    (visited ?l - location)
    (met ?p - person)
    (before ?t1 - time_point ?t2 - time_point)
    (can_travel ?from - location ?to - location)
    (is_at ?l - location ?t - time_point)
    (david_available ?t - time_point)
    (david_at_chinatown ?t - time_point)
  )
  (:action travel
    :parameters (?from - location ?to - location ?start_time - time_point ?end_time - time_point)
    :precondition (and 
      (can_travel ?from ?to) 
      (is_at ?from ?start_time) 
      (before ?start_time ?end_time)
      )
    :effect (and 
      (is_at ?to ?end_time) 
      (visited ?to))
  )
  (:action meet_david
    :parameters (?meeting_start - time_point ?meeting_end - time_point)
    :precondition (and
      (david_at_chinatown ?meeting_start)
      (is_at chinatown ?meeting_start)
      (before ?meeting_start ?meeting_end)
      (david_available ?meeting_start)
      )
    :effect (and
      (met david)
      (not (david_at_chinatown ?meeting_start))
    )
  )
)