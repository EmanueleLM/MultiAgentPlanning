(define (domain meet-domain)
  (:requirements :typing :fluents)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (available ?a - agent)
    (met)
  )
  (:functions
    (time) ; current clock in minutes since midnight
  )

  ;; You (agent "you") actions
  (:action wait_to_1013_you
    :parameters ()
    :precondition (and
      (at you Richmond)
      (<= (time) 1013)  ; 1013 = 16:53, chosen so travel 22 min arrives at 1035
    )
    :effect (and
      (assign (time) 1013)
    )
  )

  (:action travel_you_richmond_to_financial
    :parameters ()
    :precondition (and
      (at you Richmond)
    )
    :effect (and
      (not (at you Richmond))
      (at you Financial)
      (increase (time) 22) ; travel time RD -> FD
    )
  )

  (:action travel_you_financial_to_richmond
    :parameters ()
    :precondition (and
      (at you Financial)
    )
    :effect (and
      (not (at you Financial))
      (at you Richmond)
      (increase (time) 21) ; travel time FD -> RD
    )
  )

  (:action you_meet_betty
    :parameters ()
    :precondition (and
      (at you Financial)
      (at betty Financial)
      (available betty)
    )
    :effect (and
      (met)
      (increase (time) 60) ; meeting lasts at least 60 minutes
    )
  )

  ;; Betty (agent "betty") actions
  (:action betty_become_available
    :parameters ()
    :precondition (and
      (>= (time) 1035) ; 1035 = 17:15, Betty's availability window starts
    )
    :effect (and
      (available betty)
      (at betty Financial) ; Betty will be at Financial District during availability
    )
  )

  ;; (Optional) end availability action (not required to achieve the goal but models end)
  (:action betty_end_availability
    :parameters ()
    :precondition (and
      (>= (time) 1305) ; 1305 = 21:45, end of Betty's availability window
      (available betty)
    )
    :effect (and
      (not (available betty))
    )
  )
)