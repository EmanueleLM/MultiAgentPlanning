(define (domain sf_meet_betty_classical)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)

  (:predicates
    (at-richmond)
    (at-financial)
  )

  (:functions
    (time)
    (met-betty)
    (total-cost)
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
      (increase (total-cost) 1)
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
      (increase (total-cost) 1)
    )
  )

  (:action wait-5
    :effect (and
      (increase (time) 5)
      (increase (total-cost) 1)
    )
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
      (increase (total-cost) 0)
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
      (increase (total-cost) 0)
    )
  )
)