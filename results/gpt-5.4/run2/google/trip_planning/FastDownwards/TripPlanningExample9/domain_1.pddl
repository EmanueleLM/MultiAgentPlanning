(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (assigned ?d - day ?c - city)
    (count_for ?c - city ?k - count)
    (next_count ?k1 - count ?k2 - count)
    (workshop_day ?d - day)
    (workshop_satisfied)
    (schedule_complete)
    (start_chosen)
  )

  (:action choose_start_city
    :parameters (?c - city ?k1 - count ?k2 - count)
    :precondition (and
      (current_day day_1)
      (not (start_chosen))
      (count_for ?c ?k1)
      (next_count ?k1 ?k2)
    )
    :effect (and
      (at ?c)
      (assigned day_1 ?c)
      (not (count_for ?c ?k1))
      (count_for ?c ?k2)
      (start_chosen)
      (when_workshop_day_mark day_1 ?c)
    )
  )

  (:action stay_and_advance
    :parameters (?d - day ?d_next - day ?c - city ?k1 - count ?k2 - count)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?c)
      (count_for ?c ?k1)
      (next_count ?k1 ?k2)
      (not (assigned ?d_next frankfurt))
      (not (assigned ?d_next bucharest))
      (not (assigned ?d_next stuttgart))
    )
    :effect (and
      (assigned ?d_next ?c)
      (not (count_for ?c ?k1))
      (count_for ?c ?k2)
      (not (current_day ?d))
      (current_day ?d_next)
      (when_workshop_day_mark ?d_next ?c)
    )
  )

  (:action fly_and_advance
    :parameters (?d - day ?d_next - day ?from - city ?to - city ?k1 - count ?k2 - count)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct_flight ?from ?to)
      (count_for ?to ?k1)
      (next_count ?k1 ?k2)
      (not (assigned ?d_next frankfurt))
      (not (assigned ?d_next bucharest))
      (not (assigned ?d_next stuttgart))
    )
    :effect (and
      (assigned ?d_next ?to)
      (not (at ?from))
      (at ?to)
      (not (count_for ?to ?k1))
      (count_for ?to ?k2)
      (not (current_day ?d))
      (current_day ?d_next)
      (when_workshop_day_mark ?d_next ?to)
    )
  )
)