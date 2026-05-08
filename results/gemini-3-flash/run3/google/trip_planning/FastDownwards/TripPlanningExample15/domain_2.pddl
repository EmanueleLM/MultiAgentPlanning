(define (domain trip_planning_example15)
  (:requirements :strips :typing)
  (:types city day val)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (count ?c - city ?v - val)
    (visited ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_val ?v1 ?v2 - val)
    (connected ?c1 ?c2 - city)
    (is_last_day ?d - day)
    (trip_done)
  )

  ;; Action for staying in a city for a day.
  ;; Increases the city's count by 1 and moves to the next day.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?v_old ?v_new - val)
    :precondition (and (at ?c)
                       (current_day ?d_curr)
                       (next_day ?d_curr ?d_next)
                       (count ?c ?v_old)
                       (next_val ?v_old ?v_new))
    :effect (and (not (current_day ?d_curr))
                 (current_day ?d_next)
                 (not (count ?c ?v_old))
                 (count ?c ?v_new)
                 (visited ?c ?d_curr))
  )

  ;; Action for flying to a new city.
  ;; The travel day counts for both the origin and the destination city.
  ;; Increases both cities' counts by 1 and moves to the next day.
  (:action fly
    :parameters (?from ?to - city ?d_curr ?d_next - day ?v_old_f ?v_new_f ?v_old_t ?v_new_t - val)
    :precondition (and (at ?from)
                       (current_day ?d_curr)
                       (next_day ?d_curr ?d_next)
                       (connected ?from ?to)
                       (count ?from ?v_old_f) (next_val ?v_old_f ?v_new_f)
                       (count ?to ?v_old_t) (next_val ?v_old_t ?v_new_t))
    :effect (and (not (at ?from))
                 (at ?to)
                 (not (current_day ?d_curr))
                 (current_day ?d_next)
                 (not (count ?from ?v_old_f))
                 (count ?from ?v_new_f)
                 (not (count ?to ?v_old_t))
                 (count ?to ?v_new_t)
                 (visited ?from ?d_curr)
                 (visited ?to ?d_curr))
  )

  ;; Action to conclude the trip on the final day.
  ;; Finalizes the last day's visit count and marks the trip as finished.
  (:action conclude
    :parameters (?c - city ?d_last - day ?v_old ?v_new - val)
    :precondition (and (at ?c)
                       (current_day ?d_last)
                       (is_last_day ?d_last)
                       (count ?c ?v_old)
                       (next_val ?v_old ?v_new))
    :effect (and (not (count ?c ?v_old))
                 (count ?c ?v_new)
                 (visited ?c ?d_last)
                 (trip_done))
  )
)