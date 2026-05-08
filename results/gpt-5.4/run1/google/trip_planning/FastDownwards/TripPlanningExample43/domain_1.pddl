(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (last_day ?d - day)

    (visited_day ?d - day ?c - city)

    (need_venice_1)
    (need_venice_2)
    (need_venice_3)
    (need_venice_4)

    (need_porto_1)
    (need_porto_2)
    (need_porto_3)
    (need_porto_4)

    (need_dublin_1)
    (need_dublin_2)
    (need_dublin_3)
    (need_dublin_4)

    (met_friends)
    (trip_finished)
  )

  (:action stay_venice
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at venice)
      (not (visited_day ?d venice))
    )
    :effect (and
      (visited_day ?d venice)
      (not (current_day ?d))
      (current_day ?d2)
      (when_ignored)
    )
  )

  (:action stay_porto
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at porto)
      (not (visited_day ?d porto))
    )
    :effect (and
      (visited_day ?d porto)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_dublin
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at dublin)
      (not (visited_day ?d dublin))
    )
    :effect (and
      (visited_day ?d dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_dublin
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at venice)
      (direct_flight venice dublin)
      (not (visited_day ?d venice))
    )
    :effect (and
      (visited_day ?d venice)
      (not (at venice))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_dublin_to_venice
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at dublin)
      (direct_flight dublin venice)
      (not (visited_day ?d dublin))
    )
    :effect (and
      (visited_day ?d dublin)
      (not (at dublin))
      (at venice)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_dublin_to_porto
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at dublin)
      (direct_flight dublin porto)
      (not (visited_day ?d dublin))
    )
    :effect (and
      (visited_day ?d dublin)
      (not (at dublin))
      (at porto)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_porto_to_dublin
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at porto)
      (direct_flight porto dublin)
      (not (visited_day ?d porto))
    )
    :effect (and
      (visited_day ?d porto)
      (not (at porto))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action meet_friends_on_day1
    :parameters ()
    :precondition (and
      (current_day day1)
      (at venice)
      (not (met_friends))
      (not (visited_day day1 venice))
    )
    :effect (and
      (met_friends)
    )
  )

  (:action meet_friends_on_day2
    :parameters ()
    :precondition (and
      (current_day day2)
      (at venice)
      (not (met_friends))
      (not (visited_day day2 venice))
    )
    :effect (and
      (met_friends)
    )
  )

  (:action meet_friends_on_day3
    :parameters ()
    :precondition (and
      (current_day day3)
      (at venice)
      (not (met_friends))
      (not (visited_day day3 venice))
    )
    :effect (and
      (met_friends)
    )
  )

  (:action meet_friends_on_day4
    :parameters ()
    :precondition (and
      (current_day day4)
      (at venice)
      (not (met_friends))
      (not (visited_day day4 venice))
    )
    :effect (and
      (met_friends)
    )
  )

  (:action final_stay_venice
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at venice)
      (not (visited_day ?d venice))
    )
    :effect (and
      (visited_day ?d venice)
      (trip_finished)
      (not (current_day ?d))
    )
  )

  (:action final_stay_porto
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at porto)
      (not (visited_day ?d porto))
    )
    :effect (and
      (visited_day ?d porto)
      (trip_finished)
      (not (current_day ?d))
    )
  )

  (:action final_stay_dublin
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at dublin)
      (not (visited_day ?d dublin))
    )
    :effect (and
      (visited_day ?d dublin)
      (trip_finished)
      (not (current_day ?d))
    )
  )
)