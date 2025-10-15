(define (domain multiagent-travel)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person)
  )

  (:functions
    (time) ; minutes after midnight
  )

  ;; Traveler actions (distinct)
  (:action travel-northbeach-to-alamosquare
    :parameters ()
    :precondition (and (at traveler north-beach))
    :effect (and
              (not (at traveler north-beach))
              (at traveler alamo-square)
              (increase (time) 16)
            )
  )

  (:action travel-alamosquare-to-northbeach
    :parameters ()
    :precondition (and (at traveler alamo-square))
    :effect (and
              (not (at traveler alamo-square))
              (at traveler north-beach)
              (increase (time) 15)
            )
  )

  ;; Meeting action (represents the joint meeting with Barbara)
  ;; Must start at or after 18:00 (1080) and finish by 21:30 (1290).
  ;; Meeting duration fixed at the minimum required 90 minutes.
  (:action meet-barbara-at-alamosquare
    :parameters ()
    :precondition (and
                    (at traveler alamo-square)
                    (at barbara alamo-square)
                    (not (met barbara))
                    (>= (time) 1080)
                    (<= (+ (time) 90) 1290)
                  )
    :effect (and
              (met barbara)
              (increase (time) 90)
            )
  )
)