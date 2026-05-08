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

    (workshop_satisfied)
    (schedule_complete)
    (start_chosen)
  )

  (:action choose_start_city
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (start_chosen))
    )
    :effect (and
      (at ?c)
      (start_chosen)
    )
  )

  (:action stay_and_assign
    :parameters (?d - day ?d_next - day ?c - city ?k1 - count ?k2 - count)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?c)
      (not (assigned ?d frankfurt))
      (not (assigned ?d bucharest))
      (not (assigned ?d stuttgart))
      (count_for ?c ?k1)
      (next_count ?k1 ?k2)
    )
    :effect (and
      (assigned ?d ?c)
      (not (count_for ?c ?k1))
      (count_for ?c ?k2)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_and_assign_window_stuttgart
    :parameters (?d - day ?d_next - day ?k1 - count ?k2 - count)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (not (assigned ?d frankfurt))
      (not (assigned ?d bucharest))
      (not (assigned ?d stuttgart))
      (count_for stuttgart ?k1)
      (next_count ?k1 ?k2)
    )
    :effect (and
      (assigned ?d stuttgart)
      (not (count_for stuttgart ?k1))
      (count_for stuttgart ?k2)
      (not (current_day ?d))
      (current_day ?d_next)
      (workshop_satisfied)
    )
  )

  (:action fly_and_assign
    :parameters (?d - day ?d_next - day ?from - city ?to - city ?k1 - count ?k2 - count)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct_flight ?from ?to)
      (not (assigned ?d frankfurt))
      (not (assigned ?d bucharest))
      (not (assigned ?d stuttgart))
      (count_for ?to ?k1)
      (next_count ?k1 ?k2)
    )
    :effect (and
      (assigned ?d ?to)
      (not (at ?from))
      (at ?to)
      (not (count_for ?to ?k1))
      (count_for ?to ?k2)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_and_assign_window_to_stuttgart
    :parameters (?d - day ?d_next - day ?from - city ?k1 - count ?k2 - count)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct_flight ?from stuttgart)
      (not (assigned ?d frankfurt))
      (not (assigned ?d bucharest))
      (not (assigned ?d stuttgart))
      (count_for stuttgart ?k1)
      (next_count ?k1 ?k2)
    )
    :effect (and
      (assigned ?d stuttgart)
      (not (at ?from))
      (at stuttgart)
      (not (count_for stuttgart ?k1))
      (count_for stuttgart ?k2)
      (not (current_day ?d))
      (current_day ?d_next)
      (workshop_satisfied)
    )
  )

  (:action final_stay_and_assign
    :parameters (?c - city ?k1 - count ?k2 - count)
    :precondition (and
      (start_chosen)
      (current_day day_10)
      (at ?c)
      (not (assigned day_10 frankfurt))
      (not (assigned day_10 bucharest))
      (not (assigned day_10 stuttgart))
      (count_for ?c ?k1)
      (next_count ?k1 ?k2)
      (not (schedule_complete))
    )
    :effect (and
      (assigned day_10 ?c)
      (not (count_for ?c ?k1))
      (count_for ?c ?k2)
      (schedule_complete)
    )
  )

  (:action final_stay_and_assign_stuttgart
    :parameters (?k1 - count ?k2 - count)
    :precondition (and
      (start_chosen)
      (current_day day_10)
      (at stuttgart)
      (not (assigned day_10 frankfurt))
      (not (assigned day_10 bucharest))
      (not (assigned day_10 stuttgart))
      (count_for stuttgart ?k1)
      (next_count ?k1 ?k2)
      (not (schedule_complete))
    )
    :effect (and
      (assigned day_10 stuttgart)
      (not (count_for stuttgart ?k1))
      (count_for stuttgart ?k2)
      (schedule_complete)
      (workshop_satisfied)
    )
  )

  (:action final_fly_and_assign
    :parameters (?from - city ?to - city ?k1 - count ?k2 - count)
    :precondition (and
      (start_chosen)
      (current_day day_10)
      (at ?from)
      (direct_flight ?from ?to)
      (not (assigned day_10 frankfurt))
      (not (assigned day_10 bucharest))
      (not (assigned day_10 stuttgart))
      (count_for ?to ?k1)
      (next_count ?k1 ?k2)
      (not (schedule_complete))
    )
    :effect (and
      (assigned day_10 ?to)
      (not (at ?from))
      (at ?to)
      (not (count_for ?to ?k1))
      (count_for ?to ?k2)
      (schedule_complete)
    )
  )

  (:action final_fly_and_assign_to_stuttgart
    :parameters (?from - city ?k1 - count ?k2 - count)
    :precondition (and
      (start_chosen)
      (current_day day_10)
      (at ?from)
      (direct_flight ?from stuttgart)
      (not (assigned day_10 frankfurt))
      (not (assigned day_10 bucharest))
      (not (assigned day_10 stuttgart))
      (count_for stuttgart ?k1)
      (next_count ?k1 ?k2)
      (not (schedule_complete))
    )
    :effect (and
      (assigned day_10 stuttgart)
      (not (at ?from))
      (at stuttgart)
      (not (count_for stuttgart ?k1))
      (count_for stuttgart ?k2)
      (schedule_complete)
      (workshop_satisfied)
    )
  )
)