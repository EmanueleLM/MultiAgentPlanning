(define (domain meet-friends)
  (:requirements :strips :typing :negative-preconditions :action-costs :fluents)
  (:types location timepoint)
  (:constants bayview pacific-heights - location)
  (:predicates
    (now ?t - timepoint)
    (at ?loc - location ?t - timepoint)
    (met-thomas)
    (allowed-start ?t - timepoint)
    (next23 ?t1 ?t2 - timepoint)
    (next22 ?t1 ?t2 - timepoint)
    (next105 ?t1 ?t2 - timepoint)
    (next-to735 ?t1 ?t2 - timepoint)
  )
  (:functions
    (total-cost)
  )

  (:action travel-bayview-to-ph
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (now ?t1)
      (at bayview ?t1)
      (next23 ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (not (at bayview ?t1))
      (at pacific-heights ?t2)
    )
  )

  (:action travel-ph-to-bayview
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (now ?t1)
      (at pacific-heights ?t1)
      (next22 ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (not (at pacific-heights ?t1))
      (at bayview ?t2)
    )
  )

  (:action wait-to-735
    :parameters (?t1 ?t2 - timepoint ?loc - location)
    :precondition (and
      (now ?t1)
      (at ?loc ?t1)
      (next-to735 ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (not (at ?loc ?t1))
      (at ?loc ?t2)
    )
  )

  (:action meet-with-thomas
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (now ?t1)
      (at pacific-heights ?t1)
      (not (met-thomas))
      (allowed-start ?t1)
      (next105 ?t1 ?t2)
    )
    :effect (and
      (met-thomas)
      (not (now ?t1))
      (now ?t2)
      (not (at pacific-heights ?t1))
      (at pacific-heights ?t2)
      (increase (total-cost) 1)
    )
  )
)