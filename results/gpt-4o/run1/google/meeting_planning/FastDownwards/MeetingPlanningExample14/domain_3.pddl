(define (domain san_francisco_visit)
  (:requirements :strips :typing)
  (:types location friend time_step)
  (:predicates
    (at_location ?person - friend ?place - location)
    (can_travel ?from - location ?to - location)
    (visited ?place - location)
    (met ?person - friend)
    (current_time ?time - time_step)
    (before ?t1 - time_step ?t2 - time_step)
    (time_window_open ?start - time_step ?end - time_step)
  )
  
  (:action travel
    :parameters (?from - location ?to - location ?start - time_step ?end - time_step)
    :precondition (and
      (can_travel ?from ?to)
      (current_time ?start)
      (before ?start ?end)
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (visited ?to)
    )
  )

  (:action meet_mary
    :parameters (?place - location ?start - time_step ?end - time_step)
    :precondition (and
      (at_location mary ?place)
      (current_time ?start)
      (before ?start ?end)
      (time_window_open ?start ?end)
    )
    :effect (and
      (met mary)
    )
  )
)