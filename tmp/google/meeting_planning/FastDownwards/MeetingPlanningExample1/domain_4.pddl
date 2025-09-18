(define (domain meet-betty-compiled)
  (:requirements :strips :typing :adl)
  (:types location timepoint)
  (:constants richmond financial - location)
  (:predicates
    (at-you ?l - location)
    (at-betty ?l - location)
    (now ?t - timepoint)
    (in-window ?t - timepoint)
    (can-travel-rd-fd ?t1 ?t2 - timepoint)
    (can-travel-fd-rd ?t1 ?t2 - timepoint)
    (can-wait ?t1 ?t2 - timepoint)
    (can-meet-start ?t1 ?t2 - timepoint)
    (met)
    (travel-cost-22 ?t1 ?t2 - timepoint)
    (travel-cost-21 ?t1 ?t2 - timepoint)
    (wait-cost-473 ?t1 ?t2 - timepoint)
    (wait-cost-210 ?t1 ?t2 - timepoint)
    (meet-cost-60 ?t1 ?t2 - timepoint)
  )

  (:action you_travel_richmond_to_financial
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (at-you richmond)
      (now ?t1)
      (can-travel-rd-fd ?t1 ?t2)
      (travel-cost-22 ?t1 ?t2)
    )
    :effect (and
      (not (at-you richmond))
      (at-you financial)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action you_travel_financial_to_richmond
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (at-you financial)
      (now ?t1)
      (can-travel-fd-rd ?t1 ?t2)
      (travel-cost-21 ?t1 ?t2)
    )
    :effect (and
      (not (at-you financial))
      (at-you richmond)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action you_wait_473
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (now ?t1)
      (can-wait ?t1 ?t2)
      (wait-cost-473 ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action you_wait_210
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (now ?t1)
      (can-wait ?t1 ?t2)
      (wait-cost-210 ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action you_meet_betty_at_financial
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (at-you financial)
      (at-betty financial)
      (now ?t1)
      (can-meet-start ?t1 ?t2)
      (in-window ?t1)
      (meet-cost-60 ?t1 ?t2)
    )
    :effect (and
      (met)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action betty_stay
    :parameters ()
    :precondition (and)
    :effect (and)
  )
)