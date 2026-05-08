(define (domain trip_planning_example_44)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city
    time_point
    day_count
    person
  )
  (:predicates
    (at ?p - person ?c - city)
    (current_day ?d - time_point)
    (next_time_point ?d1 - time_point ?d2 - time_point)
    (connected ?c1 - city ?c2 - city)
    (wedding_attended)
    (wedding_at_time ?d - time_point)
    (days_spent ?c - city ?k - day_count)
    (next_day_count ?k1 - day_count ?k2 - day_count)
  )
  (:functions (total-cost))

  (:action travel
    :parameters (?p - person ?from - city ?to - city ?d_curr - time_point ?d_next - time_point)
    :precondition (and
      (at ?p ?from)
      (connected ?from ?to)
      (current_day ?d_curr)
      (next_time_point ?d_curr ?d_next)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (increase (total-cost) 1)
    )
  )

  (:action stay_in_city
    :parameters (?p - person ?c - city ?d_curr - time_point ?d_next - time_point ?kc_curr - day_count ?kc_next - day_count)
    :precondition (and
      (at ?p ?c)
      (current_day ?d_curr)
      (next_time_point ?d_curr ?d_next)
      (days_spent ?c ?kc_curr)
      (next_day_count ?kc_curr ?kc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (days_spent ?c ?kc_curr))
      (days_spent ?c ?kc_next)
      (increase (total-cost) 1)
    )
  )

  (:action attend_wedding
    :parameters (?p - person ?d_curr - time_point ?d_next - time_point ?kc_curr - day_count ?kc_next - day_count)
    :precondition (and
      (at ?p zurich) ; Wedding is specifically in Zurich
      (current_day ?d_curr)
      (next_time_point ?d_curr ?d_next)
      (wedding_at_time ?d_curr)
      (not (wedding_attended))
      (days_spent zurich ?kc_curr)
      (next_day_count ?kc_curr ?kc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (wedding_attended)
      (not (days_spent zurich ?kc_curr))
      (days_spent zurich ?kc_next)
      (increase (total-cost) 1)
    )
  )
)