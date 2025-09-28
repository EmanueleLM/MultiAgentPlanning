(define (domain meeting-domain)
  (:requirements :strips :typing :adl :negative-preconditions :action-costs)
  (:types agent location time)

  (:predicates
    (now ?t - time)
    (at ?a - agent ?l - location)
    (travel13 ?t1 - time ?t2 - time)
    (travel12 ?t1 - time ?t2 - time)
    (meet-slot ?t1 - time ?t2 - time)
    (met-minimum)
  )

  (:action travel-ph-to-fw
    :parameters (?t1 - time ?t2 - time ?trav - agent)
    :precondition (and (now ?t1) (at ?trav pacific) (travel13 ?t1 ?t2))
    :effect (and (not (now ?t1)) (now ?t2) (not (at ?t1)) (not (at ?trav pacific)) (at ?trav fishermans))
    :cost 13
  )

  (:action travel-fw-to-ph
    :parameters (?t1 - time ?t2 - time ?trav - agent)
    :precondition (and (now ?t1) (at ?trav fishermans) (travel12 ?t1 ?t2))
    :effect (and (not (now ?t1)) (now ?t2) (not (at ?trav fishermans)) (at ?trav pacific))
    :cost 12
  )

  (:action meet-at-fishermans
    :parameters (?t1 - time ?t2 - time ?trav - agent ?bet - agent)
    :precondition (and (now ?t1) (at ?trav fishermans) (at ?bet fishermans) (meet-slot ?t1 ?t2) (not (met-minimum)))
    :effect (and (not (now ?t1)) (now ?t2) (met-minimum))
    :cost 105
  )
)