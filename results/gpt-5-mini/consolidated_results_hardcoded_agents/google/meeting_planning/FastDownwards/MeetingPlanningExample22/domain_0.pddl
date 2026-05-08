(define (domain meet-andrew)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
  (:types location)
  (:predicates
    (at ?l - location)
    (met-andrew)
  )
  (:functions
    (time)       ; minutes from midnight
    (total-cost) ; accumulated cost to minimize
  )

  ; Wait actions: parameterized by current location so waiting is explicitly tied to presence
  (:action wait_60
    :parameters (?loc - location)
    :precondition (and (at ?loc))
    :effect (and
              (increase (time) 60)
              (increase (total-cost) 60)
            )
  )

  (:action wait_30
    :parameters (?loc - location)
    :precondition (and (at ?loc))
    :effect (and
              (increase (time) 30)
              (increase (total-cost) 30)
            )
  )

  (:action wait_15
    :parameters (?loc - location)
    :precondition (and (at ?loc))
    :effect (and
              (increase (time) 15)
              (increase (total-cost) 15)
            )
  )

  (:action wait_8
    :parameters (?loc - location)
    :precondition (and (at ?loc))
    :effect (and
              (increase (time) 8)
              (increase (total-cost) 8)
            )
  )

  ; Travel actions (fixed travel times and costs)
  (:action travel_presidio_union
    :precondition (and (at presidio) (not (at union_square)))
    :effect (and
              (not (at presidio))
              (at union_square)
              (increase (time) 22)
              (increase (total-cost) 22)
            )
  )

  (:action travel_union_presidio
    :precondition (and (at union_square) (not (at presidio)))
    :effect (and
              (not (at union_square))
              (at presidio)
              (increase (time) 24)
              (increase (total-cost) 24)
            )
  )

  ; Single contiguous meeting action of exactly 105 minutes.
  ; Precondition enforces meeting starts within Andrew's availability [675,1035-105]=[675,930]
  (:action meet_andrew_105
    :precondition (and (at union_square)
                       (>= (time) 675)
                       (<= (time) 930))
    :effect (and
              (met-andrew)
              (increase (time) 105)
              ; meeting itself does not add travel/wait cost; objective already accounts for wait/travel
              (increase (total-cost) 0)
            )
  )
)