(define (domain travel-meeting-coordinated)
  (:requirements :typing :fluents :negative-preconditions :strips :numeric-fluents)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person ?with - person)
    (available-met ?p - person ?l - location)
  )

  (:functions
    (time) ; minutes since midnight, global clock
  )

  ;; Traveler travel actions (keep distinct actions for traveler)
  (:action travel-bayview-to-ggp
    :parameters ()
    :precondition (at traveler bayview)
    :effect (and
              (not (at traveler bayview))
              (at traveler golden-gate-park)
              (increase (time) 22)
            )
  )

  (:action travel-ggp-to-bayview
    :parameters ()
    :precondition (at traveler golden-gate-park)
    :effect (and
              (not (at traveler golden-gate-park))
              (at traveler bayview)
              (increase (time) 23)
            )
  )

  ;; Barbara's availability action (distinct action belonging to Barbara).
  ;; This is instantaneous (does not consume meeting time) and marks that Barbara
  ;; has committed to be available at the location for a meeting of the required length.
  ;; It is only applicable if there is room in Barbara's availability window for a 90-minute meeting.
  (:action barbara-be-available-90
    :parameters ()
    :precondition (and
                    (at barbara golden-gate-park)
                    (>= (time) 480)                ;; cannot start before 08:00
                    (<= (+ (time) 90) 690)         ;; must finish by 11:30
                  )
    :effect (and
              (available-met barbara golden-gate-park)
            )
  )

  ;; Joint meeting action: requires both at Golden Gate Park and respects Barbara's window.
  ;; Consumes 90 minutes and achieves the meeting goal (met).
  (:action meet-barbara
    :parameters ()
    :precondition (and
                    (at traveler golden-gate-park)
                    (at barbara golden-gate-park)
                    (available-met barbara golden-gate-park) ;; Barbara has committed to be available
                    (>= (time) 480)                ;; start no earlier than Barbara's availability start
                    (<= (+ (time) 90) 690)        ;; meeting must finish by Barbara's end time
                    (not (met traveler barbara))
                  )
    :effect (and
              (met traveler barbara)
              (not (available-met barbara golden-gate-park))
              (increase (time) 90)
            )
  )
)