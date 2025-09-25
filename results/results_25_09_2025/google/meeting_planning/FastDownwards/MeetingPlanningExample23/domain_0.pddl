(define (domain meeting-schedule)
  (:requirements :strips :typing :fluents :negative-preconditions :numeric-fluents :timed-initial-literals)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)
  )
  (:functions
    (time) ; global clock in minutes since 00:00
  )

  ;; Traveler actions (explicitly named for the traveler agent)
  (:action travel-traveler-bayview-to-russianhill
    :parameters ()
    :precondition (and (at traveler Bayview))
    :effect (and
              (not (at traveler Bayview))
              (at traveler RussianHill)
              (increase (time) 23)
            )
  )

  (:action travel-traveler-russianhill-to-bayview
    :parameters ()
    :precondition (and (at traveler RussianHill))
    :effect (and
              (not (at traveler RussianHill))
              (at traveler Bayview)
              (increase (time) 23)
            )
  )

  ;; John's actions (kept distinct and explicit; John is modeled as available at RussianHill
  ;; during the known window and can travel if needed)
  (:action travel-john-russianhill-to-bayview
    :parameters ()
    :precondition (and (at john RussianHill))
    :effect (and
              (not (at john RussianHill))
              (at john Bayview)
              (increase (time) 23)
            )
  )

  (:action travel-john-bayview-to-russianhill
    :parameters ()
    :precondition (and (at john Bayview))
    :effect (and
              (not (at john Bayview))
              (at john RussianHill)
              (increase (time) 23)
            )
  )

  ;; Meeting action (initiated by the traveler). Requires both agents at the same location
  ;; and the meeting to start and finish inside John's availability window.
  ;; Numeric constants in minutes:
  ;;   Traveler arrives at Bayview at 09:00 -> 540
  ;;   John's availability window: 17:30 (1050) .. 21:00 (1260)
  ;;   Required meeting duration: 75 minutes
  (:action traveler-meet-john
    :parameters ()
    :precondition (and
                    (at traveler RussianHill)
                    (at john RussianHill)
                    (not (met))
                    (>= (time) 1050)                           ; meeting cannot start before John arrives
                    (<= (+ (time) 75) 1260)                   ; meeting must finish by John's end time
                  )
    :effect (and
              (met)
              (increase (time) 75)
            )
  )
)