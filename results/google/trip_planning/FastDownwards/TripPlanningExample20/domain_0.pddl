(define (domain trip-domain)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day agent)

  (:predicates
    (at ?c - city)                         ; traveler currently at city ?c
    (free-day ?d - day)                   ; day ?d is still free (not yet assigned to a stay)
    (stayed ?c - city ?d - day)           ; day ?d was spent staying in city ?c
  )

  ;; Stay actions (one-day stay consumes a free day). Each agent is kept distinct by action naming.
  (:action stay_dubrovnik_by_dubrovnik_agent
    :parameters (?d - day)
    :precondition (and (at dubrovnik) (free-day ?d))
    :effect (and (stayed dubrovnik ?d) (not (free-day ?d)))
  )

  (:action stay_istanbul_by_istanbul_agent
    :parameters (?d - day)
    :precondition (and (at istanbul) (free-day ?d))
    :effect (and (stayed istanbul ?d) (not (free-day ?d)))
  )

  (:action stay_budapest_by_budapest_agent
    :parameters (?d - day)
    :precondition (and (at budapest) (free-day ?d))
    :effect (and (stayed budapest ?d) (not (free-day ?d)))
  )

  ;; Flight actions; direct flights only, agent-role distinct in action name.
  ;; Dubrovnik -> Istanbul (direct flight available as given)
  (:action fly_dubrovnik_to_istanbul_by_dubrovnik_agent
    :parameters ()
    :precondition (and
      (at dubrovnik)
      ;; require Dubrovnik's hard-preference stays to be completed before departing
      (stayed dubrovnik day1)
      (stayed dubrovnik day2)
      (stayed dubrovnik day3)
    )
    :effect (and (not (at dubrovnik)) (at istanbul))
  )

  ;; Istanbul -> Budapest (direct flight between Istanbul and Budapest)
  (:action fly_istanbul_to_budapest_by_istanbul_agent
    :parameters ()
    :precondition (and
      (at istanbul)
      ;; require Istanbul's hard-preference stays to be completed before departing
      (stayed istanbul day4)
      (stayed istanbul day5)
      (stayed istanbul day6)
      (stayed istanbul day7)
      (stayed istanbul day8)
    )
    :effect (and (not (at istanbul)) (at budapest))
  )

  ;; (Optional) Budapest -> Istanbul flight defined for completeness (direct connection exists)
  (:action fly_budapest_to_istanbul_by_budapest_agent
    :parameters ()
    :precondition (and
      (at budapest)
      ;; If used, require Budapest's hard-preference stays to be completed before returning
      (stayed budapest day7)
      (stayed budapest day8)
      (stayed budapest day9)
      (stayed budapest day10)
      (stayed budapest day11)
      (stayed budapest day12)
    )
    :effect (and (not (at budapest)) (at istanbul))
  )
)