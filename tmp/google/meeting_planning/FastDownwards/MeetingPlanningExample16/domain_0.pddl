(define (domain coordinated-meetings)
  (:requirements :strips :typing :fluents :negative-preconditions :numeric-fluents)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
  )

  (:functions
    (time)    ; minutes since 09:00 (global shared clock). 09:00 -> 0
    (met)     ; accumulated minutes that the visitor has met Ronald (shared)
  )

  ;; ---------------------------
  ;; Visitor actions (distinct)
  ;; ---------------------------

  ;; Visitor: Chinatown -> Russian Hill (7 minutes)
  (:action travel-visitor-chinatown-to-russian
    :parameters ()
    :precondition (at visitor chinatown)
    :effect (and
      (not (at visitor chinatown))
      (at visitor russian-hill)
      (increase (time) 7)
    )
  )

  ;; Visitor: Russian Hill -> Chinatown (9 minutes)
  (:action travel-visitor-russian-to-chinatown
    :parameters ()
    :precondition (at visitor russian-hill)
    :effect (and
      (not (at visitor russian-hill))
      (at visitor chinatown)
      (increase (time) 9)
    )
  )

  ;; Visitor: wait 1 minute
  (:action wait-visitor-1
    :parameters ()
    :precondition ()
    :effect (increase (time) 1)
  )

  ;; Visitor: meet Ronald for exactly 105 minutes (requires both present at Russian Hill
  ;; and meeting entirely within Ronald's availability)
  (:action meet-visitor-105
    :parameters ()
    :precondition (and
      (at visitor russian-hill)
      (at ronald russian-hill)
      (>= (time) 375)                 ; 15:15 (since 09:00)
      (<= (+ (time) 105) 750)        ; end <= 21:30 (since 09:00)
    )
    :effect (and
      (increase (time) 105)
      (increase (met) 105)
    )
  )

  ;; ---------------------------
  ;; Ronald actions (distinct)
  ;; ---------------------------

  ;; Ronald: Chinatown -> Russian Hill (7 minutes)
  (:action travel-ronald-chinatown-to-russian
    :parameters ()
    :precondition (at ronald chinatown)
    :effect (and
      (not (at ronald chinatown))
      (at ronald russian-hill)
      (increase (time) 7)
    )
  )

  ;; Ronald: Russian Hill -> Chinatown (9 minutes)
  (:action travel-ronald-russian-to-chinatown
    :parameters ()
    :precondition (at ronald russian-hill)
    :effect (and
      (not (at ronald russian-hill))
      (at ronald chinatown)
      (increase (time) 9)
    )
  )

  ;; Ronald: wait actions (various block sizes to help reach availability)
  (:action wait-ronald-1
    :parameters ()
    :precondition ()
    :effect (increase (time) 1)
  )
  (:action wait-ronald-15
    :parameters ()
    :precondition ()
    :effect (increase (time) 15)
  )
  (:action wait-ronald-60
    :parameters ()
    :precondition ()
    :effect (increase (time) 60)
  )
  (:action wait-ronald-300
    :parameters ()
    :precondition ()
    :effect (increase (time) 300)
  )

  ;; Ronald: meeting blocks. Each requires both agents at Russian Hill and meeting entirely
  ;; within Ronald's availability (15:15..21:30 -> 375..750 since 09:00).
  ;; These are distinct actions (kept separate), but they all increase the same shared (met) function.
  (:action meet-ronald-105
    :parameters ()
    :precondition (and
      (at ronald russian-hill)
      (at visitor russian-hill)
      (>= (time) 375)
      (<= (+ (time) 105) 750)
    )
    :effect (and
      (increase (time) 105)
      (increase (met) 105)
    )
  )

  (:action meet-ronald-120
    :parameters ()
    :precondition (and
      (at ronald russian-hill)
      (at visitor russian-hill)
      (>= (time) 375)
      (<= (+ (time) 120) 750)
    )
    :effect (and
      (increase (time) 120)
      (increase (met) 120)
    )
  )

  (:action meet-ronald-150
    :parameters ()
    :precondition (and
      (at ronald russian-hill)
      (at visitor russian-hill)
      (>= (time) 375)
      (<= (+ (time) 150) 750)
    )
    :effect (and
      (increase (time) 150)
      (increase (met) 150)
    )
  )

  (:action meet-ronald-180
    :parameters ()
    :precondition (and
      (at ronald russian-hill)
      (at visitor russian-hill)
      (>= (time) 375)
      (<= (+ (time) 180) 750)
    )
    :effect (and
      (increase (time) 180)
      (increase (met) 180)
    )
  )

  (:action meet-ronald-240
    :parameters ()
    :precondition (and
      (at ronald russian-hill)
      (at visitor russian-hill)
      (>= (time) 375)
      (<= (+ (time) 240) 750)
    )
    :effect (and
      (increase (time) 240)
      (increase (met) 240)
    )
  )

  (:action meet-ronald-375
    :parameters ()
    :precondition (and
      (at ronald russian-hill)
      (at visitor russian-hill)
      (>= (time) 375)
      (<= (+ (time) 375) 750)
    )
    :effect (and
      (increase (time) 375)
      (increase (met) 375)
    )
  )

)