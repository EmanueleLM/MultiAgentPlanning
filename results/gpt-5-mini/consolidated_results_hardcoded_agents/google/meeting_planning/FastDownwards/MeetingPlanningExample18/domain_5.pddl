(define (domain meetingplanningexample18-domain)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
  (:types location)
  (:predicates
    (at ?l - location)
    (met-betty)
  )
  (:functions
    (current-time)   ; minutes since 00:00
    (total-cost)
    (betty-start)
    (betty-end)
  )

  ;; travel from Marina to Richmond: takes 11 minutes and costs 11
  (:action travel-marina-to-richmond
    :parameters ()
    :precondition (and
      (at marina)
    )
    :effect (and
      (not (at marina))
      (at richmond)
      (increase (current-time) 11)
      (increase (total-cost) 11)
    )
  )

  ;; travel from Richmond to Marina: takes 9 minutes and costs 9
  (:action travel-richmond-to-marina
    :parameters ()
    :precondition (and
      (at richmond)
    )
    :effect (and
      (not (at richmond))
      (at marina)
      (increase (current-time) 9)
      (increase (total-cost) 9)
    )
  )

  ;; fast "wait" that advances time to Betty's window start (useful instead of enumerating many time points)
  (:action wait-to-betty-start
    :parameters ()
    :precondition (and
      (< (current-time) (betty-start))
    )
    :effect (and
      (assign (current-time) (betty-start))
    )
  )

  ;; meet Betty for a continuous 75 minutes entirely inside her availability window
  (:action meet-betty-75
    :parameters ()
    :precondition (and
      (at richmond)
      (>= (current-time) (betty-start))
      (<= (+ (current-time) 75) (betty-end))
    )
    :effect (and
      (met-betty)
      (increase (current-time) 75)
    )
  )
)