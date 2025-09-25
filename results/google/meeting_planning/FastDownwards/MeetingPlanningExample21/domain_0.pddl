(define (domain meetings)
  (:requirements :strips :typing :fluents :negative-preconditions :equality)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (free ?a - agent)
    (met)  ; true once a meeting of required duration has occurred
  )

  (:functions
    (time)        ; current time in minutes since midnight
    (marg_start)  ; Margaret availability start (minutes since midnight)
    (marg_end)    ; Margaret availability end (minutes since midnight)
    (min_meet)    ; minimum meeting duration in minutes
  )

  ; Visitor-specific travel actions (kept distinct)
  (:action visitor-travel-md-to-haight
    :parameters ()
    :precondition (and (at visitor missiondistrict) (free visitor))
    :effect (and
              (not (at visitor missiondistrict))
              (at visitor haightashbury)
              (increase (time) 12)
            )
  )

  (:action visitor-travel-haight-to-md
    :parameters ()
    :precondition (and (at visitor haightashbury) (free visitor))
    :effect (and
              (not (at visitor haightashbury))
              (at visitor missiondistrict)
              (increase (time) 11)
            )
  )

  ; (Optional) Margaret travel actions (distinct from visitor)
  (:action margaret-travel-haight-to-md
    :parameters ()
    :precondition (and (at margaret haightashbury) (free margaret))
    :effect (and
              (not (at margaret haightashbury))
              (at margaret missiondistrict)
              (increase (time) 11)
            )
  )

  (:action margaret-travel-md-to-haight
    :parameters ()
    :precondition (and (at margaret missiondistrict) (free margaret))
    :effect (and
              (not (at margaret missiondistrict))
              (at margaret haightashbury)
              (increase (time) 12)
            )
  )

  ; Meeting action requires both agents at same location and enforces Margaret's availability window.
  ; This action represents a meeting of length = min_meet (the required minimum, 30).
  (:action meet-visitor-margaret
    :parameters (?loc - location)
    :precondition (and
                    (at visitor ?loc)
                    (at margaret ?loc)
                    (free visitor)
                    (free margaret)
                    (>= (time) (marg_start))
                    (<= (+ (time) (min_meet)) (marg_end))   ; ensures meeting will finish before Margaret leaves
                  )
    :effect (and
              (met)                       ; record that required meeting occurred
              (increase (time) (min_meet)) ; advance time by meeting duration
            )
  )
)