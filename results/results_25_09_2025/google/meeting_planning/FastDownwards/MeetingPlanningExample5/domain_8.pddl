(define (domain meeting-orchestration)
  (:requirements :typing :fluents :negative-preconditions :equality)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (meeting-scheduled)
  )
  (:functions
    (total-time) ; minutes since 09:00
  )

  (:action travel-nobhill-to-castro
    :parameters ()
    :precondition (and (at visitor nobhill))
    :effect (and
      (not (at visitor nobhill))
      (at visitor thecastro)
      (increase (total-time) 17)
    )
  )

  (:action travel-castro-to-nobhill
    :parameters ()
    :precondition (and (at visitor thecastro))
    :effect (and
      (not (at visitor thecastro))
      (at visitor nobhill)
      (increase (total-time) 16)
    )
  )

  ;; Action to advance time to William's availability window start (12:15 = 195 minutes after 09:00)
  (:action wait-to-195
    :parameters ()
    :precondition (and (<= (total-time) 195))
    :effect (and
      (assign (total-time) 195)
    )
  )

  ;; Schedule a meeting of 75 minutes. Requires both at The Castro, current time within William's availability window.
  ;; William's availability: from 195 (12:15) up to 780 (22:00) minutes after 09:00.
  (:action start-meeting-william
    :parameters ()
    :precondition (and
      (at visitor thecastro)
      (at william thecastro)
      (>= (total-time) 195)
      (<= (+ (total-time) 75) 780)
    )
    :effect (and
      (increase (total-time) 75)
      (meeting-scheduled)
    )
  )
)