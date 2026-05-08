(define (domain european_trip_14day_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    amsterdam_count
    istanbul_count
    santorini_count
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (last_day ?d - day)
    (assigned ?d - day)
    (at_on ?d - day ?c - city)
    (direct_flight ?from - city ?to - city)

    (a_count ?n - amsterdam_count)
    (i_count ?n - istanbul_count)
    (s_count ?n - santorini_count)

    (a_succ ?n1 - amsterdam_count ?n2 - amsterdam_count)
    (i_succ ?n1 - istanbul_count ?n2 - istanbul_count)
    (s_succ ?n1 - santorini_count ?n2 - santorini_count)

    (window_day ?d - day)
    (relatives_visited)
    (unstarted)
    (finished)
  )

  (:action start_in_amsterdam
    :parameters (?a1 - amsterdam_count ?a2 - amsterdam_count)
    :precondition (and
      (current_day day_1)
      (unstarted)
      (a_count ?a1)
      (a_succ ?a1 ?a2)
    )
    :effect (and
      (not (unstarted))
      (assigned day_1)
      (at_on day_1 amsterdam)
      (not (a_count ?a1))
      (a_count ?a2)
    )
  )

  (:action start_in_istanbul
    :parameters (?i1 - istanbul_count ?i2 - istanbul_count)
    :precondition (and
      (current_day day_1)
      (unstarted)
      (i_count ?i1)
      (i_succ ?i1 ?i2)
    )
    :effect (and
      (not (unstarted))
      (assigned day_1)
      (at_on day_1 istanbul)
      (not (i_count ?i1))
      (i_count ?i2)
    )
  )

  (:action start_in_santorini
    :parameters (?s1 - santorini_count ?s2 - santorini_count)
    :precondition (and
      (current_day day_1)
      (unstarted)
      (s_count ?s1)
      (s_succ ?s1 ?s2)
    )
    :effect (and
      (not (unstarted))
      (assigned day_1)
      (at_on day_1 santorini)
      (not (s_count ?s1))
      (s_count ?s2)
    )
  )

  (:action stay_next_day_in_amsterdam
    :parameters (?d1 - day ?d2 - day ?a1 - amsterdam_count ?a2 - amsterdam_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at_on ?d1 amsterdam)
      (a_count ?a1)
      (a_succ ?a1 ?a2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at_on ?d2 amsterdam)
      (not (a_count ?a1))
      (a_count ?a2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_next_day_in_istanbul
    :parameters (?d1 - day ?d2 - day ?i1 - istanbul_count ?i2 - istanbul_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at_on ?d1 istanbul)
      (i_count ?i1)
      (i_succ ?i1 ?i2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at_on ?d2 istanbul)
      (not (i_count ?i1))
      (i_count ?i2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_next_day_in_santorini
    :parameters (?d1 - day ?d2 - day ?s1 - santorini_count ?s2 - santorini_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at_on ?d1 santorini)
      (s_count ?s1)
      (s_succ ?s1 ?s2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at_on ?d2 santorini)
      (not (s_count ?s1))
      (s_count ?s2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_next_day_in_santorini_window
    :parameters (?d1 - day ?d2 - day ?s1 - santorini_count ?s2 - santorini_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at_on ?d1 santorini)
      (s_count ?s1)
      (s_succ ?s1 ?s2)
      (window_day ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at_on ?d2 santorini)
      (not (s_count ?s1))
      (s_count ?s2)
      (not (current_day ?d1))
      (current_day ?d2)
      (relatives_visited)
    )
  )

  (:action fly_amsterdam_to_santorini
    :parameters (?d1 - day ?d2 - day ?s1 - santorini_count ?s2 - santorini_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at_on ?d1 amsterdam)
      (direct_flight amsterdam santorini)
      (s_count ?s1)
      (s_succ ?s1 ?s2)
      (not (assigned ?d2))
      (not (window_day ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at_on ?d2 santorini)
      (not (s_count ?s1))
      (s_count ?s2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_amsterdam_to_santorini_window
    :parameters (?d1 - day ?d2 - day ?s1 - santorini_count ?s2 - santorini_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at_on ?d1 amsterdam)
      (direct_flight amsterdam santorini)
      (s_count ?s1)
      (s_succ ?s1 ?s2)
      (window_day ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at_on ?d2 santorini)
      (not (s_count ?s1))
      (s_count ?s2)
      (not (current_day ?d1))
      (current_day ?d2)
      (relatives_visited)
    )
  )

  (:action fly_santorini_to_amsterdam
    :parameters (?d1 - day ?d2 - day ?a1 - amsterdam_count ?a2 - amsterdam_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at_on ?d1 santorini)
      (direct_flight santorini amsterdam)
      (a_count ?a1)
      (a_succ ?a1 ?a2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at_on ?d2 amsterdam)
      (not (a_count ?a1))
      (a_count ?a2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_istanbul_to_amsterdam
    :parameters (?d1 - day ?d2 - day ?a1 - amsterdam_count ?a2 - amsterdam_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at_on ?d1 istanbul)
      (direct_flight istanbul amsterdam)
      (a_count ?a1)
      (a_succ ?a1 ?a2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at_on ?d2 amsterdam)
      (not (a_count ?a1))
      (a_count ?a2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_amsterdam_to_istanbul
    :parameters (?d1 - day ?d2 - day ?i1 - istanbul_count ?i2 - istanbul_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at_on ?d1 amsterdam)
      (direct_flight amsterdam istanbul)
      (i_count ?i1)
      (i_succ ?i1 ?i2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at_on ?d2 istanbul)
      (not (i_count ?i1))
      (i_count ?i2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action mark_finished
    :parameters ()
    :precondition (and
      (current_day day_14)
      (assigned day_14)
      (not (finished))
    )
    :effect (and
      (finished)
    )
  )
)