(define (domain trip_planning_example9)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (at_no_city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (count_at ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (is_workshop_day ?d - day)
    (is_stuttgart ?c - city)
  )

  ;; Action to start the trip on Day 1
  (:action start_trip
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (at_no_city)
      (next_day ?d ?dnext)
      (count_at ?c n0)
      (next_count n0 n1)
      ;; Workshop constraint: if Day 1 is a workshop day, must start in Stuttgart
      (or (not (is_workshop_day ?d)) (is_stuttgart ?c))
    )
    :effect (and
      (not (at_no_city))
      (at ?c)
      (not (count_at ?c n0))
      (count_at ?c n1)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  ;; Action to stay in a city for a full day (no travel)
  (:action stay_normal
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?dnext)
      (not (is_workshop_day ?d))
      (count_at ?c ?n)
      (next_count ?n ?nnew)
    )
    :effect (and
      (not (count_at ?c ?n))
      (count_at ?c ?nnew)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  ;; Action to stay in Stuttgart during a workshop day
  (:action stay_workshop
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?dnext)
      (is_workshop_day ?d)
      (is_stuttgart ?c)
      (count_at ?c ?n)
      (next_count ?n ?nnew)
    )
    :effect (and
      (not (count_at ?c ?n))
      (count_at ?c ?nnew)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  ;; Action to fly between cities on a non-workshop day
  (:action fly_normal
    :parameters (?f - city ?t - city ?d - day ?dnext - day)
    :precondition (and
      (at ?f)
      (current_day ?d)
      (next_day ?d ?dnext)
      (flight ?f ?t)
      (not (is_workshop_day ?d))
      (count_at ?f ?nf)
      (next_count ?nf ?nfnew)
      (count_at ?t ?nt)
      (next_count ?nt ?ntnew)
    )
    :effect (and
      (not (at ?f))
      (at ?t)
      (not (count_at ?f ?nf))
      (count_at ?f ?nfnew)
      (not (count_at ?t ?nt))
      (count_at ?t ?ntnew)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  ;; Action to fly into the workshop city on a workshop day
  (:action fly_into_workshop
    :parameters (?f - city ?t - city ?d - day ?dnext - day)
    :precondition (and
      (at ?f)
      (current_day ?d)
      (next_day ?d ?dnext)
      (flight ?f ?t)
      (is_workshop_day ?d)
      (is_stuttgart ?t)
      (count_at ?f ?nf)
      (next_count ?nf ?nfnew)
      (count_at ?t ?nt)
      (next_count ?nt ?ntnew)
    )
    :effect (and
      (not (at ?f))
      (at ?t)
      (not (count_at ?f ?nf))
      (count_at ?f ?nfnew)
      (not (count_at ?t ?nt))
      (count_at ?t ?ntnew)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  ;; Action to fly out of the workshop city on a workshop day
  (:action fly_out_of_workshop
    :parameters (?f - city ?t - city ?d - day ?dnext - day)
    :precondition (and
      (at ?f)
      (current_day ?d)
      (next_day ?d ?dnext)
      (flight ?f ?t)
      (is_workshop_day ?d)
      (is_stuttgart ?f)
      (count_at ?f ?nf)
      (next_count ?nf ?nfnew)
      (count_at ?t ?nt)
      (next_count ?nt ?ntnew)
    )
    :effect (and
      (not (at ?f))
      (at ?t)
      (not (count_at ?f ?nf))
      (count_at ?f ?nfnew)
      (not (count_at ?t ?nt))
      (count_at ?t ?ntnew)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )
)