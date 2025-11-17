(define (domain sf_meet_betty)
  (:requirements :strips :typing :negative-preconditions)
  (:types)

  (:predicates
    (at-richmond_district)
    (at-financial_district)
  )

  (:functions
    (time)
    (met-betty)
  )

  (:action travel-richmond-to-financial
    :parameters ()
    :precondition (and
      (at-richmond_district)
      (not (at-financial_district))
    )
    :effect (and
      (not (at-richmond_district))
      (at-financial_district)
      (increase (time) 22)
    )
  )

  (:action travel-financial-to-richmond
    :parameters ()
    :precondition (and
      (at-financial_district)
      (not (at-richmond_district))
    )
    :effect (and
      (not (at-financial_district))
      (at-richmond_district)
      (increase (time) 21)
    )
  )

  (:action wait-5
    :parameters ()
    :precondition (and)
    :effect (and
      (increase (time) 5)
    )
  )

  (:action meet-betty-60
    :parameters ()
    :precondition (and
      (at-financial_district)
      (>= (time) 1035)
      (<= (time) 1245)
    )
    :effect (and
      (increase (time) 60)
      (increase (met-betty) 60)
    )
  )

  (:action meet-betty-15
    :parameters ()
    :precondition (and
      (at-financial_district)
      (>= (time) 1035)
      (<= (time) 1290)
    )
    :effect (and
      (increase (time) 15)
      (increase (met-betty) 15)
    )
  )
)