(define (domain multiagent_vases)
  (:requirements :strips :typing)
  (:types obj obj_s1 obj_s2 - obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  (:action playerA-wretched
    :parameters (?x - obj_s1 ?y - obj_s1 ?z - obj_s1 ?w - obj_s1)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action playerA-clip
    :parameters (?x - obj_s1 ?y - obj_s1 ?z - obj_s1)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action playerA-tightfisted
    :parameters (?x - obj_s1 ?y - obj_s1 ?z - obj_s1)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  (:action playerA-sip
    :parameters (?x - obj_s1 ?y - obj_s1 ?z - obj_s1)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action playerA-memory
    :parameters (?x - obj_s1 ?y - obj_s1 ?z - obj_s1)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action playerA-paltry
    :parameters (?x - obj_s1 ?y - obj_s1 ?z - obj_s1)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  (:action playerB-wretched
    :parameters (?x - obj_s2 ?y - obj_s2 ?z - obj_s2 ?w - obj_s2)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action playerB-clip
    :parameters (?x - obj_s2 ?y - obj_s2 ?z - obj_s2)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action playerB-tightfisted
    :parameters (?x - obj_s2 ?y - obj_s2 ?z - obj_s2)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  (:action playerB-sip
    :parameters (?x - obj_s2 ?y - obj_s2 ?z - obj_s2)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action playerB-memory
    :parameters (?x - obj_s2 ?y - obj_s2 ?z - obj_s2)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action playerB-paltry
    :parameters (?x - obj_s2 ?y - obj_s2 ?z - obj_s2)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )
)