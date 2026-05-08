(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates
    (at ?p - person ?l - location)
    (time_now ?t - time)
    (next ?t1 ?t2 - time)
    (next_9 ?t1 ?t2 - time)
    (next_7 ?t1 ?t2 - time)
    (next_75 ?t1 ?t2 - time)
    (mary_available ?t - time)
    (met ?p - person)
  )

  (:action travel_union_square_to_nob_hill
    :parameters (?t1 ?t2 - time)
    :precondition (and (at me union_square) (time_now ?t1) (next_9 ?t1 ?t2))
    :effect (and (not (at me union_square)) (at me nob_hill) (not (time_now ?t1)) (time_now ?t2))
  )

  (:action travel_nob_hill_to_union_square
    :parameters (?t1 ?t2 - time)
    :precondition (and (at me nob_hill) (time_now ?t1) (next_7 ?t1 ?t2))
    :effect (and (not (at me nob_hill)) (at me union_square) (not (time_now ?t1)) (time_now ?t2))
  )

  (:action wait
    :parameters (?t1 ?t2 - time)
    :precondition (and (time_now ?t1) (next ?t1 ?t2))
    :effect (and (not (time_now ?t1)) (time_now ?t2))
  )

  (:action meet_mary
    :parameters (?t_start ?t_end - time)
    :precondition (and 
      (at me nob_hill) 
      (time_now ?t_start) 
      (next_75 ?t_start ?t_end)
      (mary_available ?t_start)
      (mary_available ?t_end)
    )
    :effect (and 
      (met mary)
      (not (time_now ?t_start))
      (time_now ?t_end)
    )
  )
)