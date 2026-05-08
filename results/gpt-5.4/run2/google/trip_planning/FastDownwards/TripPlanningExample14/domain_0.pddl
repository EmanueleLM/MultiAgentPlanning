(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)

    (at ?c - city ?d - day)
    (assigned ?d - day)

    (current_day ?d - day)

    (visited_lyon ?d - day)
    (visited_frankfurt ?d - day)
    (visited_krakow ?d - day)

    (need_lyon_day_1)
    (need_lyon_day_2)
    (need_lyon_day_3)
    (need_lyon_day_4)
    (need_lyon_day_5)
    (need_lyon_day_6)
    (need_lyon_day_7)

    (need_frankfurt_day_1)
    (need_frankfurt_day_2)

    (need_krakow_day_1)
    (need_krakow_day_2)
    (need_krakow_day_3)
  )

  (:action choose_start_lyon
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
    )
    :effect (and
      (at lyon day_1)
      (assigned day_1)
      (visited_lyon day_1)
      (need_lyon_day_1)
    )
  )

  (:action choose_start_frankfurt
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
    )
    :effect (and
      (at frankfurt day_1)
      (assigned day_1)
      (visited_frankfurt day_1)
      (need_frankfurt_day_1)
    )
  )

  (:action choose_start_krakow
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
    )
    :effect (and
      (at krakow day_1)
      (assigned day_1)
      (visited_krakow day_1)
      (need_krakow_day_1)
    )
  )

  (:action stay_lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at lyon ?d1)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (visited_lyon ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (when_need_lyon_progress_1)
    )
  )

  (:action stay_frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
    )
    :effect (and
      (at frankfurt ?d2)
      (assigned ?d2)
      (visited_frankfurt ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (when_need_frankfurt_progress_1)
    )
  )

  (:action stay_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at krakow ?d1)
    )
    :effect (and
      (at krakow ?d2)
      (assigned ?d2)
      (visited_krakow ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (when_need_krakow_progress_1)
    )
  )

  (:action fly_lyon_to_frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at lyon ?d1)
      (direct lyon frankfurt)
    )
    :effect (and
      (at frankfurt ?d2)
      (assigned ?d2)
      (visited_frankfurt ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (when_need_frankfurt_progress_1)
    )
  )

  (:action fly_frankfurt_to_lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt lyon)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (visited_lyon ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (when_need_lyon_progress_1)
    )
  )

  (:action fly_frankfurt_to_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt krakow)
    )
    :effect (and
      (at krakow ?d2)
      (assigned ?d2)
      (visited_krakow ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (when_need_krakow_progress_1)
    )
  )

  (:action fly_krakow_to_frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at krakow ?d1)
      (direct krakow frankfurt)
    )
    :effect (and
      (at frankfurt ?d2)
      (assigned ?d2)
      (visited_frankfurt ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (when_need_frankfurt_progress_1)
    )
  )

  (:action mark_lyon_day_2
    :parameters ()
    :precondition (and (need_lyon_day_1))
    :effect (and (need_lyon_day_2) (not (need_lyon_day_1)))
  )

  (:action mark_lyon_day_3
    :parameters ()
    :precondition (and (need_lyon_day_2))
    :effect (and (need_lyon_day_3) (not (need_lyon_day_2)))
  )

  (:action mark_lyon_day_4
    :parameters ()
    :precondition (and (need_lyon_day_3))
    :effect (and (need_lyon_day_4) (not (need_lyon_day_3)))
  )

  (:action mark_lyon_day_5
    :parameters ()
    :precondition (and (need_lyon_day_4))
    :effect (and (need_lyon_day_5) (not (need_lyon_day_4)))
  )

  (:action mark_lyon_day_6
    :parameters ()
    :precondition (and (need_lyon_day_5))
    :effect (and (need_lyon_day_6) (not (need_lyon_day_5)))
  )

  (:action mark_lyon_day_7
    :parameters ()
    :precondition (and (need_lyon_day_6))
    :effect (and (need_lyon_day_7) (not (need_lyon_day_6)))
  )

  (:action mark_frankfurt_day_2
    :parameters ()
    :precondition (and (need_frankfurt_day_1))
    :effect (and (need_frankfurt_day_2) (not (need_frankfurt_day_1)))
  )

  (:action mark_krakow_day_2
    :parameters ()
    :precondition (and (need_krakow_day_1))
    :effect (and (need_krakow_day_2) (not (need_krakow_day_1)))
  )

  (:action mark_krakow_day_3
    :parameters ()
    :precondition (and (need_krakow_day_2))
    :effect (and (need_krakow_day_3) (not (need_krakow_day_2)))
  )
)