(define (domain meetingplanningexample18-domain)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types location)

  (:predicates
    (at ?l - location)
    (met-betty)
  )

  (:functions
    (time)        ; current time in minutes since midnight
    (total-cost)  ; accumulated travel cost (minutes)
  )

  ;; wait one minute (can be repeated to advance time)
  (:action wait
    :parameters ()
    :precondition ()
    :effect (and
      (increase (time) 1)
    )
  )

  ;; travel from Marina to Richmond: consumes 11 minutes and costs 11
  (:action travel-marina-richmond
    :parameters ()
    :precondition (and
      (at marina)
    )
    :effect (and
      (not (at marina))
      (at richmond)
      (increase (time) 11)
      (increase (total-cost) 11)
    )
  )

  ;; travel from Richmond to Marina: consumes 9 minutes and costs 9
  (:action travel-richmond-marina
    :parameters ()
    :precondition (and
      (at richmond)
    )
    :effect (and
      (not (at richmond))
      (at marina)
      (increase (time) 9)
      (increase (total-cost) 9)
    )
  )

  ;; single continuous meeting with Betty: requires being at Richmond and starting
  ;; between 20:30 (1230) and latest-start 20:45 (1245) so that 75 minutes fit into 22:00 (1320).
  (:action meet-betty
    :parameters ()
    :precondition (and
      (at richmond)
      (>= (time) 1230)
      (<= (time) 1245)
    )
    :effect (and
      (met-betty)
      ;; meeting consumes 75 minutes of time
      (increase (time) 75)
    )
  )
)