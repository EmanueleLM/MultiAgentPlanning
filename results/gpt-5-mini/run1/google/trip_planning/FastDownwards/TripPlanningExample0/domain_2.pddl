(define (domain trip_planning_14days)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (day_succ ?d1 - day ?d2 - day)          ; successor relation between days
    (in_city ?c - city ?d - day)           ; city assigned for a given day
    (assigned ?d - day)                    ; day has been assigned a city
    (direct_flight ?from - city ?to - city) ; allowed direct flights
    (florence_window ?d - day)             ; days in Florence meeting window
    (is_florence ?c - city)                ; identifies Florence object
    (is_barcelona ?c - city)               ; identifies Barcelona object
    (is_helsinki ?c - city)                ; identifies Helsinki object
    (visited_florence)                     ; true once Florence has been visited some day
    (visited_barcelona)                    ; true once Barcelona has been visited some day
    (visited_helsinki)                     ; true once Helsinki has been visited some day
    (florence_met)                         ; true once meeting-window Florence day was assigned
    (first_day ?d - day)                   ; marks the first day (day1)
  )

  ;; --- Assign the first day to Barcelona ---
  (:action assign_first_day_barcelona
    :parameters (?c - city ?d - day)
    :precondition (and (is_barcelona ?c) (first_day ?d) (not (assigned ?d)))
    :effect (and
      (assigned ?d)
      (in_city ?c ?d)
      (visited_barcelona)
    )
  )

  ;; --- Assign the first day to Helsinki ---
  (:action assign_first_day_helsinki
    :parameters (?c - city ?d - day)
    :precondition (and (is_helsinki ?c) (first_day ?d) (not (assigned ?d)))
    :effect (and
      (assigned ?d)
      (in_city ?c ?d)
      (visited_helsinki)
    )
  )

  ;; --- Assign the first day to Florence (non-window) ---
  (:action assign_first_day_florence_nonwindow
    :parameters (?c - city ?d - day)
    :precondition (and (is_florence ?c) (first_day ?d) (not (florence_window ?d)) (not (assigned ?d)))
    :effect (and
      (assigned ?d)
      (in_city ?c ?d)
      (visited_florence)
    )
  )

  ;; --- Assign the first day to Florence (window day) ---
  (:action assign_first_day_florence_window
    :parameters (?c - city ?d - day)
    :precondition (and (is_florence ?c) (first_day ?d) (florence_window ?d) (not (assigned ?d)))
    :effect (and
      (assigned ?d)
      (in_city ?c ?d)
      (visited_florence)
      (florence_met)
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