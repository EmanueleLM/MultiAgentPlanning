(define (domain friend_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time_point person)
  (:predicates 
    (at ?p - person ?l - location)
    (visited ?l - location)
    (met ?p - person)
    (before ?t1 - time_point ?t2 - time_point)
    (can_travel ?from - location ?to - location)
    (is_at ?l - location ?t - time_point)
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
      (visited ?to)
    )
  )
  (:action meet_david
    :parameters (?meeting_start - time_point ?meeting_end - time_point)
    :precondition (and
      (at david chinatown)
      (is_at chinatown ?meeting_start)
      (before ?meeting_start ?meeting_end)
    )
    :effect (and
      (met david)
      (not (at david chinatown))
    )
  )
)