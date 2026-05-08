(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (successor ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (last_day ?d - day)
    (trip_started)
    (trip_done)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (not (trip_started))
    :effect (and (trip_started) (at ?c day_01))
  )

  (:action stay
    :parameters (?c - city ?d1 ?d2 - day ?n1 ?n2 - count)
    :precondition (and 
      (at ?c ?d1) 
      (next_day ?d1 ?d2) 
      (city_count ?c ?n1) 
      (successor ?n1 ?n2)
    )
    :effect (and 
      (not (at ?c ?d1)) 
      (at ?c ?d2) 
      (not (city_count ?c ?n1)) 
      (city_count ?c ?n2)
      (visited ?c ?d1)
    )
  )

  (:action fly
    :parameters (?c1 ?c2 - city ?d1 ?d2 - day ?n1 ?n2 ?m1 ?m2 - count)
    :precondition (and 
      (at ?c1 ?d1) 
      (next_day ?d1 ?d2) 
      (can_fly ?c1 ?c2)
      (city_count ?c1 ?n1) (successor ?n1 ?n2)
      (city_count ?c2 ?m1) (successor ?m1 ?m2)
    )
    :effect (and 
      (not (at ?c1 ?d1)) 
      (at ?c2 ?d2) 
      (not (city_count ?c1 ?n1)) (city_count ?c1 ?n2)
      (not (city_count ?c2 ?m1)) (city_count ?c2 ?m2)
      (visited ?c1 ?d1) 
      (visited ?c2 ?d1)
    )
  )

  (:action finish
    :parameters (?c - city ?d - day ?n1 ?n2 - count)
    :precondition (and 
      (at ?c ?d) 
      (last_day ?d)
      (city_count ?c ?n1) 
      (successor ?n1 ?n2)
    )
    :effect (and 
      (not (city_count ?c ?n1)) 
      (city_count ?c ?n2)
      (visited ?c ?d) 
      (trip_done)
    )
  )
)