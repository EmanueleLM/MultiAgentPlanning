(define (domain trip_planning_example_34)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city
    day
    num_days_frankfurt
    num_days_florence
    num_days_valencia
  )
  (:predicates
    (at ?c - city)
    (connected ?c1 ?c2 - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)

    ; Duration counters for each city
    (frankfurt_days_spent ?n - num_days_frankfurt)
    (florence_days_spent ?n - num_days_florence)
    (valencia_days_spent ?n - num_days_valencia)

    ; Helper predicates for incrementing duration counters
    (next_num_frankfurt ?n1 ?n2 - num_days_frankfurt)
    (next_num_florence ?n1 ?n2 - num_days_florence)
    (next_num_valencia ?n1 ?n2 - num_days_valencia)

    ; Goal tracking
    (visited_city ?c - city)
    (visited_valencia_relatives)

    ; Day markers for the relatives constraint (absolute trip days)
    (is_trip_day_1 ?d - day)
    (is_trip_day_2 ?d - day)
  )

  (:functions (total-cost))

  ;; Actions

  ;; Travel between cities
  (action travel
    :parameters (?from ?to - city ?d_curr ?d_next - day)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (visited_city ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Stay in Frankfurt and increment day counter
  (action stay_in_frankfurt
    :parameters (?d_curr ?d_next - day ?n_curr ?n_next - num_days_frankfurt)
    :precondition (and
      (at frankfurt)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (frankfurt_days_spent ?n_curr)
      (next_num_frankfurt ?n_curr ?n_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (frankfurt_days_spent ?n_curr))
      (frankfurt_days_spent ?n_next)
      (increase (total-cost) 1)
    )
  )

  ;; Stay in Florence and increment day counter
  (action stay_in_florence
    :parameters (?d_curr ?d_next - day ?n_curr ?n_next - num_days_florence)
    :precondition (and
      (at florence)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (florence_days_spent ?n_curr)
      (next_num_florence ?n_curr ?n_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (florence_days_spent ?n_curr))
      (florence_days_spent ?n_next)
      (increase (total-cost) 1)
    )
  )

  ;; Stay in Valencia and increment day counter
  (action stay_in_valencia
    :parameters (?d_curr ?d_next - day ?n_curr ?n_next - num_days_valencia)
    :precondition (and
      (at valencia)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (valencia_days_spent ?n_curr)
      (next_num_valencia ?n_curr ?n_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (valencia_days_spent ?n_curr))
      (valencia_days_spent ?n_next)
      (increase (total-cost) 1)
    )
  )

  ;; Visit relatives in Valencia on absolute trip day 1
  (action visit_relatives_on_trip_day_1
    :parameters (?d - day)
    :precondition (and
      (at valencia)
      (current_day ?d)
      (is_trip_day_1 ?d)
      (not (visited_valencia_relatives)) ; Can only visit once
    )
    :effect (and
      (visited_valencia_relatives)
      ; This action is an activity within a day, not consuming an extra day.
      ; Hence, no increase in total-cost.
    )
  )

  ;; Visit relatives in Valencia on absolute trip day 2
  (action visit_relatives_on_trip_day_2
    :parameters (?d - day)
    :precondition (and
      (at valencia)
      (current_day ?d)
      (is_trip_day_2 ?d)
      (not (visited_valencia_relatives)) ; Can only visit once
    )
    :effect (and
      (visited_valencia_relatives)
      ; This action is an activity within a day, not consuming an extra day.
      ; Hence, no increase in total-cost.
    )
  )
)