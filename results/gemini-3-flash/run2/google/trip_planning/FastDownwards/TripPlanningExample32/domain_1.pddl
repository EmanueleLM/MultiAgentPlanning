(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types day count_num)
  (:predicates
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (at_riga)
    (at_paris)
    (at_reykjavik)
    (riga_count ?n - count_num)
    (paris_count ?n - count_num)
    (reykjavik_count ?n - count_num)
    (next_riga ?n1 ?n2 - count_num)
    (next_paris ?n1 ?n2 - count_num)
    (next_reykjavik ?n1 ?n2 - count_num)
    (visited_riga ?d - day)
    (visited_paris ?d - day)
    (visited_reykjavik ?d - day)
  )

  (:action stay_riga
    :parameters (?d ?nd - day ?n_old ?n_new - count_num)
    :precondition (and (at_riga) (current_day ?d) (next_day ?d ?nd) (riga_count ?n_old) (next_riga ?n_old ?n_new))
    :effect (and (not (current_day ?d)) (current_day ?nd) (not (riga_count ?n_old)) (riga_count ?n_new) (visited_riga ?d))
  )

  (:action stay_paris
    :parameters (?d ?nd - day ?n_old ?n_new - count_num)
    :precondition (and (at_paris) (current_day ?d) (next_day ?d ?nd) (paris_count ?n_old) (next_paris ?n_old ?n_new))
    :effect (and (not (current_day ?d)) (current_day ?nd) (not (paris_count ?n_old)) (paris_count ?n_new) (visited_paris ?d))
  )

  (:action stay_reykjavik
    :parameters (?d ?nd - day ?n_old ?n_new - count_num)
    :precondition (and (at_reykjavik) (current_day ?d) (next_day ?d ?nd) (reykjavik_count ?n_old) (next_reykjavik ?n_old ?n_new))
    :effect (and (not (current_day ?d)) (current_day ?nd) (not (reykjavik_count ?n_old)) (reykjavik_count ?n_new) (visited_reykjavik ?d))
  )

  (:action fly_riga_paris
    :parameters (?d ?nd - day ?nr_old ?nr_new ?np_old ?np_new - count_num)
    :precondition (and (at_riga) (current_day ?d) (next_day ?d ?nd) (riga_count ?nr_old) (next_riga ?nr_old ?nr_new) (paris_count ?np_old) (next_paris ?np_old ?np_new))
    :effect (and (not (at_riga)) (at_paris) (not (current_day ?d)) (current_day ?nd) (not (riga_count ?nr_old)) (riga_count ?nr_new) (not (paris_count ?np_old)) (paris_count ?np_new) (visited_riga ?d) (visited_paris ?d))
  )

  (:action fly_paris_riga
    :parameters (?d ?nd - day ?np_old ?np_new ?nr_old ?nr_new - count_num)
    :precondition (and (at_paris) (current_day ?d) (next_day ?d ?nd) (paris_count ?np_old) (next_paris ?np_old ?np_new) (riga_count ?nr_old) (next_riga ?nr_old ?nr_new))
    :effect (and (not (at_paris)) (at_riga) (not (current_day ?d)) (current_day ?nd) (not (paris_count ?np_old)) (paris_count ?np_new) (not (riga_count ?nr_old)) (riga_count ?nr_new) (visited_paris ?d) (visited_riga ?d))
  )

  (:action fly_paris_reykjavik
    :parameters (?d ?nd - day ?np_old ?np_new ?nry_old ?nry_new - count_num)
    :precondition (and (at_paris) (current_day ?d) (next_day ?d ?nd) (paris_count ?np_old) (next_paris ?np_old ?np_new) (reykjavik_count ?nry_old) (next_reykjavik ?nry_old ?nry_new))
    :effect (and (not (at_paris)) (at_reykjavik) (not (current_day ?d)) (current_day ?nd) (not (paris_count ?np_old)) (paris_count ?np_new) (not (reykjavik_count ?nry_old)) (reykjavik_count ?nry_new) (visited_paris ?d) (visited_reykjavik ?d))
  )

  (:action fly_reykjavik_paris
    :parameters (?d ?nd - day ?nry_old ?nry_new ?np_old ?np_new - count_num)
    :precondition (and (at_reykjavik) (current_day ?d) (next_day ?d ?nd) (reykjavik_count ?nry_old) (next_reykjavik ?nry_old ?nry_new) (paris_count ?np_old) (next_paris ?np_old ?np_new))
    :effect (and (not (at_reykjavik)) (at_paris) (not (current_day ?d)) (current_day ?nd) (not (reykjavik_count ?nry_old)) (reykjavik_count ?nry_new) (not (paris_count ?np_old)) (paris_count ?np_new) (visited_reykjavik ?d) (visited_paris ?d))
  )
)