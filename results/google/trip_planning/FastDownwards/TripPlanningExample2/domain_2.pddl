(define (domain trip-multiagent)
  (:requirements :strips :typing)
  (:types city day reykcount viennacount venicecount)

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (current_day ?d - day)
    (succ ?d1 - day ?d2 - day)
    (reykcount ?r - reykcount)
    (reyk_succ_count ?r1 - reykcount ?r2 - reykcount)
    (viennacount ?v - viennacount)
    (vienna_succ_count ?v1 - viennacount ?v2 - viennacount)
    (venicecount ?e - venicecount)
    (venice_succ_count ?e1 - venicecount ?e2 - venicecount)
    (wedding_day ?d - day)
    (attended_wedding)
  )

  (:action reykjavik_planner_stay_reykjavik
    :parameters (?d ?dnext - day ?r ?rnext - reykcount)
    :precondition (and
      (at reykjavik)
      (current_day ?d)
      (succ ?d ?dnext)
      (reykcount ?r)
      (reyk_succ_count ?r ?rnext)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (reykcount ?r))
      (reykcount ?rnext)
      (at reykjavik)
    )
  )

  (:action reykjavik_planner_fly_reykjavik_vienna
    :parameters ()
    :precondition (and
      (at reykjavik)
      (flight reykjavik vienna)
    )
    :effect (and
      (not (at reykjavik))
      (at vienna)
    )
  )

  (:action vienna_planner_stay_vienna
    :parameters (?d ?dnext - day ?v ?vnext - viennacount)
    :precondition (and
      (at vienna)
      (current_day ?d)
      (succ ?d ?dnext)
      (viennacount ?v)
      (vienna_succ_count ?v ?vnext)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (viennacount ?v))
      (viennacount ?vnext)
      (at vienna)
    )
  )

  (:action vienna_planner_fly_vienna_reykjavik
    :parameters ()
    :precondition (and
      (at vienna)
      (flight vienna reykjavik)
    )
    :effect (and
      (not (at vienna))
      (at reykjavik)
    )
  )

  (:action vienna_planner_fly_vienna_venice
    :parameters ()
    :precondition (and
      (at vienna)
      (flight vienna venice)
    )
    :effect (and
      (not (at vienna))
      (at venice)
    )
  )

  (:action vienna_planner_stay_venice
    :parameters (?d ?dnext - day ?e ?enext - venicecount)
    :precondition (and
      (at venice)
      (current_day ?d)
      (succ ?d ?dnext)
      (venicecount ?e)
      (venice_succ_count ?e ?enext)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (venicecount ?e))
      (venicecount ?enext)
      (at venice)
    )
  )

  (:action vienna_planner_attend_wedding_in_venice
    :parameters (?d - day)
    :precondition (and
      (at venice)
      (current_day ?d)
      (wedding_day ?d)
    )
    :effect (and
      (attended_wedding)
    )
  )
)