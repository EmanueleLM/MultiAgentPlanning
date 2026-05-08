(define (domain tripplanningexample47)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day
    num
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (has_flight ?c1 - city ?c2 - city)
    (days_spent_in ?c - city ?n - num)
    (next_num ?n1 - num ?n2 - num)
    (conference_attended_day1)
    (conference_attended_day2)
  )

  (:action travel
    :parameters (?from - city ?to - city)
    :precondition
      (and
        (at ?from)
        (has_flight ?from ?to)
      )
    :effect
      (and
        (not (at ?from))
        (at ?to)
      )
  )

  (:action spend_day_in_paris_conference_day1
    :parameters ()
    :precondition
      (and
        (at paris)
        (current_day day1)
        (next_day day1 day2)
        (days_spent_in paris n0)
        (next_num n0 n1)
        (not (conference_attended_day1))
      )
    :effect
      (and
        (not (current_day day1))
        (current_day day2)
        (not (days_spent_in paris n0))
        (days_spent_in paris n1)
        (conference_attended_day1)
      )
  )

  (:action spend_day_in_paris_conference_day2
    :parameters ()
    :precondition
      (and
        (at paris)
        (current_day day2)
        (next_day day2 day3)
        (days_spent_in paris n1)
        (next_num n1 n2)
        (not (conference_attended_day2))
      )
    :effect
      (and
        (not (current_day day2))
        (current_day day3)
        (not (days_spent_in paris n1))
        (days_spent_in paris n2)
        (conference_attended_day2)
      )
  )

  (:action spend_day_in_paris_generic
    :parameters (?d_curr - day ?d_next - day ?n_curr - num ?n_next - num)
    :precondition
      (and
        (at paris)
        (current_day ?d_curr)
        (next_day ?d_curr ?d_next)
        (days_spent_in paris ?n_curr)
        (next_num ?n_curr ?n_next)
        (not (current_day day1))
        (not (current_day day2))
      )
    :effect
      (and
        (not (current_day ?d_curr))
        (current_day ?d_next)
        (not (days_spent_in paris ?n_curr))
        (days_spent_in paris ?n_next)
      )
  )

  (:action spend_day_in_istanbul
    :parameters (?d_curr - day ?d_next - day ?n_curr - num ?n_next - num)
    :precondition
      (and
        (at istanbul)
        (current_day ?d_curr)
        (next_day ?d_curr ?d_next)
        (days_spent_in istanbul ?n_curr)
        (next_num ?n_curr ?n_next)
      )
    :effect
      (and
        (not (current_day ?d_curr))
        (current_day ?d_next)
        (not (days_spent_in istanbul ?n_curr))
        (days_spent_in istanbul ?n_next)
      )
  )

  (:action spend_day_in_salzburg
    :parameters (?d_curr - day ?d_next - day ?n_curr - num ?n_next - num)
    :precondition
      (and
        (at salzburg)
        (current_day ?d_curr)
        (next_day ?d_curr ?d_next)
        (days_spent_in salzburg ?n_curr)
        (next_num ?n_curr ?n_next)
      )
    :effect
      (and
        (not (current_day ?d_curr))
        (current_day ?d_next)
        (not (days_spent_in salzburg ?n_curr))
        (days_spent_in salzburg ?n_next)
      )
  )
)