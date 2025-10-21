(define (domain integrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location item tool)

  (:predicates
    (at ?a - agent ?l - location)
    (item-at ?it - item ?l - location)
    (holding ?a - agent ?it - item)
    (assembled ?it - item)
    (inspected ?it - item)
    (powered ?it - item)
    (tool-at ?t - tool ?l - location)
  )

  ;; Public movement action (unprefixed public schema)
  (:action move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and (at ?a ?from) (not (= ?from ?to)))
    :effect (and (at ?a ?to) (not (at ?a ?from)))
  )

  ;; Actions from Analyzer A
  (:action analyzerA_pick
    :parameters (?a - agent ?it - item ?l - location)
    :precondition (and (at ?a ?l) (item-at ?it ?l))
    :effect (and (holding ?a ?it) (not (item-at ?it ?l)))
  )

  (:action analyzerA_place
    :parameters (?a - agent ?it - item ?l - location)
    :precondition (and (at ?a ?l) (holding ?a ?it))
    :effect (and (item-at ?it ?l) (not (holding ?a ?it)))
  )

  (:action analyzerA_assemble
    :parameters (?a - agent ?p1 - item ?p2 - item ?t - tool ?l - location ?out - item)
    :precondition (and
                    (at ?a ?l)
                    (holding ?a ?p1)
                    (holding ?a ?p2)
                    (tool-at ?t ?l)
                    (not (assembled ?out))
                  )
    :effect (and
              (assembled ?out)
              (item-at ?out ?l)
              (not (holding ?a ?p1))
              (not (holding ?a ?p2))
            )
  )

  ;; Actions from Analyzer B
  (:action analyzerB_inspect
    :parameters (?a - agent ?d - item ?t - tool ?l - location)
    :precondition (and
                    (at ?a ?l)
                    (assembled ?d)
                    (item-at ?d ?l)
                    (tool-at ?t ?l)
                    (not (inspected ?d))
                  )
    :effect (and (inspected ?d))
  )

  (:action analyzerB_activate
    :parameters (?a - agent ?d - item ?pu - item ?t - tool ?l - location)
    :precondition (and
                    (at ?a ?l)
                    (inspected ?d)
                    (assembled ?d)
                    (item-at ?d ?l)
                    (item-at ?pu ?l)
                    (tool-at ?t ?l)
                    (not (powered ?pu))
                  )
    :effect (and (powered ?pu))
  )
)