(define (domain betty_meetup_fd)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types)

  (:predicates
    ; canonical locations from the synonyms map
    (at-richmond_district)
    (at-financial_district)
  )

  (:functions
    (time)
    (met-betty)
  )

  ; Travel actions (asymmetric)
  (:action travel-richmond-to-financial
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

  ; Small wait to help align with availability boundaries
  (:action wait-5
    :precondition (and)
    :effect (and
      (increase (time) 5)
    )
  )

  ; Meeting actions (availability enforced via numeric preconditions)
  (:action meet-betty-60
    :precondition (and
      (at-financial_district)
      (>= (time) 1035)   ; not before 17:15
      (<= (time) 1245)   ; must finish by 21:45 => start <= 20:45
    )
    :effect (and
      (increase (time) 60)
      (increase (met-betty) 60)
    )
  )

  (:action meet-betty-15
    :precondition (and
      (at-financial_district)
      (>= (time) 1035)   ; not before 17:15
      (<= (time) 1290)   ; must finish by 21:45 => start <= 21:30
    )
    :effect (and
      (increase (time) 15)
      (increase (met-betty) 15)
    )
  )
)