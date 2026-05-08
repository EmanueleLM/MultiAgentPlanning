(define (domain trip_planning_example37)
  (:requirements :strips :typing :negative-preconditions)
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
    (has_spent_in_reykjavik ?rc - reykjavik_count)
    (has_spent_in_porto ?pc - porto_count)
    (has_spent_in_milan ?mc - milan_count)
    (next_reykjavik_count ?rc1 - reykjavik_count ?rc2 - reykjavik_count)
    (next_porto_count ?pc1 - porto_count ?pc2 - porto_count)
    (next_milan_count ?mc1 - milan_count ?mc2 - milan_count)
    (was_in_porto_on_day9)
    (was_in_porto_on_day10)
  )

  (:action travel)
    (:parameters (?a - agent ?from - city ?to - city))
    (:precondition (and
      (at ?a ?from)
      (not (at ?a ?to))
      (connected ?from ?to)
    ))
    (:effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    ))

  (:action spend_day_in_reykjavik)
    (:parameters (?a - agent ?current_d - day ?next_d - day ?prev_rc - reykjavik_count ?new_rc - reykjavik_count))
    (:precondition (and
      (at ?a reykjavik)
      (current_day ?current_d)
      (next_day ?current_d ?next_d)
      (has_spent_in_reykjavik ?prev_rc)
      (next_reykjavik_count ?prev_rc ?new_rc)
    ))
    (:effect (and
      (not (current_day ?current_d))
      (current_day ?next_d)
      (not (has_spent_in_reykjavik ?prev_rc))
      (has_spent_in_reykjavik ?new_rc)
    ))

  (:action spend_last_day_in_reykjavik)
    (:parameters (?a - agent ?prev_rc - reykjavik_count ?new_rc - reykjavik_count))
    (:precondition (and
      (at ?a reykjavik)
      (current_day d10)
      (has_spent_in_reykjavik ?prev_rc)
      (next_reykjavik_count ?prev_rc ?new_rc)
    ))
    (:effect (and
      (not (has_spent_in_reykjavik ?prev_rc))
      (has_spent_in_reykjavik ?new_rc)
    ))

  (:action spend_day_in_porto)
    (:parameters (?a - agent ?current_d - day ?next_d - day ?prev_pc - porto_count ?new_pc - porto_count))
    (:precondition (and
      (at ?a porto)
      (current_day ?current_d)
      (next_day ?current_d ?next_d)
      (not (current_day d9))
      (not (current_day d10))
      (has_spent_in_porto ?prev_pc)
      (next_porto_count ?prev_pc ?new_pc)
    ))
    (:effect (and
      (not (current_day ?current_d))
      (current_day ?next_d)
      (not (has_spent_in_porto ?prev_pc))
      (has_spent_in_porto ?new_pc)
    ))

  (:action spend_day_in_porto_on_day9)
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
    ))

  (:action spend_last_day_in_porto_on_day10)
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
    ))

  (:action spend_day_in_milan)
    (:parameters (?a - agent ?current_d - day ?next_d - day ?prev_mc - milan_count ?new_mc - milan_count))
    (:precondition (and
      (at ?a milan)
      (current_day ?current_d)
      (next_day ?current_d ?next_d)
      (has_spent_in_milan ?prev_mc)
      (next_milan_count ?prev_mc ?new_mc)
    ))
    (:effect (and
      (not (current_day ?current_d))
      (current_day ?next_d)
      (not (has_spent_in_milan ?prev_mc))
      (has_spent_in_milan ?new_mc)
    ))

  (:action spend_last_day_in_milan)
    (:parameters (?a - agent ?prev_mc - milan_count ?new_mc - milan_count))
    (:precondition (and
      (at ?a milan)
      (current_day d10)
      (has_spent_in_milan ?prev_mc)
      (next_milan_count ?prev_mc ?new_mc)
    ))
    (:effect (and
      (not (has_spent_in_milan ?prev_mc))
      (has_spent_in_milan ?new_mc)
    ))

  (:action advance_day_idle)
    (:parameters (?a - agent ?c - city ?current_d - day ?next_d - day))
    (:precondition (and
      (at ?a ?c)
      (current_day ?current_d)
      (next_day ?current_d ?next_d)
      ; This action can be taken if no specific city-day-counting action is needed for current city.
    ))
    (:effect (and
      (not (current_day ?current_d))
      (current_day ?next_d)
    ))

  (:action advance_last_day_idle)
    (:parameters (?a - agent ?c - city))
    (:precondition (and
      (at ?a ?c)
      (current_day d10)
    ))
    (:effect (and
      ; No state change on current_day or counts, just marks that day 10 passed.
    ))
)