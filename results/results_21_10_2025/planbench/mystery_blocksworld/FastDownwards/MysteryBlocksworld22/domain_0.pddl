(define (domain orchestrator_domain)
  :requirements (:strips :typing)
  :types object

  :predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (vase ?x - object)
    (next ?x ?y - object)
    (sneeze ?x - object)
    (stupendous ?x - object)
    (spring ?x - object)
    (collect ?x ?y - object)

  ; Action: paltry
  ; Parameters mapping:
  ;  - ?obj0 : object held by player, moved into vase
  ;  - ?obj1, ?obj2 : adjacency pair (next ?obj1 ?obj2) that will be inverted
  ( :action paltry
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
    :precondition (and
      (hand ?obj0)
      (texture ?obj1)
      (next ?obj1 ?obj2)
    )
    :effect (and
      (vase ?obj0)
      (not (hand ?obj0))
      (not (next ?obj1 ?obj2))
      (next ?obj2 ?obj1)
    )
  )

  ; Action: sip
  ; Parameters mapping:
  ;  - ?obj0 : object held by player (consumed/removed from hand)
  ;  - ?obj1 : object with 'cats' property that will be placed in vase
  ;  - ?obj2 : 'stupendous' object establishing adjacency next(?obj1, ?obj2)
  ( :action sip
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
    :precondition (and
      (hand ?obj0)
      (cats ?obj1)
      (stupendous ?obj2)
    )
    :effect (and
      (vase ?obj1)
      (not (hand ?obj0))
      (next ?obj1 ?obj2)
      (not (next ?obj2 ?obj1))
    )
  )

  ; Action: clip
  ; Parameters mapping:
  ;  - ?obj0 : object that has sneeze property (required)
  ;  - ?obj1, ?obj2 : adjacency pair (next ?obj1 ?obj2) that will be inverted; ?obj1 also placed in vase
  ( :action clip
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
    :precondition (and
      (sneeze ?obj0)
      (texture ?obj1)
      (next ?obj1 ?obj2)
    )
    :effect (and
      (vase ?obj1)
      (not (next ?obj1 ?obj2))
      (next ?obj2 ?obj1)
    )
  )

  ; Action: wretched
  ; Parameters mapping (collect is binary here):
  ;  - ?obj0 : object in player's hand (used/consumed)
  ;  - ?collected : the collected object that will be placed in vase
  ;  - ?col_partner : partner bound with collect(?collected, ?col_partner)
  ;  - ?obj2, ?obj3 : adjacency pair (next ?obj2 ?obj3) that will be inverted
  ( :action wretched
    :parameters (?obj0 - object ?collected - object ?col_partner - object ?obj2 - object ?obj3 - object)
    :precondition (and
      (hand ?obj0)
      (collect ?collected ?col_partner)
      (spring ?obj2)
      (next ?obj2 ?obj3)
    )
    :effect (and
      (vase ?collected)
      (not (next ?obj2 ?obj3))
      (next ?obj3 ?obj2)
    )
  )

  ; Action: memory
  ; Parameters mapping (collect is binary here):
  ;  - ?collected : collected object required (will be moved to vase)
  ;  - ?col_partner : partner bound with collect(?collected, ?col_partner)
  ;  - ?obj1, ?obj2 : adjacency pair to set next(?obj1, ?obj2)
  ( :action memory
    :parameters (?collected - object ?col_partner - object ?obj1 - object ?obj2 - object)
    :precondition (and
      (collect ?collected ?col_partner)
      (texture ?obj1)
      (stupendous ?obj2)
    )
    :effect (and
      (vase ?collected)
      (next ?obj1 ?obj2)
      (not (next ?obj2 ?obj1))
    )
  )

  ; Action: tightfisted
  ; Parameters mapping:
  ;  - ?obj0 : object held by player moved to vase
  ;  - ?obj1 : object with sneeze property required
  ;  - ?obj2 : object that is after ?obj0 (next ?obj0 ?obj2), adjacency inverted
  ( :action tightfisted
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
    :precondition (and
      (hand ?obj0)
      (sneeze ?obj1)
      (next ?obj0 ?obj2)
    )
    :effect (and
      (vase ?obj0)
      (not (hand ?obj0))
      (not (next ?obj0 ?obj2))
      (next ?obj2 ?obj0)
    )
  )

)