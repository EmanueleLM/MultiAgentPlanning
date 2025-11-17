(define (domain meet-andrew)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
  (:types location)

  (:predicates
    (at ?l - location)
    (met-andrew)
  )

  (:functions
    (time)        ; minutes since midnight
    (total-cost)  ; cost to minimize (accumulates waiting/travel time)
  )

  ;; Wait actions (increment time and cost by fixed amounts; usable at any location)
  (:action wait_60
    :parameters (?loc - location)
    :precondition (at ?loc)
    :effect (and
              (increase (time) 60)
              (increase (total-cost) 60)
            )
  )

  (:action wait_30
    :parameters (?loc - location)
    :precondition (at ?loc)
    :effect (and
              (increase (time) 30)
              (increase (total-cost) 30)
            )
  )

  (:action wait_15
    :parameters (?loc - location)
    :precondition (at ?loc)
    :effect (and
              (increase (time) 15)
              (increase (total-cost) 15)
            )
  )

  (:action wait_8
    :parameters (?loc - location)
    :precondition (at ?loc)
    :effect (and
              (increase (time) 8)
              (increase (total-cost) 8)
            )
  )

  ;; Travel actions (advance time by travel duration and charge cost equal to travel time)
  (:action travel_presidio_union
    :precondition (at presidio)
    :effect (and
              (not (at presidio)) (at union_square)
              (increase (time) 22)
              (increase (total-cost) 22)
            )
  )

  (:action travel_union_presidio
    :precondition (at union_square)
    :effect (and
              (not (at union_square)) (at presidio)
              (increase (time) 24)
              (increase (total-cost) 24)
            )
  )

  ;; Meeting action: must start within Andrew's availability window (11:15 == 675) and no later than 930
  ;; Meeting takes 105 minutes and does NOT increase total-cost (meeting time isn't penalized)
  (:action meet_andrew_105
    :precondition (and
                    (at union_square)
                    (>= (time) 675)
                    (<= (time) 930)
                  )
    :effect (and
              (met-andrew)
              (increase (time) 105)
            )
  )
)