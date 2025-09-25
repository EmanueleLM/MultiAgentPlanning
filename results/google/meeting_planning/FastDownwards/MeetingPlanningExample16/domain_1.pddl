(define (domain visitor-ronald-meet-classical)
  (:requirements :strips :typing :adl :fluents :action-costs)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - time)
    (ronald-present ?t - time)
    (met-ronald)
  )
  (:functions (total-cost))

  (:action visitor-travel-c2r-from-t0
    :parameters ()
    :precondition (and (current-time t0) (at visitor Chinatown))
    :effect (and
      (not (at visitor Chinatown))
      (at visitor RussianHill)
      (not (current-time t0))
      (current-time t7)
      (increase (total-cost) 7)
    )
  )

  (:action visitor-wait-t7-to-t375
    :parameters ()
    :precondition (and (current-time t7))
    :effect (and
      (not (current-time t7))
      (current-time t375)
      (increase (total-cost) 368)
    )
  )

  (:action visitor-wait-t0-to-t375
    :parameters ()
    :precondition (and (current-time t0))
    :effect (and
      (not (current-time t0))
      (current-time t375)
      (increase (total-cost) 375)
    )
  )

  (:action visitor-travel-c2r-from-t375
    :parameters ()
    :precondition (and (current-time t375) (at visitor Chinatown))
    :effect (and
      (not (at visitor Chinatown))
      (at visitor RussianHill)
      (not (current-time t375))
      (current-time t382)
      (increase (total-cost) 7)
    )
  )

  (:action visitor-meet-ronald-at-375
    :parameters ()
    :precondition (and (current-time t375) (at visitor RussianHill) (ronald-present t375) (ronald-present t480))
    :effect (and
      (met-ronald)
      (not (current-time t375))
      (current-time t480)
    )
  )

  (:action visitor-meet-ronald-at-382
    :parameters ()
    :precondition (and (current-time t382) (at visitor RussianHill) (ronald-present t382) (ronald-present t487))
    :effect (and
      (met-ronald)
      (not (current-time t382))
      (current-time t487)
    )
  )
)