(define (domain trip_planning_example37)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    agent city day
    reykjavik_count porto_count milan_count - object
  )
  (:constants
    reykjavik_c0 reykjavik_c1 reykjavik_c2 reykjavik_c3 reykjavik_c4 reykjavik_c5 reykjavik_c6 - reykjavik_count
    porto_c0 porto_c1 porto_c2 - porto_count
    milan_c0 milan_c1 milan_c2 milan_c3 milan_c4 - milan_count
  )
  (:predicates
    (at ?a - agent ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
    (has_spent_in_reykjavik ?rc - reykjavik_count) ; Tracks current count for Reykjavik
    (has_spent_in_porto ?pc - porto_count) ; Tracks current count for Porto
    (has_spent_in_milan ?mc - milan_count) ; Tracks current count for Milan
    (next_reykjavik_count ?rc1 - reykjavik_count ?rc2 - reykjavik_count)
    (next_porto_count ?pc1 - porto_count ?pc2 - porto_count)
    (next_milan_count ?mc1 - milan_count ?mc2 - milan_count)
    (was_in_porto_on_day9) ; Explicit predicate for being in Porto on day 9
    (was_in_porto_on_day10) ; Explicit predicate for being in Porto on day 10
  )

  (:action move)
    (:parameters (?a - agent ?from - city ?to - city ?d - day))
    (:precondition (and
      (at ?a ?from)
      (not (at ?a ?to))
      (connected ?from ?to)
      (current_day ?d)
    ))
    (:effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (increase (total-cost) 1)
    ))

  (:action advance_day_reykjavik)
    (:parameters (?a - agent ?d - day ?next_d - day ?prev_rc - reykjavik_count ?new_rc - reykjavik_count))
    (:precondition (and
      (at ?a reykjavik)
      (current_day ?d)
      (next_day ?d ?next_d) ; This action is for days d1-d9
      (has_spent_in_reykjavik ?prev_rc)
      (next_reykjavik_count ?prev_rc ?new_rc)
    ))
    (:effect (and
      (not (current_day ?d))
      (current_day ?next_d)
      (not (has_spent_in_reykjavik ?prev_rc))
      (has_spent_in_reykjavik ?new_rc)
      (increase (total-cost) 1)
    ))

  (:action advance_day_reykjavik_final)
    (:parameters (?a - agent ?prev_rc - reykjavik_count ?new_rc - reykjavik_count))
    (:precondition (and
      (at ?a reykjavik)
      (current_day d10) ; This action is specifically for the last day
      (has_spent_in_reykjavik ?prev_rc)
      (next_reykjavik_count ?prev_rc ?new_rc)
    ))
    (:effect (and
      (not (has_spent_in_reykjavik ?prev_rc))
      (has_spent_in_reykjavik ?new_rc)
      (increase (total-cost) 1)
    ))

  (:action advance_day_porto)
    (:parameters (?a - agent ?d - day ?next_d - day ?prev_pc - porto_count ?new_pc - porto_count))
    (:precondition (and
      (at ?a porto)
      (current_day ?d)
      (next_day ?d ?next_d) ; This action is for days d1-d8 (not d9 or d10)
      (not (current_day d9)) (not (current_day d10))
      (has_spent_in_porto ?prev_pc)
      (next_porto_count ?prev_pc ?new_pc)
    ))
    (:effect (and
      (not (current_day ?d))
      (current_day ?next_d)
      (not (has_spent_in_porto ?prev_pc))
      (has_spent_in_porto ?new_pc)
      (increase (total-cost) 1)
    ))

  (:action advance_day_porto_d9)
    (:parameters (?a - agent ?next_d - day ?prev_pc - porto_count ?new_pc - porto_count))
    (:precondition (and
      (at ?a porto)
      (current_day d9)
      (next_day d9 ?next_d)
      (has_spent_in_porto ?prev_pc)
      (next_porto_count ?prev_pc ?new_pc)
    ))
    (:effect (and
      (not (current_day d9))
      (current_day ?next_d)
      (not (has_spent_in_porto ?prev_pc))
      (has_spent_in_porto ?new_pc)
      (was_in_porto_on_day9)
      (increase (total-cost) 1)
    ))

  (:action advance_day_porto_d10)
    (:parameters (?a - agent ?prev_pc - porto_count ?new_pc - porto_count))
    (:precondition (and
      (at ?a porto)
      (current_day d10)
      (has_spent_in_porto ?prev_pc)
      (next_porto_count ?prev_pc ?new_pc)
    ))
    (:effect (and
      (not (has_spent_in_porto ?prev_pc))
      (has_spent_in_porto ?new_pc)
      (was_in_porto_on_day10)
      (increase (total-cost) 1)
    ))

  (:action advance_day_milan)
    (:parameters (?a - agent ?d - day ?next_d - day ?prev_mc - milan_count ?new_mc - milan_count))
    (:precondition (and
      (at ?a milan)
      (current_day ?d)
      (next_day ?d ?next_d) ; This action is for days d1-d9
      (has_spent_in_milan ?prev_mc)
      (next_milan_count ?prev_mc ?new_mc)
    ))
    (:effect (and
      (not (current_day ?d))
      (current_day ?next_d)
      (not (has_spent_in_milan ?prev_mc))
      (has_spent_in_milan ?new_mc)
      (increase (total-cost) 1)
    ))

  (:action advance_day_milan_final)
    (:parameters (?a - agent ?prev_mc - milan_count ?new_mc - milan_count))
    (:precondition (and
      (at ?a milan)
      (current_day d10) ; This action is specifically for the last day
      (has_spent_in_milan ?prev_mc)
      (next_milan_count ?prev_mc ?new_mc)
    ))
    (:effect (and
      (not (has_spent_in_milan ?prev_mc))
      (has_spent_in_milan ?new_mc)
      (increase (total-cost) 1)
    ))

  (:action advance_day_idle)
    (:parameters (?a - agent ?c - city ?d - day ?next_d - day))
    (:precondition (and
      (at ?a ?c)
      (current_day ?d)
      (next_day ?d ?next_d) ; This action is for days d1-d9
      ; This action allows time to pass without specific city duration credit.
      ; The planner will choose this if no specific city-day-counting action is required or possible.
    ))
    (:effect (and
      (not (current_day ?d))
      (current_day ?next_d)
      (increase (total-cost) 1)
    ))

  (:action advance_day_idle_final)
    (:parameters (?a - agent ?c - city))
    (:precondition (and
      (at ?a ?c)
      (current_day d10) ; This action is specifically for the last day
    ))
    (:effect (and
      (increase (total-cost) 1)
    ))
)