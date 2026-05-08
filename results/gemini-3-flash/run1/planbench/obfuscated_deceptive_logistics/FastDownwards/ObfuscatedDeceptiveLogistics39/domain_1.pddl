(define (domain obfuscateddeceptivelogistics39)
  (:requirements :strips)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?v ?l)
    (next ?o1 ?o2)
    (sneeze ?o)
    (stupendous ?o)
    (collect ?s ?g)
    (spring ?o)
  )

  (:action paltry
    :parameters (?v ?l ?s)
    :precondition (and (hand ?v) (cats ?l) (texture ?s) (vase ?v ?l) (next ?l ?s))
    :effect (and (next ?v ?s) (not (vase ?v ?l)))
  )

  (:action sip
    :parameters (?v ?l ?s)
    :precondition (and (hand ?v) (cats ?l) (texture ?s) (next ?v ?s) (next ?l ?s))
    :effect (and (vase ?v ?l) (not (next ?v ?s)))
  )

  (:action clip
    :parameters (?v ?l ?s)
    :precondition (and (hand ?v) (sneeze ?l) (texture ?s) (next ?l ?s) (next ?v ?s))
    :effect (and (vase ?v ?l) (not (next ?v ?s)))
  )

  (:action wretched
    :parameters (?l ?s1 ?s2 ?g)
    :precondition (and (sneeze ?l) (texture ?s1) (texture ?s2) (stupendous ?g) (next ?l ?s1) (collect ?s1 ?g) (collect ?s2 ?g))
    :effect (and (next ?l ?s2) (not (next ?l ?s1)))
  )

  (:action memory
    :parameters (?l ?s1 ?s2)
    :precondition (and (cats ?l) (spring ?s1) (spring ?s2) (next ?l ?s1))
    :effect (and (next ?l ?s2) (not (next ?l ?s1)))
  )

  (:action tightfisted
    :parameters (?v ?l ?s)
    :precondition (and (hand ?v) (sneeze ?l) (texture ?s) (next ?l ?s) (vase ?v ?l))
    :effect (and (next ?v ?s) (not (vase ?v ?l)))
  )
)