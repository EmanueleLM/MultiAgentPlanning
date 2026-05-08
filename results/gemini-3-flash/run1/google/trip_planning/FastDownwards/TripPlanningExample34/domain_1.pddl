(define (domain trip_planning_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (next ?d1 ?d2 - day)
    (connected ?c1 ?c2 - city)
    (count_frankfurt ?v - count)
    (count_florence ?v - count)
    (count_valencia ?v - count)
    (succ ?v1 ?v2 - count)
    (started)
  )

  ;; Start the trip on day 1 at Valencia
  (:action start_at_valencia
    :parameters ()
    :precondition (not (started))
    :effect (and (started) (at valencia d1) (visited valencia d1)
                 (count_valencia c1) (count_frankfurt c0) (count_florence c0))
  )

  ;; Start the trip on day 1 at Frankfurt
  (:action start_at_frankfurt
    :parameters ()
    :precondition (not (started))
    :effect (and (started) (at frankfurt d1) (visited frankfurt d1)
                 (count_frankfurt c1) (count_valencia c0) (count_florence c0))
  )

  ;; Start the trip on day 1 at Florence
  (:action start_at_florence
    :parameters ()
    :precondition (not (started))
    :effect (and (started) (at florence d1) (visited florence d1)
                 (count_florence c1) (count_frankfurt c0) (count_valencia c0))
  )

  ;; Movement actions to each city to increment the correct destination counter
  (:action move_to_frankfurt
    :parameters (?from - city ?d_prev - day ?d_now - day ?c_before - count ?c_after - count)
    :precondition (and (at ?from ?d_prev) (next ?d_prev ?d_now)
                       (connected ?from frankfurt)
                       (count_frankfurt ?c_before) (succ ?c_before ?c_after))
    :effect (and (not (at ?from ?d_prev)) (at frankfurt ?d_now)
                 (visited frankfurt ?d_now)
                 (not (count_frankfurt ?c_before)) (count_frankfurt ?c_after))
  )

  (:action move_to_florence
    :parameters (?from - city ?d_prev - day ?d_now - day ?c_before - count ?c_after - count)
    :precondition (and (at ?from ?d_prev) (next ?d_prev ?d_now)
                       (connected ?from florence)
                       (count_florence ?c_before) (succ ?c_before ?c_after))
    :effect (and (not (at ?from ?d_prev)) (at florence ?d_now)
                 (visited florence ?d_now)
                 (not (count_florence ?c_before)) (count_florence ?c_after))
  )

  (:action move_to_valencia
    :parameters (?from - city ?d_prev - day ?d_now - day ?c_before - count ?c_after - count)
    :precondition (and (at ?from ?d_prev) (next ?d_prev ?d_now)
                       (connected ?from valencia)
                       (count_valencia ?c_before) (succ ?c_before ?c_after))
    :effect (and (not (at ?from ?d_prev)) (at valencia ?d_now)
                 (visited valencia ?d_now)
                 (not (count_valencia ?c_before)) (count_valencia ?c_after))
  )

  ;; Stay actions for each city to increment the correct counter
  (:action stay_at_frankfurt
    :parameters (?d_prev - day ?d_now - day ?c_before - count ?c_after - count)
    :precondition (and (at frankfurt ?d_prev) (next ?d_prev ?d_now)
                       (count_frankfurt ?c_before) (succ ?c_before ?c_after))
    :effect (and (not (at frankfurt ?d_prev)) (at frankfurt ?d_now)
                 (visited frankfurt ?d_now)
                 (not (count_frankfurt ?c_before)) (count_frankfurt ?c_after))
  )

  (:action stay_at_florence
    :parameters (?d_prev - day ?d_now - day ?c_before - count ?c_after - count)
    :precondition (and (at florence ?d_prev) (next ?d_prev ?d_now)
                       (count_florence ?c_before) (succ ?c_before ?c_after))
    :effect (and (not (at florence ?d_prev)) (at florence ?d_now)
                 (visited florence ?d_now)
                 (not (count_florence ?c_before)) (count_florence ?c_after))
  )

  (:action stay_at_valencia
    :parameters (?d_prev - day ?d_now - day ?c_before - count ?c_after - count)
    :precondition (and (at valencia ?d_prev) (next ?d_prev ?d_now)
                       (count_valencia ?c_before) (succ ?c_before ?c_after))
    :effect (and (not (at valencia ?d_prev)) (at valencia ?d_now)
                 (visited valencia ?d_now)
                 (not (count_valencia ?c_before)) (count_valencia ?c_after))
  )
)