(define (domain meet-friends)
  ;; Requirements for numeric fluents and negative preconditions
  (:requirements :strips :negative-preconditions :fluents :typing)
  (:predicates
    (at ?person - object ?loc - object)
    (met ?person - object)
  )
  (:functions
    (time)           ; current time in minutes after midnight
    (met-count)      ; number of friends met (to maximize)
    (anthony-start)  ; Anthony availability start (minutes)
    (anthony-end)    ; Anthony availability end (minutes)
  )

  ;; Travel actions (explicit, discrete time increments via increase to (time))
  (:action travel-nobhill-to-alamo
    :parameters ()
    :precondition (and
      (at traveler NobHill)
    )
    :effect (and
      (not (at traveler NobHill))
      (at traveler AlamoSquare)
      (increase (time) 11)
    )
  )

  (:action travel-alamo-to-nobhill
    :parameters ()
    :precondition (and
      (at traveler AlamoSquare)
    )
    :effect (and
      (not (at traveler AlamoSquare))
      (at traveler NobHill)
      (increase (time) 11)
    )
  )

  ;; Meeting action: meet Anthony for the required minimum duration (15 minutes)
  (:action meet-anthony
    :parameters ()
    :precondition (and
      (at traveler AlamoSquare)
      (at anthony AlamoSquare)
      (not (met anthony))
      (>= (time) (anthony-start))
      (<= (+ (time) 15) (anthony-end)) ;; ensures meeting of full 15 minutes finishes within Anthony's window
    )
    :effect (and
      (met anthony)
      (increase (met-count) 1)
      (increase (time) 15)
    )
  )

  ;; Objective: maximize number of friends met
  (:metric maximize (met-count))
)