(define (domain obfuscated_deceptive_logistics_31)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (vase ?v - object ?p - object)
    (next ?o - object ?l - object)
    (sneeze ?x - object)
    (stupendous ?x - object)
    (collect ?l - object ?r - object)
    (spring ?x - object)
  )

  ;; Unload packet type 'cats'
  (:action paltry
    :parameters (?v - object ?p - object ?l - object)
    :precondition (and (hand ?v) (cats ?p) (texture ?l) (vase ?v ?p) (next ?p ?l))
    :effect (and (next ?v ?l) (not (vase ?v ?p)))
  )

  ;; Load packet type 'cats'
  (:action sip
    :parameters (?v - object ?p - object ?l - object)
    :precondition (and (hand ?v) (cats ?p) (texture ?l) (next ?v ?l) (next ?p ?l))
    :effect (and (vase ?v ?p) (not (next ?v ?l)))
  )

  ;; Load packet type 'sneeze'
  (:action clip
    :parameters (?v - object ?p - object ?l - object)
    :precondition (and (hand ?v) (sneeze ?p) (texture ?l) (next ?p ?l) (next ?v ?l))
    :effect (and (vase ?v ?p) (not (next ?v ?l)))
  )

  ;; Move packet type 'sneeze' within a region
  (:action wretched
    :parameters (?p - object ?l1 - object ?l2 - object ?r - object)
    :precondition (and (sneeze ?p) (texture ?l1) (texture ?l2) (stupendous ?r) 
                       (next ?p ?l1) (collect ?l1 ?r) (collect ?l2 ?r))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  ;; Move packet type 'cats' between spring locations (hubs)
  (:action memory
    :parameters (?p - object ?l1 - object ?l2 - object)
    :precondition (and (cats ?p) (spring ?l1) (spring ?l2) (next ?p ?l1))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  ;; Unload packet type 'sneeze'
  (:action tightfisted
    :parameters (?v - object ?p - object ?l - object)
    :precondition (and (hand ?v) (sneeze ?p) (texture ?l) (next ?p ?l) (vase ?v ?p))
    :effect (and (next ?v ?l) (not (vase ?v ?p)))
  )
)