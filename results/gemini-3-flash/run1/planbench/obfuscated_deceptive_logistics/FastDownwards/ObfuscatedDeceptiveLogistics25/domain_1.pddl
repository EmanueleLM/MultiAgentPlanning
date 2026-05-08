(define (domain obfuscated_deceptive_logistics_25)
  (:requirements :strips)

  (:predicates
    (hand ?obj)
    (cats ?obj)
    (texture ?obj)
    (vase ?obj1 ?obj2)
    (next ?obj1 ?obj2)
    (sneeze ?obj)
    (stupendous ?obj)
    (collect ?obj1 ?obj2)
    (spring ?obj)
  )

  (:action paltry
    :parameters (?truck ?loc ?pack)
    :precondition (and (hand ?truck) (cats ?loc) (texture ?pack) (vase ?truck ?loc) (next ?loc ?pack))
    :effect (and (next ?truck ?pack) (not (vase ?truck ?loc)))
  )

  (:action sip
    :parameters (?truck ?loc ?pack)
    :precondition (and (hand ?truck) (cats ?loc) (texture ?pack) (next ?truck ?pack) (next ?loc ?pack))
    :effect (and (vase ?truck ?loc) (not (next ?truck ?pack)))
  )

  (:action clip
    :parameters (?truck ?loc ?pack)
    :precondition (and (hand ?truck) (sneeze ?loc) (texture ?pack) (next ?loc ?pack) (next ?truck ?pack))
    :effect (and (vase ?truck ?loc) (not (next ?truck ?pack)))
  )

  (:action wretched
    :parameters (?loc ?pack1 ?pack2 ?hub)
    :precondition (and (sneeze ?loc) (texture ?pack1) (texture ?pack2) (stupendous ?hub) (next ?loc ?pack1) (collect ?pack1 ?hub) (collect ?pack2 ?hub))
    :effect (and (next ?loc ?pack2) (not (next ?loc ?pack1)))
  )

  (:action memory
    :parameters (?loc ?pack1 ?pack2)
    :precondition (and (cats ?loc) (spring ?pack1) (spring ?pack2) (next ?loc ?pack1))
    :effect (and (next ?loc ?pack2) (not (next ?loc ?pack1)))
  )

  (:action tightfisted
    :parameters (?truck ?loc ?pack)
    :precondition (and (hand ?truck) (sneeze ?loc) (texture ?pack) (next ?loc ?pack) (vase ?truck ?loc))
    :effect (and (next ?truck ?pack) (not (vase ?truck ?loc)))
  )
)