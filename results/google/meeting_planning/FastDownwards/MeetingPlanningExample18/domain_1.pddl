(define (domain multiagent-meet)
  (:types location)

  (:predicates
    (at-traveler ?l - location)
  )

  (:functions
    (time)            ; minutes since midnight
    (met-minutes)     ; accumulated minutes traveler met Betty
  )

  ;; Traveler actions (distinct namespace)
  (:action traveler-move-m2r
    :parameters ()
    :precondition (and (at-traveler marina))
    :effect (and
      (not (at-traveler marina))
      (at-traveler richmond)
      (increase (time) 11)
    )
  )

  (:action traveler-move-r2m
    :parameters ()
    :precondition (and (at-traveler richmond))
    :effect (and
      (not (at-traveler richmond))
      (at-traveler marina)
      (increase (time) 9)
    )
  )

  ;; Traveler can wait one minute (to advance time until Betty is available)
  (:action traveler-wait-1min
    :parameters ()
    :precondition ()
    :effect (and
      (increase (time) 1)
    )
  )

  ;; Traveler meets Betty for one minute while both are at Richmond and within Betty's window.
  ;; Preconditions enforce meeting only when Betty is present (20:30-22:00 -> 1230 to 1320 minutes).
  (:action traveler-meet-1min-with-betty
    :parameters ()
    :precondition (and
      (at-traveler richmond)
      (>= (time) 1230)
      (<= (+ (time) 1) 1320)
    )
    :effect (and
      (increase (time) 1)
      (increase (met-minutes) 1)
    )
  )

  ;; Betty actions (distinct namespace). Betty may also advance time if needed.
  ;; These are provided to keep agent actions distinct; meeting relies on numeric time window.
  (:action betty-wait-1min
    :parameters ()
    :precondition ()
    :effect (and
      (increase (time) 1)
    )
  )

)