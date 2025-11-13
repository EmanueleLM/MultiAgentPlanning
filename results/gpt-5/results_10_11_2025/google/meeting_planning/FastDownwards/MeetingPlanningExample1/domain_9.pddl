(define (domain sf_meet_betty_numeric)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents)
  (:predicates
    (at-richmond)
    (at-financial)
  )
  (:functions
    (time)
    (met-betty)
  )

  (:action travel-richmond-financial
    :precondition (and
      (at-richmond)
      (not (at-financial))
    )
    :effect (and
      (not (at-richmond))
      (at-financial)
      (increase (time) 22)
    )
  )

  (:action travel-financial-richmond
    :precondition (and
      (at-financial)
      (not (at-richmond))
    )
    :effect (and
      (not (at-financial))
      (at-richmond)
      (increase (time) 21)
    )
  )

  (:action wait-5
    :precondition (and)
    :effect (increase (time) 5)
  )

  (:action meet-betty-60
    :precondition (and
      (at-financial)
      (>= (time) 1035)
      (<= (time) 1245)
    )
    :effect (and
      (increase (time) 60)
      (increase (met-betty) 60)
    )
  )

  (:action meet-betty-15
    :precondition (and
      (at-financial)
      (>= (time) 1035)
      (<= (time) 1290)
    )
    :effect (and
      (increase (time) 15)
      (increase (met-betty) 15)
    )
  )
)