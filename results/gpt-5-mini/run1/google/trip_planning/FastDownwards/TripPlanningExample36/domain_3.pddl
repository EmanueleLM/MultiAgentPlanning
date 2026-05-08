(define (domain jack_of_all_trades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (flight ?from - city ?to - city)
    (prev_day ?d_prev - day ?d_next - day)
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (is_start ?d - day)
  )

  ;; Assign the starting day to a city.
  (:action assign_start_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (is_start ?d)
      (unassigned ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d ?c)
    )
  )

  ;; Stay in the same city from one day to its successor.
  (:action continue_in_same_city
    :parameters (?d_prev - day ?d_next - day ?c - city)
    :precondition (and
      (prev_day ?d_prev ?d_next)
      (assigned ?d_prev ?c)
      (unassigned ?d_next)
    )
    :effect (and
      (not (unassigned ?d_next))
      (assigned ?d_next ?c)
    )
  )

  ;; Fly from the city of the previous day to a (direct-flight) different city for the next day.
  (:action fly_to_new_city
    :parameters (?d_prev - day ?d_next - day ?c_prev - city ?c_next - city)
    :precondition (and
      (prev_day ?d_prev ?d_next)
      (assigned ?d_prev ?c_prev)
      (flight ?c_prev ?c_next)
      (unassigned ?d_next)
    )
    :effect (and
      (not (unassigned ?d_next))
      (assigned ?d_next ?c_next)
    )
  )
)