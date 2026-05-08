(define (domain obfuscated_deceptive_logistics_22)
  (:requirements :strips)
  (:predicates
    (hand ?o)
    (cats ?o)
    (sneeze ?o)
    (texture ?o)
    (stupendous ?o)
    (spring ?o)
    (collect ?loc ?region)
    (next ?obj ?loc)
    (vase ?v ?c)
  )

  (:action paltry
    :parameters (?v ?c ?l)
    :precondition (and (hand ?v) (cats ?c) (texture ?l) (vase ?v ?c) (next ?c ?l))
    :effect (and (next ?v ?l) (not (vase ?v ?c)))
  )

  (:action sip
    :parameters (?v ?c ?l)
    :precondition (and (hand ?v) (cats ?c) (texture ?l) (next ?v ?l) (next ?c ?l))
    :effect (and (vase ?v ?c) (not (next ?v ?l)))
  )

  (:action clip
    :parameters (?v ?s ?l)
    :precondition (and (hand ?v) (sneeze ?s) (texture ?l) (next ?s ?l) (next ?v ?l))
    :effect (and (vase ?v ?s) (not (next ?v ?l)))
  )

  (:action wretched
    :parameters (?s ?l1 ?l2 ?st)
    :precondition (and (sneeze ?s) (texture ?l1) (texture ?l2) (stupendous ?st) (next ?s ?l1) (collect ?l1 ?st) (collect ?l2 ?st))
    :effect (and (next ?s ?l2) (not (next ?s ?l1)))
  )

  (:action memory
    :parameters (?c ?sp1 ?sp2)
    :precondition (and (cats ?c) (spring ?sp1) (spring ?sp2) (next ?c ?sp1))
    :effect (and (next ?c ?sp2) (not (next ?c ?sp1)))
  )

  (:action tightfisted
    :parameters (?v ?s ?l)
    :precondition (and (hand ?v) (sneeze ?s) (texture ?l) (next ?s ?l) (vase ?v ?s))
    :effect (and (next ?v ?l) (not (vase ?v ?s)))
  )
)