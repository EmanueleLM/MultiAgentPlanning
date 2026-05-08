(define (domain trip_planning_14days)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (day_succ ?d1 - day ?d2 - day)         ; successor relation between days
    (in_city ?c - city ?d - day)          ; city assigned for a given day
    (assigned ?d - day)                   ; day has been assigned a city
    (direct_flight ?from - city ?to - city) ; allowed direct flights
    (florence_window ?d - day)            ; days 9..14 are meeting window days
    (is_florence ?c - city)               ; identifies Florence object
    (is_barcelona ?c - city)              ; identifies Barcelona object
    (is_helsinki ?c - city)               ; identifies Helsinki object
    (visited_florence)                    ; true once Florence has been visited some day
    (visited_barcelona)                   ; true once Barcelona has been visited some day
    (visited_helsinki)                    ; true once Helsinki has been visited some day
    (florence_met)                        ; true once Florence meeting window condition met
  )

  ;; --- Actions to assign day1 to a specific city ---
  (:action assign-day1-barcelona
    :parameters (?c - city)
    :precondition (and (is_barcelona ?c) (not (assigned day1)))
    :effect (and
      (assigned day1)
      (in_city ?c day1)
      (visited_barcelona)
    )
  )

  (:action assign-day1-helsinki
    :parameters (?c - city)
    :precondition (and (is_helsinki ?c) (not (assigned day1)))
    :effect (and
      (assigned day1)
      (in_city ?c day1)
      (visited_helsinki)
    )
  )

  (:action assign-day1-florence
    :parameters (?c - city)
    :precondition (and (is_florence ?c) (not (assigned day1)))
    :effect (and
      (assigned day1)
      (in_city ?c day1)
      (visited_florence)
    )
  )

  ;; --- Stay actions (remain in same city for successor day) ---
  (:action stay_in_barcelona
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (day_succ ?d1 ?d2)
      (in_city ?c ?d1)
      (is_barcelona ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in_city ?c ?d2)
      (visited_barcelona)
    )
  )

  (:action stay_in_helsinki
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (day_succ ?d1 ?d2)
      (in_city ?c ?d1)
      (is_helsinki ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in_city ?c ?d2)
      (visited_helsinki)
    )
  )

  (:action stay_in_florence_nonwindow
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (day_succ ?d1 ?d2)
      (in_city ?c ?d1)
      (is_florence ?c)
      (not (florence_window ?d2))
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in_city ?c ?d2)
      (visited_florence)
    )
  )

  (:action stay_in_florence_window
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (day_succ ?d1 ?d2)
      (in_city ?c ?d1)
      (is_florence ?c)
      (florence_window ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in_city ?c ?d2)
      (visited_florence)
      (florence_met)
    )
  )

  ;; --- Fly actions using only allowed direct_flight links ---
  ;; Fly to Barcelona
  (:action fly_to_barcelona
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (day_succ ?d1 ?d2)
      (in_city ?from ?d1)
      (direct_flight ?from ?to)
      (is_barcelona ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in_city ?to ?d2)
      (visited_barcelona)
    )
  )

  ;; Fly to Helsinki
  (:action fly_to_helsinki
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (day_succ ?d1 ?d2)
      (in_city ?from ?d1)
      (direct_flight ?from ?to)
      (is_helsinki ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in_city ?to ?d2)
      (visited_helsinki)
    )
  )

  ;; Fly to Florence on a non-window day
  (:action fly_to_florence_nonwindow
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (day_succ ?d1 ?d2)
      (in_city ?from ?d1)
      (direct_flight ?from ?to)
      (is_florence ?to)
      (not (florence_window ?d2))
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in_city ?to ?d2)
      (visited_florence)
    )
  )

  ;; Fly to Florence on a window day -- satisfies meeting constraint
  (:action fly_to_florence_window
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (day_succ ?d1 ?d2)
      (in_city ?from ?d1)
      (direct_flight ?from ?to)
      (is_florence ?to)
      (florence_window ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in_city ?to ?d2)
      (visited_florence)
      (florence_met)
    )
  )
)