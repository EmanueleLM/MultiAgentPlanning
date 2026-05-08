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
    (wedding_period ?d - time_point)
    (days_in_lyon ?k - day_count)
    (days_in_zurich ?k - day_count)
    (days_in_rome ?k - day_count)
    (next_day_count ?k1 - day_count ?k2 - day_count)
  )

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

  (:action stay_in_lyon
    :parameters (?p - person ?d_curr - time_point ?d_next - time_point ?lc_curr - day_count ?lc_next - day_count)
    :precondition (and
      (at ?p lyon)
      (current_day ?d_curr)
      (next_time_point ?d_curr ?d_next)
      (days_in_lyon ?lc_curr)
      (next_day_count ?lc_curr ?lc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (days_in_lyon ?lc_curr))
      (days_in_lyon ?lc_next)
      (increase (total-cost) 1)
    )
  )

  (:action stay_in_zurich
    :parameters (?p - person ?d_curr - time_point ?d_next - time_point ?zc_curr - day_count ?zc_next - day_count)
    :precondition (and
      (at ?p zurich)
      (current_day ?d_curr)
      (next_time_point ?d_curr ?d_next)
      (days_in_zurich ?zc_curr)
      (next_day_count ?zc_curr ?zc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (days_in_zurich ?zc_curr))
      (days_in_zurich ?zc_next)
      (increase (total-cost) 1)
    )
  )

  (:action stay_in_rome
    :parameters (?p - person ?d_curr - time_point ?d_next - time_point ?rc_curr - day_count ?rc_next - day_count)
    :precondition (and
      (at ?p rome)
      (current_day ?d_curr)
      (next_time_point ?d_curr ?d_next)
      (days_in_rome ?rc_curr)
      (next_day_count ?rc_curr ?rc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (days_in_rome ?rc_curr))
      (days_in_rome ?rc_next)
      (increase (total-cost) 1)
    )
  )

  (:action attend_wedding_in_zurich
    :parameters (?p - person ?d_curr - time_point ?d_next - time_point ?zc_curr - day_count ?zc_next - day_count)
    :precondition (and
      (at ?p zurich)
      (current_day ?d_curr)
      (next_time_point ?d_curr ?d_next)
      (wedding_period ?d_curr)
      (not (wedding_attended))
      (days_in_zurich ?zc_curr)
      (next_day_count ?zc_curr ?zc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (wedding_attended)
      (not (days_in_zurich ?zc_curr))
      (days_in_zurich ?zc_next)
      (increase (total-cost) 1)
    )
  )
)