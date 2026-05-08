(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day rcount mcount scount
  )

  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (day_assigned ?d - day)
    (split_window_satisfied)
    (rvis ?n - rcount)
    (mvis ?n - mcount)
    (svis ?n - scount)
  )

  (:action start_in_reykjavik
    :parameters ()
    :precondition (and
      (not (day_assigned d1))
      (rvis r0)
      (mvis m0)
      (svis s0)
    )
    :effect (and
      (at reykjavik d1)
      (day_assigned d1)
      (not (rvis r0))
      (rvis r1)
    )
  )

  (:action start_in_milan
    :parameters ()
    :precondition (and
      (not (day_assigned d1))
      (rvis r0)
      (mvis m0)
      (svis s0)
    )
    :effect (and
      (at milan d1)
      (day_assigned d1)
      (not (mvis m0))
      (mvis m1)
    )
  )

  (:action start_in_split
    :parameters ()
    :precondition (and
      (not (day_assigned d1))
      (rvis r0)
      (mvis m0)
      (svis s0)
    )
    :effect (and
      (at split d1)
      (day_assigned d1)
      (not (svis s0))
      (svis s1)
      (split_window_satisfied)
    )
  )

  (:action stay_reykjavik
    :parameters (?d - day ?d2 - day ?from - rcount ?to - rcount)
    :precondition (and
      (at reykjavik ?d)
      (day_assigned ?d)
      (next_day ?d ?d2)
      (not (day_assigned ?d2))
      (rvis ?from)
      (rnext ?from ?to)
    )
    :effect (and
      (at reykjavik ?d2)
      (day_assigned ?d2)
      (not (rvis ?from))
      (rvis ?to)
    )
  )

  (:action stay_milan
    :parameters (?d - day ?d2 - day ?from - mcount ?to - mcount)
    :precondition (and
      (at milan ?d)
      (day_assigned ?d)
      (next_day ?d ?d2)
      (not (day_assigned ?d2))
      (mvis ?from)
      (mnext ?from ?to)
    )
    :effect (and
      (at milan ?d2)
      (day_assigned ?d2)
      (not (mvis ?from))
      (mvis ?to)
    )
  )

  (:action stay_split_window
    :parameters (?d - day ?d2 - day ?from - scount ?to - scount)
    :precondition (and
      (at split ?d)
      (day_assigned ?d)
      (next_day ?d ?d2)
      (not (day_assigned ?d2))
      (svis ?from)
      (snext ?from ?to)
      (early_day ?d2)
      (not (split_window_satisfied))
    )
    :effect (and
      (at split ?d2)
      (day_assigned ?d2)
      (not (svis ?from))
      (svis ?to)
      (split_window_satisfied)
    )
  )

  (:action stay_split
    :parameters (?d - day ?d2 - day ?from - scount ?to - scount)
    :precondition (and
      (at split ?d)
      (day_assigned ?d)
      (next_day ?d ?d2)
      (not (day_assigned ?d2))
      (svis ?from)
      (snext ?from ?to)
    )
    :effect (and
      (at split ?d2)
      (day_assigned ?d2)
      (not (svis ?from))
      (svis ?to)
    )
  )

  (:action fly_reykjavik_to_milan
    :parameters (?d - day ?d2 - day ?from - mcount ?to - mcount)
    :precondition (and
      (at reykjavik ?d)
      (day_assigned ?d)
      (next_day ?d ?d2)
      (not (day_assigned ?d2))
      (direct_flight reykjavik milan)
      (mvis ?from)
      (mnext ?from ?to)
    )
    :effect (and
      (at milan ?d2)
      (day_assigned ?d2)
      (not (mvis ?from))
      (mvis ?to)
    )
  )

  (:action fly_milan_to_reykjavik
    :parameters (?d - day ?d2 - day ?from - rcount ?to - rcount)
    :precondition (and
      (at milan ?d)
      (day_assigned ?d)
      (next_day ?d ?d2)
      (not (day_assigned ?d2))
      (direct_flight milan reykjavik)
      (rvis ?from)
      (rnext ?from ?to)
    )
    :effect (and
      (at reykjavik ?d2)
      (day_assigned ?d2)
      (not (rvis ?from))
      (rvis ?to)
    )
  )

  (:action fly_milan_to_split_window
    :parameters (?d - day ?d2 - day ?from - scount ?to - scount)
    :precondition (and
      (at milan ?d)
      (day_assigned ?d)
      (next_day ?d ?d2)
      (not (day_assigned ?d2))
      (direct_flight milan split)
      (svis ?from)
      (snext ?from ?to)
      (early_day ?d2)
      (not (split_window_satisfied))
    )
    :effect (and
      (at split ?d2)
      (day_assigned ?d2)
      (not (svis ?from))
      (svis ?to)
      (split_window_satisfied)
    )
  )

  (:action fly_milan_to_split
    :parameters (?d - day ?d2 - day ?from - scount ?to - scount)
    :precondition (and
      (at milan ?d)
      (day_assigned ?d)
      (next_day ?d ?d2)
      (not (day_assigned ?d2))
      (direct_flight milan split)
      (svis ?from)
      (snext ?from ?to)
    )
    :effect (and
      (at split ?d2)
      (day_assigned ?d2)
      (not (svis ?from))
      (svis ?to)
    )
  )

  (:action fly_split_to_milan
    :parameters (?d - day ?d2 - day ?from - mcount ?to - mcount)
    :precondition (and
      (at split ?d)
      (day_assigned ?d)
      (next_day ?d ?d2)
      (not (day_assigned ?d2))
      (direct_flight split milan)
      (mvis ?from)
      (mnext ?from ?to)
    )
    :effect (and
      (at milan ?d2)
      (day_assigned ?d2)
      (not (mvis ?from))
      (mvis ?to)
    )
  )

  (:predicates
    (rnext ?a - rcount ?b - rcount)
    (mnext ?a - mcount ?b - mcount)
    (snext ?a - scount ?b - scount)
    (early_day ?d - day)
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (day_assigned ?d - day)
    (split_window_satisfied)
    (rvis ?n - rcount)
    (mvis ?n - mcount)
    (svis ?n - scount)
  )
)