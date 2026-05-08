(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at_city ?c - city)
    (at_day ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (available ?c - city ?d - day)
  )

  ;; Action to start the trip on the first day
  (:action arrive_at_city
    :parameters (?city - city ?d_prev - day ?d_now - day ?c_prev - count ?c_now - count)
    :precondition (and 
      (at_day ?d_prev)
      (next_day ?d_prev ?d_now)
      (stay_count ?city ?c_prev)
      (next_count ?c_prev ?c_now)
      (available ?city ?d_now)
      ;; Ensure the trip has not already started at another city
      ;; We don't need a special predicate because at_day(d0) will be removed
    )
    :effect (and
      (not (at_day ?d_prev))
      (at_day ?d_now)
      (at_city ?city)
      (not (stay_count ?city ?c_prev))
      (stay_count ?city ?c_now)
    )
  )

  ;; Action to stay in the current city for another day
  (:action stay_in_city
    :parameters (?city - city ?d_prev - day ?d_now - day ?c_prev - count ?c_now - count)
    :precondition (and
      (at_city ?city)
      (at_day ?d_prev)
      (next_day ?d_prev ?d_now)
      (stay_count ?city ?c_prev)
      (next_count ?c_prev ?c_now)
      (available ?city ?d_now)
    )
    :effect (and
      (not (at_day ?d_prev))
      (at_day ?d_now)
      (not (stay_count ?city ?c_prev))
      (stay_count ?city ?c_now)
    )
  )

  ;; Action to fly to a different city
  (:action fly_to_city
    :parameters (?from - city ?to - city ?d_prev - day ?d_now - day ?c_prev - count ?c_now - count)
    :precondition (and
      (at_city ?from)
      (flight ?from ?to)
      (at_day ?d_prev)
      (next_day ?d_prev ?d_now)
      (stay_count ?to ?c_prev)
      (next_count ?c_prev ?c_now)
      (available ?to ?d_now)
    )
    :effect (and
      (not (at_day ?d_prev))
      (at_day ?d_now)
      (not (at_city ?from))
      (at_city ?to)
      (not (stay_count ?to ?c_prev))
      (stay_count ?to ?c_now)
    )
  )
)