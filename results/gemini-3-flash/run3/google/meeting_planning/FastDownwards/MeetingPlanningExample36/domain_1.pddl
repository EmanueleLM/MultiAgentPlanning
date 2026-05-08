(define (domain meeting_planning_example_36)
  (:requirements :strips :typing)
  (:types
    location
    time
    person
  )
  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (can_move ?from ?to - location ?t_start ?t_end - time)
    (can_wait ?loc - location ?t_start ?t_end - time)
    (can_meet ?p - person ?loc - location ?t_start ?t_end - time)
  )

  (:action move
    :parameters (?from ?to - location ?t_start ?t_end - time)
    :precondition (and
      (at ?from)
      (current_time ?t_start)
      (can_move ?from ?to ?t_start ?t_end)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t_start))
      (current_time ?t_end)
    )
  )

  (:action wait
    :parameters (?loc - location ?t_start ?t_end - time)
    :precondition (and
      (at ?loc)
      (current_time ?t_start)
      (can_wait ?loc ?t_start ?t_end)
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
    )
  )

  (:action meet
    :parameters (?p - person ?loc - location ?t_start ?t_end - time)
    :precondition (and
      (at ?loc)
      (current_time ?t_start)
      (can_meet ?p ?loc ?t_start ?t_end)
    )
    :effect (and
      (met ?p)
      (not (current_time ?t_start))
      (current_time ?t_end)
    )
  )
)