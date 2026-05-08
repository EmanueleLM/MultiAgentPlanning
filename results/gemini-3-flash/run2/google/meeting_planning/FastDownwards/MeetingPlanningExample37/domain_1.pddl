(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (friend_at ?p - person ?l - location ?t - time)
    (met ?p - person)
    (can_travel ?from - location ?to - location ?t1 - time ?t2 - time)
    (can_wait ?t1 - time ?t2 - time)
    (is_90_min_meeting ?t1 - time ?t2 - time)
  )

  (:action move
    :parameters (?p - person ?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and
      (at ?p ?from)
      (current_time ?t_start)
      (can_travel ?from ?to ?t_start ?t_end)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (not (current_time ?t_start))
      (current_time ?t_end)
    )
  )

  (:action wait
    :parameters (?p - person ?loc - location ?t_start - time ?t_end - time)
    :precondition (and
      (at ?p ?loc)
      (current_time ?t_start)
      (can_wait ?t_start ?t_end)
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
    )
  )

  (:action meet
    :parameters (?visitor - person ?friend - person ?loc - location ?t_start - time ?t_end - time)
    :precondition (and
      (at ?visitor ?loc)
      (current_time ?t_start)
      (friend_at ?friend ?loc ?t_start)
      (friend_at ?friend ?loc ?t_end)
      (is_90_min_meeting ?t_start ?t_end)
    )
    :effect (and
      (met ?friend)
      (not (current_time ?t_start))
      (current_time ?t_end)
    )
  )
)