(define (domain sf_meetings_classical)
  (:requirements :typing :strips :adl :negative-preconditions :action-costs)
  (:types agent location)

  (:constants
    traveler jeffrey - agent
    the_castro golden_gate_park - location
  )

  (:predicates
    (at ?a - agent ?l - location)
    (met ?x - agent ?y - agent)
    (meeting-possible)
    (finished)
  )

  (:functions (total-cost) (time))

  (:action travel-traveler-castro-to-ggp
    :parameters ()
    :precondition (at traveler the_castro)
    :effect (and
              (not (at traveler the_castro))
              (at traveler golden_gate_park)
              (increase (time) 11)
            )
  )

  (:action travel-traveler-ggp-to-castro
    :parameters ()
    :precondition (at traveler golden_gate_park)
    :effect (and
              (not (at traveler golden_gate_park))
              (at traveler the_castro)
              (increase (time) 13)
            )
  )

  (:action travel-jeffrey-castro-to-ggp
    :parameters ()
    :precondition (at jeffrey the_castro)
    :effect (and
              (not (at jeffrey the_castro))
              (at jeffrey golden_gate_park)
              (increase (time) 11)
            )
  )

  (:action travel-jeffrey-ggp-to-castro
    :parameters ()
    :precondition (at jeffrey golden_gate_park)
    :effect (and
              (not (at jeffrey golden_gate_park))
              (at jeffrey the_castro)
              (increase (time) 13)
            )
  )

  (:action meet-traveler-jeffrey-at-ggp
    :parameters ()
    :precondition (and
                    (at traveler golden_gate_park)
                    (at jeffrey golden_gate_park)
                    (meeting-possible)
                    (not (met traveler jeffrey))
                    (>= (time) 540)
                    (<= (+ (time) 105) 1050)
                  )
    :effect (and
              (met traveler jeffrey)
              (increase (time) 105)
            )
  )

  (:action finish-with-meeting
    :parameters ()
    :precondition (met traveler jeffrey)
    :effect (finished)
  )

  (:action finish-without-meeting
    :parameters ()
    :precondition (not (met traveler jeffrey))
    :effect (and (finished) (increase (total-cost) 1))
  )
)