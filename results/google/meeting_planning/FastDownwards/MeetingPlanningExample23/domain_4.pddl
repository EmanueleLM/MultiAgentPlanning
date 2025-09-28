(define (domain bayview-scheduling-numeric)
  (:requirements :typing :negative-preconditions :fluents :adl :action-costs)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
    (route ?from - location ?to - location)
    (is-visitor ?p - person)
    (is-john ?p - person)
    (met-john)
  )

  (:functions
    (current-time)    ; minutes since 09:00
    (meetings)        ; number of completed meetings
    (total-travel)    ; accumulated travel minutes (cost)
  )

  (:action travel-visitor
    :parameters (?from - location ?to - location)
    :precondition (and
      (at visitor ?from)
      (route ?from ?to)
    )
    :effect (and
      (not (at visitor ?from))
      (at visitor ?to)
      (increase (current-time) 23)
      (increase (total-travel) 23)
    )
  )

  (:action wait-until-1730
    :parameters ()
    :precondition (<= (current-time) 510)
    :effect (and
      (assign (current-time) 510)
    )
  )

  (:action meet-visitor-with-john
    :parameters ()
    :precondition (and
      (at visitor russianhill)
      (at john russianhill)
      (>= (current-time) 510)           ; not earlier than 17:30
      (<= (current-time) 645)           ; start no later than 17:30+75=19:45 (to finish by 21:00)
      (<= (+ (current-time) 75) 720)    ; meeting end must be <= 21:00 (t720)
    )
    :effect (and
      (increase (current-time) 75)
      (increase (meetings) 1)
      (met-john)
    )
  )
)