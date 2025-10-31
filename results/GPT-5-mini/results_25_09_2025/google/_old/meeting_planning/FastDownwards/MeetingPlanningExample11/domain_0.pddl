(define (domain multiagent-meeting)
  (:requirements :typing :negative-preconditions :fluents :numeric-fluents)
  (:types location)

  (:predicates
    ;; separate location predicates for the two agents so their actions remain distinct
    (at-vis ?l - location)
    (at-other ?l - location)
    (met-carol)
  )

  (:functions
    (time)                       ; global time in minutes since midnight
    (travel-nh-sd)               ; Nob Hill -> Sunset travel time (minutes)
    (travel-sd-nh)               ; Sunset -> Nob Hill travel time (minutes)
    (carol-available-start)      ; Carol availability window start (minutes since midnight)
    (carol-available-end)        ; Carol availability window end (minutes since midnight)
  )

  ;; Visitor's travel actions (kept distinct with visitor- prefix)
  (:action visitor-travel-nobhill-to-sunset
    :parameters ()
    :precondition (at-vis nob-hill)
    :effect (and
      (not (at-vis nob-hill))
      (at-vis sunset-district)
      (increase (time) (travel-nh-sd))
    )
  )

  (:action visitor-travel-sunset-to-nobhill
    :parameters ()
    :precondition (at-vis sunset-district)
    :effect (and
      (not (at-vis sunset-district))
      (at-vis nob-hill)
      (increase (time) (travel-sd-nh))
    )
  )

  ;; Other agent's travel actions (kept distinct with other- prefix)
  (:action other-travel-nobhill-to-sunset
    :parameters ()
    :precondition (at-other nob-hill)
    :effect (and
      (not (at-other nob-hill))
      (at-other sunset-district)
      (increase (time) (travel-nh-sd))
    )
  )

  (:action other-travel-sunset-to-nobhill
    :parameters ()
    :precondition (at-other sunset-district)
    :effect (and
      (not (at-other sunset-district))
      (at-other nob-hill)
      (increase (time) (travel-sd-nh))
    )
  )

  ;; Small 1-minute wait actions so the planner can advance time to reach Carol's availability
  (:action visitor-wait-1
    :parameters ()
    :precondition ()
    :effect (and
      (increase (time) 1)
    )
  )

  (:action other-wait-1
    :parameters ()
    :precondition ()
    :effect (and
      (increase (time) 1)
    )
  )

  ;; Joint meeting action: requires both agents at Sunset District and Carol available
  ;; Enforces the 75-minute minimum meeting duration and that the meeting fits into Carol's window.
  (:action meet-carol
    :parameters ()
    :precondition (and
      (at-vis sunset-district)
      (at-other sunset-district)
      (>= (time) (carol-available-start))
      (<= (+ (time) 75) (carol-available-end))
    )
    :effect (and
      (met-carol)
      (increase (time) 75)
    )
  )
)