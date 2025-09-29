(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions :equality :fluents)
  (:types agent location)
  (:predicates
    (at-traveler ?l - location)
    (at-sandra ?l - location)
    (met-sandra)
  )
  (:functions
    (current-time)
    (meetings-achieved)
    (total-meeting-time)
  )

  ;; Travel actions with fixed durations
  (:action travel-traveler-marina-chinatown
    :parameters ()
    :precondition (and (at-traveler marina))
    :effect (and
      (not (at-traveler marina))
      (at-traveler chinatown)
      (increase (current-time) 16)
    )
  )

  (:action travel-traveler-chinatown-marina
    :parameters ()
    :precondition (and (at-traveler chinatown))
    :effect (and
      (not (at-traveler chinatown))
      (at-traveler marina)
      (increase (current-time) 12)
    )
  )

  ;; Short meeting of minimum duration 15 minutes
  (:action meet-traveler-sandra-15
    :parameters (?loc - location)
    :precondition (and
      (at-traveler ?loc)
      (at-sandra ?loc)
      (not (met-sandra))
      (>= (current-time) 540)                         ;; availability window start 09:00 = 540
      (<= (+ (current-time) 15) 705)                 ;; ensure at least 15 minutes before Sandra's end 11:45 = 705
    )
    :effect (and
      (met-sandra)
      (increase (current-time) 15)
      (increase (total-meeting-time) 15)
      (increase (meetings-achieved) 1)
    )
  )

  ;; Meet until Sandra's availability end (consume remaining available time, requires at least 15 minutes remaining)
  (:action meet-traveler-sandra-until-end
    :parameters (?loc - location)
    :precondition (and
      (at-traveler ?loc)
      (at-sandra ?loc)
      (not (met-sandra))
      (>= (current-time) 540)
      (< (current-time) 705)
      (>= (- 705 (current-time)) 15)
    )
    :effect (and
      (met-sandra)
      (increase (total-meeting-time) (- 705 (current-time)))
      (increase (meetings-achieved) 1)
      (increase (current-time) (- 705 (current-time)))
    )
  )
)