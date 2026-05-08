(define (domain meet_emily_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    time
    meet_count
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next ?t1 - time ?t2 - time)
    (route ?from - location ?to - location)
    (travel_arrival ?from - location ?to - location ?depart - time ?arrive - time)
    (emily_available ?t - time)
    (meet_progress ?m - meet_count)
    (meet_succ ?m1 - meet_count ?m2 - meet_count)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (route ?from ?to)
      (travel_arrival ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_emily_one_minute
    :parameters (?t1 - time ?t2 - time ?m1 - meet_count ?m2 - meet_count ?l - location)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next ?t1 ?t2)
      (emily_available ?t1)
      (meet_progress ?m1)
      (meet_succ ?m1 ?m2)
      (not (at north_beach))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meet_progress ?m1))
      (meet_progress ?m2)
    )
  )
)