(define (domain meeting-scheduling)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (met)
  )

  (:functions
    (time)        ; global time in minutes from midnight
    (mary-from)   ; Mary's available-from time (minutes)
    (mary-to)     ; Mary's available-to time (minutes)
  )

  ;; Visitor actions (visitor-prefixed)
  (:action visitor-prepare-travel
    :parameters ()
    :precondition (and
      (at visitor Nob_Hill)
      (<= (time) (- (mary-from) 11))   ; can prepare so travel will arrive by mary-from
    )
    :effect (and
      (assign (time) (- (mary-from) 11)) ; jump forward in time to departure time
    )
  )

  (:action visitor-travel-nobhill-to-marina
    :parameters ()
    :precondition (and
      (at visitor Nob_Hill)
    )
    :effect (and
      (not (at visitor Nob_Hill))
      (at visitor Marina_District)
      (increase (time) 11) ; travel time Nob_Hill -> Marina_District = 11 minutes
    )
  )

  ;; Mary actions (mary-prefixed)
  ;; Mary can advance global time to her availability window start if needed.
  (:action mary-wait-until-available
    :parameters ()
    :precondition (and
      (at mary Marina_District)
      (<= (time) (mary-from))
    )
    :effect (and
      (assign (time) (mary-from))
    )
  )

  ;; Meeting action: requires both at Marina_District and fits within Mary's window.
  ;; This is written as a visitor-initiated meeting action but requires Mary's presence
  ;; and the numeric time window to be satisfied.
  (:action visitor-meet-mary
    :parameters ()
    :precondition (and
      (at visitor Marina_District)
      (at mary Marina_District)
      (>= (time) (mary-from))                         ; meeting can start no earlier than mary-from
      (<= (+ (time) 120) (mary-to))                   ; meeting of 120 minutes must finish by mary-to
    )
    :effect (and
      (increase (time) 120)   ; meeting duration 120 minutes
      (met)
    )
  )
)