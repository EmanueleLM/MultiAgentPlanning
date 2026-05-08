(define (domain trip_planning_example_39)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?count - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?c1 ?c2 - count)
    (is_porto_relative_day ?d - day)
    (relatives_visited)
    (porto_satisfied)
    (barcelona_satisfied)
    (florence_satisfied)
    (at_least_3 ?c - count)
    (at_least_7 ?c - count)
    (at_least_4 ?c - count)
  )

  ;; Action to visit relatives in Porto - does not consume a day
  (:action visit_relatives_porto
    :parameters (?d - day)
    :precondition (and (at porto) (current_day ?d) (is_porto_relative_day ?d))
    :effect (relatives_visited)
  )

  ;; Stay in Porto for the day
  (:action stay_porto
    :parameters (?d_curr ?d_next - day ?c_curr ?c_next - count)
    :precondition (and (at porto) (current_day ?d_curr) (next_day ?d_curr ?d_next) (stay_count porto ?c_curr) (next_count ?c_curr ?c_next))
    :effect (and (not (current_day ?d_curr)) (current_day ?d_next) (not (stay_count porto ?c_curr)) (stay_count porto ?c_next))
  )

  ;; Stay in Barcelona for the day
  (:action stay_barcelona
    :parameters (?d_curr ?d_next - day ?c_curr ?c_next - count)
    :precondition (and (at barcelona) (current_day ?d_curr) (next_day ?d_curr ?d_next) (stay_count barcelona ?c_curr) (next_count ?c_curr ?c_next))
    :effect (and (not (current_day ?d_curr)) (current_day ?d_next) (not (stay_count barcelona ?c_curr)) (stay_count barcelona ?c_next))
  )

  ;; Stay in Florence for the day
  (:action stay_florence
    :parameters (?d_curr ?d_next - day ?c_curr ?c_next - count)
    :precondition (and (at florence) (current_day ?d_curr) (next_day ?d_curr ?d_next) (stay_count florence ?c_curr) (next_count ?c_curr ?c_next))
    :effect (and (not (current_day ?d_curr)) (current_day ?d_next) (not (stay_count florence ?c_curr)) (stay_count florence ?c_next))
  )

  ;; Fly from Porto to Barcelona - counts as a day for both
  (:action fly_porto_barcelona
    :parameters (?d_curr ?d_next - day ?p_curr ?p_next ?b_curr ?b_next - count)
    :precondition (and (at porto) (current_day ?d_curr) (next_day ?d_curr ?d_next) (stay_count porto ?p_curr) (next_count ?p_curr ?p_next) (stay_count barcelona ?b_curr) (next_count ?b_curr ?b_next))
    :effect (and (not (at porto)) (at barcelona) (not (current_day ?d_curr)) (current_day ?d_next) (not (stay_count porto ?p_curr)) (stay_count porto ?p_next) (not (stay_count barcelona ?b_curr)) (stay_count barcelona ?b_next))
  )

  ;; Fly from Barcelona to Porto - counts as a day for both
  (:action fly_barcelona_porto
    :parameters (?d_curr ?d_next - day ?b_curr ?b_next ?p_curr ?p_next - count)
    :precondition (and (at barcelona) (current_day ?d_curr) (next_day ?d_curr ?d_next) (stay_count barcelona ?b_curr) (next_count ?b_curr ?b_next) (stay_count porto ?p_curr) (next_count ?p_curr ?p_next))
    :effect (and (not (at barcelona)) (at porto) (not (current_day ?d_curr)) (current_day ?d_next) (not (stay_count barcelona ?b_curr)) (stay_count barcelona ?b_next) (not (stay_count porto ?p_curr)) (stay_count porto ?p_next))
  )

  ;; Fly from Barcelona to Florence - counts as a day for both
  (:action fly_barcelona_florence
    :parameters (?d_curr ?d_next - day ?b_curr ?b_next ?f_curr ?f_next - count)
    :precondition (and (at barcelona) (current_day ?d_curr) (next_day ?d_curr ?d_next) (stay_count barcelona ?b_curr) (next_count ?b_curr ?b_next) (stay_count florence ?f_curr) (next_count ?f_curr ?f_next))
    :effect (and (not (at barcelona)) (at florence) (not (current_day ?d_curr)) (current_day ?d_next) (not (stay_count barcelona ?b_curr)) (stay_count barcelona ?b_next) (not (stay_count florence ?f_curr)) (stay_count florence ?f_next))
  )

  ;; Fly from Florence to Barcelona - counts as a day for both
  (:action fly_florence_barcelona
    :parameters (?d_curr ?d_next - day ?f_curr ?f_next ?b_curr ?b_next - count)
    :precondition (and (at florence) (current_day ?d_curr) (next_day ?d_curr ?d_next) (stay_count florence ?f_curr) (next_count ?f_curr ?f_next) (stay_count barcelona ?b_curr) (next_count ?b_curr ?b_next))
    :effect (and (not (at florence)) (at barcelona) (not (current_day ?d_curr)) (current_day ?d_next) (not (stay_count florence ?f_curr)) (stay_count florence ?f_next) (not (stay_count barcelona ?b_curr)) (stay_count barcelona ?b_next))
  )

  ;; Goal checks
  (:action check_porto_satisfied
    :parameters (?c - count)
    :precondition (and (stay_count porto ?c) (at_least_3 ?c))
    :effect (porto_satisfied)
  )

  (:action check_barcelona_satisfied
    :parameters (?c - count)
    :precondition (and (stay_count barcelona ?c) (at_least_7 ?c))
    :effect (barcelona_satisfied)
  )

  (:action check_florence_satisfied
    :parameters (?c - count)
    :precondition (and (stay_count florence ?c) (at_least_4 ?c))
    :effect (florence_satisfied)
  )
)