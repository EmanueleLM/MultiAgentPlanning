(define (domain ObfuscatedDeceptiveLogistics3)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o0 - object ?o1 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?o1 - object ?o3 - object)
    (spring ?o - object)
  )

  ; 1. Paltry: Moves ?o1 from ?o2 to ?o3, requiring ?o3 to have spring and ?o2 to have texture.
  (:action Paltry
    :parameters (?o1 - object ?o2 - object ?o3 - object)
    :precondition (and
      (next ?o1 ?o2)
      (spring ?o3)
      (texture ?o2)
    )
    :effect (and
      (not (next ?o1 ?o2))
      (next ?o1 ?o3)
    )
  )

  ; 2. Sip: Activates sneeze state on ?o, provided it is held and not sneezing.
  (:action Sip
    :parameters (?o - object)
    :precondition (and
      (hand ?o)
      (not (sneeze ?o))
    )
    :effect (and
      (sneeze ?o)
      (not (hand ?o))
    )
  )

  ; 3. Clip: Links ?o2 to ?o3, provided ?o3 is stupendous and ?o1 collects ?o3, and ?o2 is currently next to ?o1.
  (:action Clip
    :parameters (?o1 - object ?o2 - object ?o3 - object)
    :precondition (and
      (stupendous ?o3)
      (collect ?o1 ?o3)
      (next ?o2 ?o1)
    )
    :effect (and
      (not (next ?o2 ?o1))
      (next ?o2 ?o3)
    )
  )

  ; 4. Wretched: Reverts sneeze state, restoring hand status.
  (:action Wretched
    :parameters (?o - object)
    :precondition (sneeze ?o)
    :effect (and
      (not (sneeze ?o))
      (hand ?o)
    )
  )

  ; 5. Memory: Changes properties of ?o1 and establishes a vase relationship, moving ?o1 link.
  (:action Memory
    :parameters (?o1 - object ?o2 - object ?o3 - object)
    :precondition (and
      (cats ?o1)
      (next ?o1 ?o2)
      (texture ?o3)
    )
    :effect (and
      (not (cats ?o1))
      (vase ?o1 ?o3)
      (not (next ?o1 ?o2))
    )
  )

  ; 6. Tightfisted: Swaps linkage ?o2 from ?o3 to ?o4, conditional on ?o1 being held and a vase relationship existing with ?o4.
  (:action Tightfisted
    :parameters (?o1 - object ?o2 - object ?o3 - object ?o4 - object)
    :precondition (and
      (hand ?o1)
      (next ?o2 ?o3)
      (vase ?o4 ?o1)
    )
    :effect (and
      (not (next ?o2 ?o3))
      (next ?o2 ?o4)
      (not (vase ?o4 ?o1))
    )
  )
)