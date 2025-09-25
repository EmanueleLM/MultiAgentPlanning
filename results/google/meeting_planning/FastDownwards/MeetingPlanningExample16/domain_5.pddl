(define (domain visitor-ronald-meet-classical)
  (:requirements :strips :typing)
  (:types agent location time)
  (:constants visitor ronald - agent chinatown russian_hill - location t0 t7 t375 t382 t480 t487 - time)
  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - time)
    (ronald-present ?t - time)
    (met-ronald)
    (next ?t1 ?t2 - time)
  )

  (:action visitor-travel-c2r-from-t0
    :parameters ()
    :precondition (and (current-time t0) (at visitor chinatown) (next t0 t7))
    :effect (and
      (not (at visitor chinatown))
      (at visitor russian_hill)
      (not (current-time t0))
      (current-time t7)
    )
  )

  (:action visitor-wait-t7-to-t375
    :parameters ()
    :precondition (and (current-time t7) (next t7 t375))
    :effect (and
      (not (current-time t7))
      (current-time t375)
    )
  )

  (:action visitor-wait-t0-to-t375
    :parameters ()
    :precondition (and (current-time t0) (next t0 t375))
    :effect (and
      (not (current-time t0))
      (current-time t375)
    )
  )

  (:action visitor-travel-c2r-from-t375
    :parameters ()
    :precondition (and (current-time t375) (at visitor chinatown) (next t375 t382))
    :effect (and
      (not (at visitor chinatown))
      (at visitor russian_hill)
      (not (current-time t375))
      (current-time t382)
    )
  )

  (:action visitor-meet-ronald-at-375
    :parameters ()
    :precondition (and (current-time t375) (at visitor russian_hill) (ronald-present t375) (ronald-present t480) (next t375 t480))
    :effect (and
      (met-ronald)
      (not (current-time t375))
      (current-time t480)
    )
  )

  (:action visitor-meet-ronald-at-382
    :parameters ()
    :precondition (and (current-time t382) (at visitor russian_hill) (ronald-present t382) (ronald-present t487) (next t382 t487))
    :effect (and
      (met-ronald)
      (not (current-time t382))
      (current-time t487)
    )
  )
)