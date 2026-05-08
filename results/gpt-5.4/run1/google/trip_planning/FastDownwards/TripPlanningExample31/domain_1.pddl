(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (frankfurt_days ?n - count)
    (reykjavik_days ?n - count)
    (split_days ?n - count)
    (next_frankfurt_count ?a - count ?b - count)
    (next_reykjavik_count ?a - count ?b - count)
    (next_split_count ?a - count ?b - count)
    (workshop_day ?d - day)
    (workshop_done)
    (start_not_chosen)
  )

  (:action choose_start_frankfurt
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_not_chosen)
    )
    :effect (and
      (at frankfurt)
      (not (start_not_chosen))
    )
  )

  (:action choose_start_reykjavik
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_not_chosen)
    )
    :effect (and
      (at reykjavik)
      (not (start_not_chosen))
    )
  )

  (:action choose_start_split
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_not_chosen)
    )
    :effect (and
      (at split)
      (not (start_not_chosen))
    )
  )

  (:action stay_in_frankfurt
    :parameters (?d - day ?d_next - day ?f_from - count ?f_to - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at frankfurt)
      (frankfurt_days ?f_from)
      (next_frankfurt_count ?f_from ?f_to)
      (not (start_not_chosen))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (frankfurt_days ?f_from))
      (frankfurt_days ?f_to)
    )
  )

  (:action stay_in_frankfurt_saturated
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at frankfurt)
      (frankfurt_days f2)
      (not (start_not_chosen))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_in_split
    :parameters (?d - day ?d_next - day ?s_from - count ?s_to - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at split)
      (split_days ?s_from)
      (next_split_count ?s_from ?s_to)
      (not (start_not_chosen))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (split_days ?s_from))
      (split_days ?s_to)
    )
  )

  (:action stay_in_split_saturated
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at split)
      (split_days s7)
      (not (start_not_chosen))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_in_reykjavik
    :parameters (?d - day ?d_next - day ?r_from - count ?r_to - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
      (reykjavik_days ?r_from)
      (next_reykjavik_count ?r_from ?r_to)
      (not (start_not_chosen))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (reykjavik_days ?r_from))
      (reykjavik_days ?r_to)
    )
  )

  (:action stay_in_reykjavik_saturated
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
      (reykjavik_days r3)
      (not (start_not_chosen))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action attend_workshop_by_staying
    :parameters (?d - day ?d_next - day ?r_from - count ?r_to - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (workshop_day ?d)
      (at reykjavik)
      (reykjavik_days ?r_from)
      (next_reykjavik_count ?r_from ?r_to)
      (not (workshop_done))
      (not (start_not_chosen))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (reykjavik_days ?r_from))
      (reykjavik_days ?r_to)
      (workshop_done)
    )
  )

  (:action attend_workshop_by_staying_saturated
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (workshop_day ?d)
      (at reykjavik)
      (reykjavik_days r3)
      (not (workshop_done))
      (not (start_not_chosen))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (workshop_done)
    )
  )

  (:action fly_frankfurt_to_reykjavik_and_spend_day
    :parameters (?d - day ?d_next - day ?r_from - count ?r_to - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (reykjavik_days ?r_from)
      (next_reykjavik_count ?r_from ?r_to)
      (not (start_not_chosen))
    )
    :effect (and
      (not (at frankfurt))
      (at reykjavik)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (reykjavik_days ?r_from))
      (reykjavik_days ?r_to)
    )
  )

  (:action fly_frankfurt_to_reykjavik_and_spend_day_saturated
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (reykjavik_days r3)
      (not (start_not_chosen))
    )
    :effect (and
      (not (at frankfurt))
      (at reykjavik)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_frankfurt_to_reykjavik_for_workshop
    :parameters (?d - day ?d_next - day ?r_from - count ?r_to - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (workshop_day ?d)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (reykjavik_days ?r_from)
      (next_reykjavik_count ?r_from ?r_to)
      (not (workshop_done))
      (not (start_not_chosen))
    )
    :effect (and
      (not (at frankfurt))
      (at reykjavik)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (reykjavik_days ?r_from))
      (reykjavik_days ?r_to)
      (workshop_done)
    )
  )

  (:action fly_frankfurt_to_reykjavik_for_workshop_saturated
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (workshop_day ?d)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (reykjavik_days r3)
      (not (workshop_done))
      (not (start_not_chosen))
    )
    :effect (and
      (not (at frankfurt))
      (at reykjavik)
      (not (current_day ?d))
      (current_day ?d_next)
      (workshop_done)
    )
  )

  (:action fly_reykjavik_to_frankfurt_and_spend_day
    :parameters (?d - day ?d_next - day ?f_from - count ?f_to - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
      (direct_flight reykjavik frankfurt)
      (frankfurt_days ?f_from)
      (next_frankfurt_count ?f_from ?f_to)
      (not (start_not_chosen))
    )
    :effect (and
      (not (at reykjavik))
      (at frankfurt)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (frankfurt_days ?f_from))
      (frankfurt_days ?f_to)
    )
  )

  (:action fly_reykjavik_to_frankfurt_and_spend_day_saturated
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
      (direct_flight reykjavik frankfurt)
      (frankfurt_days f2)
      (not (start_not_chosen))
    )
    :effect (and
      (not (at reykjavik))
      (at frankfurt)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_split_to_frankfurt_and_spend_day
    :parameters (?d - day ?d_next - day ?f_from - count ?f_to - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at split)
      (direct_flight split frankfurt)
      (frankfurt_days ?f_from)
      (next_frankfurt_count ?f_from ?f_to)
      (not (start_not_chosen))
    )
    :effect (and
      (not (at split))
      (at frankfurt)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (frankfurt_days ?f_from))
      (frankfurt_days ?f_to)
    )
  )

  (:action fly_split_to_frankfurt_and_spend_day_saturated
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at split)
      (direct_flight split frankfurt)
      (frankfurt_days f2)
      (not (start_not_chosen))
    )
    :effect (and
      (not (at split))
      (at frankfurt)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_frankfurt_to_split_and_spend_day
    :parameters (?d - day ?d_next - day ?s_from - count ?s_to - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at frankfurt)
      (direct_flight frankfurt split)
      (split_days ?s_from)
      (next_split_count ?s_from ?s_to)
      (not (start_not_chosen))
    )
    :effect (and
      (not (at frankfurt))
      (at split)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (split_days ?s_from))
      (split_days ?s_to)
    )
  )

  (:action fly_frankfurt_to_split_and_spend_day_saturated
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at frankfurt)
      (direct_flight frankfurt split)
      (split_days s7)
      (not (start_not_chosen))
    )
    :effect (and
      (not (at frankfurt))
      (at split)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )
)