(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location friend time_block)
  (:predicates
    (at_location ?person - friend ?place - location ?time - time_block)
    (can_travel ?from - location ?to - location)
    (visited ?place - location)
    (met ?person - friend)
    (time_window_open ?start - time_block ?end - time_block)
    (current_time ?time - time_block)
  )
  
  (:action travel
    :parameters (?from - location ?to - location ?start - time_block ?end - time_block)
    :precondition (and
      (can_travel ?from ?to)
      (current_time ?start)
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (visited ?to)
    )
  )

  (:action meet_mary
    :parameters (?place - location ?start - time_block ?end - time_block)
    :precondition (and
      (at_location mary ?place ?start)
      (time_window_open eight_pm ten_pm)
    )
    :effect (and
      (met mary)
      (current_time ?end)
    )
  )
)