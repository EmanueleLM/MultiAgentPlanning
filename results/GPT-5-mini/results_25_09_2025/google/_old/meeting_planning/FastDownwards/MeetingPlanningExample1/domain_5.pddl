(define (domain meet-betty-compiled)
  (:requirements :strips :typing)
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
  )

  (:action you_travel_richmond_to_financial
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (at-you richmond)
      (now ?t1)
      (can-travel-rd-fd ?t1 ?t2)
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
    )
    :effect (and
      (not (at-you financial))
      (at-you richmond)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action you_wait
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (now ?t1)
      (can-wait ?t1 ?t2)
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
      (in-window ?t1)
      (can-meet-start ?t1 ?t2)
    )
    :effect (and
      (met)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action betty_arrive_financial
    :parameters (?t - timepoint)
    :precondition (and
      (now ?t)
      (in-window ?t)
    )
    :effect (and
      (at-betty financial)
    )
  )

  (:action betty_stay
    :parameters ()
    :precondition ()
    :effect ()
  )
)