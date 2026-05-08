(define (domain trip_planning_example39)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day
    porto_day_count
    barcelona_day_count
    florence_day_count
  )

  (:predicates
    (current_day ?d - day)
    (at_city ?c - city)
    (next_day ?d1 - day ?d2 - day)
    (has_flight ?c1 - city ?c2 - city)
    (num_days_porto ?n - porto_day_count)
    (num_days_barcelona ?n - barcelona_day_count)
    (num_days_florence ?n - florence_day_count)
    (next_porto_count ?n1 - porto_day_count ?n2 - porto_day_count)
    (next_barcelona_count ?n1 - barcelona_day_count ?n2 - barcelona_day_count)
    (next_florence_count ?n1 - florence_day_count ?n2 - florence_day_count)
    (relatives_visited_in_porto)
    (porto_relatives_window ?d - day)
  )

  (:action take_flight
    :parameters (?d - day ?c_from - city ?c_to - city)
    :precondition (and
      (current_day ?d)
      (at_city ?c_from)
      (has_flight ?c_from ?c_to)
    )
    :effect (and
      (not (at_city ?c_from))
      (at_city ?c_to)
    )
  )

  (:action pass_day_in_porto
    :parameters (?d_curr - day ?d_next - day ?pc_curr - porto_day_count ?pc_next - porto_day_count)
    :precondition (and
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (at_city porto)
      (num_days_porto ?pc_curr)
      (next_porto_count ?pc_curr ?pc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (num_days_porto ?pc_curr))
      (num_days_porto ?pc_next)
    )
  )

  (:action pass_day_in_barcelona
    :parameters (?d_curr - day ?d_next - day ?bc_curr - barcelona_day_count ?bc_next - barcelona_day_count)
    :precondition (and
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (at_city barcelona)
      (num_days_barcelona ?bc_curr)
      (next_barcelona_count ?bc_curr ?bc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (num_days_barcelona ?bc_curr))
      (num_days_barcelona ?bc_next)
    )
  )

  (:action pass_day_in_florence
    :parameters (?d_curr - day ?d_next - day ?fc_curr - florence_day_count ?fc_next - florence_day_count)
    :precondition (and
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (at_city florence)
      (num_days_florence ?fc_curr)
      (next_florence_count ?fc_curr ?fc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (num_days_florence ?fc_curr))
      (num_days_florence ?fc_next)
    )
  )

  (:action visit_relatives_in_porto
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city porto)
      (porto_relatives_window ?d)
      (not (relatives_visited_in_porto))
    )
    :effect (relatives_visited_in_porto)
  )