(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (v_count ?n - count)
    (l_count ?n - count)
    (s_count ?n - count)
    (visited ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
  )

  (:action stay_valencia
    :parameters (?d_now - day ?d_next - day ?v_now - count ?v_next - count)
    :precondition (and (at valencia) (current_day ?d_now) (next_day ?d_now ?d_next) (v_count ?v_now) (next_count ?v_now ?v_next))
    :effect (and (not (current_day ?d_now)) (current_day ?d_next) (not (v_count ?v_now)) (v_count ?v_next) (visited valencia ?d_now))
  )

  (:action stay_lyon
    :parameters (?d_now - day ?d_next - day ?l_now - count ?l_next - count)
    :precondition (and (at lyon) (current_day ?d_now) (next_day ?d_now ?d_next) (l_count ?l_now) (next_count ?l_now ?l_next))
    :effect (and (not (current_day ?d_now)) (current_day ?d_next) (not (l_count ?l_now)) (l_count ?l_next) (visited lyon ?d_now))
  )

  (:action stay_split
    :parameters (?d_now - day ?d_next - day ?s_now - count ?s_next - count)
    :precondition (and (at split) (current_day ?d_now) (next_day ?d_now ?d_next) (s_count ?s_now) (next_count ?s_now ?s_next))
    :effect (and (not (current_day ?d_now)) (current_day ?d_next) (not (s_count ?s_now)) (s_count ?s_next) (visited split ?d_now))
  )

  (:action fly_valencia_lyon
    :parameters (?d_now - day ?d_next - day ?v_now - count ?v_next - count ?l_now - count ?l_next - count)
    :precondition (and (at valencia) (current_day ?d_now) (next_day ?d_now ?d_next) (v_count ?v_now) (next_count ?v_now ?v_next) (l_count ?l_now) (next_count ?l_now ?l_next))
    :effect (and (not (at valencia)) (at lyon) (not (current_day ?d_now)) (current_day ?d_next) (not (v_count ?v_now)) (v_count ?v_next) (not (l_count ?l_now)) (l_count ?l_next) (visited valencia ?d_now) (visited lyon ?d_now))
  )

  (:action fly_lyon_valencia
    :parameters (?d_now - day ?d_next - day ?l_now - count ?l_next - count ?v_now - count ?v_next - count)
    :precondition (and (at lyon) (current_day ?d_now) (next_day ?d_now ?d_next) (l_count ?l_now) (next_count ?l_now ?l_next) (v_count ?v_now) (next_count ?v_now ?v_next))
    :effect (and (not (at lyon)) (at valencia) (not (current_day ?d_now)) (current_day ?d_next) (not (l_count ?l_now)) (l_count ?l_next) (not (v_count ?v_now)) (v_count ?v_next) (visited lyon ?d_now) (visited valencia ?d_now))
  )

  (:action fly_lyon_split
    :parameters (?d_now - day ?d_next - day ?l_now - count ?l_next - count ?s_now - count ?s_next - count)
    :precondition (and (at lyon) (current_day ?d_now) (next_day ?d_now ?d_next) (l_count ?l_now) (next_count ?l_now ?l_next) (s_count ?s_now) (next_count ?s_now ?s_next))
    :effect (and (not (at lyon)) (at split) (not (current_day ?d_now)) (current_day ?d_next) (not (l_count ?l_now)) (l_count ?l_next) (not (s_count ?s_now)) (s_count ?s_next) (visited lyon ?d_now) (visited split ?d_now))
  )

  (:action fly_split_lyon
    :parameters (?d_now - day ?d_next - day ?s_now - count ?s_next - count ?l_now - count ?l_next - count)
    :precondition (and (at split) (current_day ?d_now) (next_day ?d_now ?d_next) (s_count ?s_now) (next_count ?s_now ?s_next) (l_count ?l_now) (next_count ?l_now ?l_next))
    :effect (and (not (at split)) (at lyon) (not (current_day ?d_now)) (current_day ?d_next) (not (s_count ?s_now)) (s_count ?s_next) (not (l_count ?l_now)) (l_count ?l_next) (visited split ?d_now) (visited lyon ?d_now))
  )
)