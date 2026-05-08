(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    fcount
    rcount
    scount
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (workshop_window ?d - day)
    (workshop_attended)

    (f_vis ?n - fcount)
    (f_next ?a - fcount ?b - fcount)

    (r_vis ?n - rcount)
    (r_next ?a - rcount ?b - rcount)

    (s_vis ?n - scount)
    (s_next ?a - scount ?b - scount)
  )

  (:action stay_in_frankfurt
    :parameters (?d1 - day ?d2 - day ?f_from - fcount ?f_to - fcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at frankfurt)
      (f_vis ?f_from)
      (f_next ?f_from ?f_to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (f_vis ?f_from))
      (f_vis ?f_to)
    )
  )

  (:action stay_in_reykjavik_window
    :parameters (?d1 - day ?d2 - day ?r_from - rcount ?r_to - rcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik)
      (workshop_window ?d1)
      (r_vis ?r_from)
      (r_next ?r_from ?r_to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (r_vis ?r_from))
      (r_vis ?r_to)
      (workshop_attended)
    )
  )

  (:action stay_in_reykjavik_nonwindow
    :parameters (?d1 - day ?d2 - day ?r_from - rcount ?r_to - rcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik)
      (not (workshop_window ?d1))
      (r_vis ?r_from)
      (r_next ?r_from ?r_to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (r_vis ?r_from))
      (r_vis ?r_to)
    )
  )

  (:action fly_frankfurt_to_reykjavik_window
    :parameters (?d1 - day ?d2 - day ?r_from - rcount ?r_to - rcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (workshop_window ?d1)
      (r_vis ?r_from)
      (r_next ?r_from ?r_to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at frankfurt))
      (at reykjavik)
      (not (r_vis ?r_from))
      (r_vis ?r_to)
      (workshop_attended)
    )
  )

  (:action fly_frankfurt_to_reykjavik_nonwindow
    :parameters (?d1 - day ?d2 - day ?r_from - rcount ?r_to - rcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (not (workshop_window ?d1))
      (r_vis ?r_from)
      (r_next ?r_from ?r_to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at frankfurt))
      (at reykjavik)
      (not (r_vis ?r_from))
      (r_vis ?r_to)
    )
  )

  (:action fly_reykjavik_to_frankfurt
    :parameters (?d1 - day ?d2 - day ?f_from - fcount ?f_to - fcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik)
      (direct_flight reykjavik frankfurt)
      (f_vis ?f_from)
      (f_next ?f_from ?f_to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at reykjavik))
      (at frankfurt)
      (not (f_vis ?f_from))
      (f_vis ?f_to)
    )
  )

  (:action fly_frankfurt_to_split
    :parameters (?d1 - day ?d2 - day ?s_from - scount ?s_to - scount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at frankfurt)
      (direct_flight frankfurt split)
      (s_vis ?s_from)
      (s_next ?s_from ?s_to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at frankfurt))
      (at split)
      (not (s_vis ?s_from))
      (s_vis ?s_to)
    )
  )

  (:action stay_in_split
    :parameters (?d1 - day ?d2 - day ?s_from - scount ?s_to - scount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at split)
      (s_vis ?s_from)
      (s_next ?s_from ?s_to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (s_vis ?s_from))
      (s_vis ?s_to)
    )
  )

  (:action fly_split_to_frankfurt
    :parameters (?d1 - day ?d2 - day ?f_from - fcount ?f_to - fcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at split)
      (direct_flight split frankfurt)
      (f_vis ?f_from)
      (f_next ?f_from ?f_to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at split))
      (at frankfurt)
      (not (f_vis ?f_from))
      (f_vis ?f_to)
    )
  )
)