(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city)
    (day_now ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (visited_valencia_day1)
    (visited_valencia_day2)
    (spent_frankfurt_1)
    (spent_frankfurt_2)
    (spent_frankfurt_3)
    (spent_frankfurt_4)
    (spent_frankfurt_5)
    (spent_florence_1)
    (spent_florence_2)
    (spent_florence_3)
    (spent_florence_4)
    (spent_valencia_1)
    (spent_valencia_2)
  )

  (:action stay_frankfurt_1
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at frankfurt)
      (day_now ?d)
      (next_day ?d ?dnext)
      (not (spent_frankfurt_1))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?dnext)
      (spent_frankfurt_1)
    )
  )

  (:action stay_frankfurt_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at frankfurt)
      (day_now ?d)
      (next_day ?d ?dnext)
      (spent_frankfurt_1)
      (not (spent_frankfurt_2))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?dnext)
      (spent_frankfurt_2)
    )
  )

  (:action stay_frankfurt_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at frankfurt)
      (day_now ?d)
      (next_day ?d ?dnext)
      (spent_frankfurt_2)
      (not (spent_frankfurt_3))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?dnext)
      (spent_frankfurt_3)
    )
  )

  (:action stay_frankfurt_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at frankfurt)
      (day_now ?d)
      (next_day ?d ?dnext)
      (spent_frankfurt_3)
      (not (spent_frankfurt_4))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?dnext)
      (spent_frankfurt_4)
    )
  )

  (:action stay_frankfurt_5
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at frankfurt)
      (day_now ?d)
      (next_day ?d ?dnext)
      (spent_frankfurt_4)
      (not (spent_frankfurt_5))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?dnext)
      (spent_frankfurt_5)
    )
  )

  (:action stay_florence_1
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at florence)
      (day_now ?d)
      (next_day ?d ?dnext)
      (not (spent_florence_1))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?dnext)
      (spent_florence_1)
    )
  )

  (:action stay_florence_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at florence)
      (day_now ?d)
      (next_day ?d ?dnext)
      (spent_florence_1)
      (not (spent_florence_2))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?dnext)
      (spent_florence_2)
    )
  )

  (:action stay_florence_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at florence)
      (day_now ?d)
      (next_day ?d ?dnext)
      (spent_florence_2)
      (not (spent_florence_3))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?dnext)
      (spent_florence_3)
    )
  )

  (:action stay_florence_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at florence)
      (day_now ?d)
      (next_day ?d ?dnext)
      (spent_florence_3)
      (not (spent_florence_4))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?dnext)
      (spent_florence_4)
    )
  )

  (:action stay_valencia_1_day1
    :parameters ()
    :precondition (and
      (at valencia)
      (day_now day_1)
      (not (spent_valencia_1))
      (not (visited_valencia_day1))
    )
    :effect (and
      (not (day_now day_1))
      (day_now day_2)
      (spent_valencia_1)
      (visited_valencia_day1)
    )
  )

  (:action stay_valencia_2_day2
    :parameters ()
    :precondition (and
      (at valencia)
      (day_now day_2)
      (spent_valencia_1)
      (visited_valencia_day1)
      (not (spent_valencia_2))
      (not (visited_valencia_day2))
    )
    :effect (and
      (not (day_now day_2))
      (day_now day_3)
      (spent_valencia_2)
      (visited_valencia_day2)
    )
  )

  (:action fly_frankfurt_to_florence
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at frankfurt)
      (day_now ?d)
      (next_day ?d ?dnext)
      (direct_flight frankfurt florence)
    )
    :effect (and
      (not (at frankfurt))
      (at florence)
      (not (day_now ?d))
      (day_now ?dnext)
    )
  )

  (:action fly_florence_to_frankfurt
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at florence)
      (day_now ?d)
      (next_day ?d ?dnext)
      (direct_flight florence frankfurt)
    )
    :effect (and
      (not (at florence))
      (at frankfurt)
      (not (day_now ?d))
      (day_now ?dnext)
    )
  )

  (:action fly_frankfurt_to_valencia
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at frankfurt)
      (day_now ?d)
      (next_day ?d ?dnext)
      (direct_flight frankfurt valencia)
    )
    :effect (and
      (not (at frankfurt))
      (at valencia)
      (not (day_now ?d))
      (day_now ?dnext)
    )
  )

  (:action fly_valencia_to_frankfurt
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at valencia)
      (day_now ?d)
      (next_day ?d ?dnext)
      (direct_flight valencia frankfurt)
      (visited_valencia_day1)
      (visited_valencia_day2)
    )
    :effect (and
      (not (at valencia))
      (at frankfurt)
      (not (day_now ?d))
      (day_now ?dnext)
    )
  )
)