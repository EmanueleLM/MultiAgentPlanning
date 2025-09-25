(define (domain meeting-domain)
  (:requirements :typing :fluents :negative-preconditions :strips)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (met-you-john)
  )

  (:functions
    (current-time)
  )

  (:action travel-you-richmond-to-northbeach
    :parameters ()
    :precondition (and (at you richmond))
    :effect (and
      (not (at you richmond))
      (at you north-beach)
      (increase (current-time) 17)
    )
  )

  (:action travel-you-northbeach-to-richmond
    :parameters ()
    :precondition (and (at you north-beach))
    :effect (and
      (not (at you north-beach))
      (at you richmond)
      (increase (current-time) 18)
    )
  )

  (:action wait-one-minute-you
    :parameters (?l - location)
    :precondition (and (at you ?l))
    :effect (and
      (increase (current-time) 1)
    )
  )

  (:action meet-you-john
    :parameters ()
    :precondition (and
      (at you north-beach)
      (at john north-beach)
      (>= (current-time) 915)
      (<= (+ (current-time) 75) 1035)
      (not (met-you-john))
    )
    :effect (and
      (met-you-john)
      (increase (current-time) 75)
    )
  )
)