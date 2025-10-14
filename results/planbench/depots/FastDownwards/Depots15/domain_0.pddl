(define (domain manipulation-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 ?o2 - object)
    (next ?o1 ?o2 - object)
    (collect ?o1 ?o2 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ; Action: paltry
  ; Signature: (?obj0 ?obj1 ?obj2 - object)
  ; Preconditions:
  ;   (hand ?obj0)
  ;   (cats ?obj1)
  ;   (texture ?obj2)
  ;   (vase ?obj0 ?obj1)
  ;   (next ?obj1 ?obj2)
  ; Positive effects:
  ;   (next ?obj0 ?obj2)
  ; Negative effects:
  ;   (not (vase ?obj0 ?obj1))
  (:action paltry
     :parameters (?obj0 ?obj1 ?obj2 - object)
     :precondition (and
        (hand ?obj0)
        (cats ?obj1)
        (texture ?obj2)
        (vase ?obj0 ?obj1)
        (next ?obj1 ?obj2)
     )
     :effect (and
        (next ?obj0 ?obj2)
        (not (vase ?obj0 ?obj1))
     )
  )

  ; Action: clip
  ; Signature: (?obj0 ?obj1 ?obj2 - object)
  ; Preconditions:
  ;   (hand ?obj0)
  ;   (sneeze ?obj1)
  ;   (texture ?obj2)
  ;   (next ?obj1 ?obj2)
  ;   (next ?obj0 ?obj2)
  ; Positive effects:
  ;   (vase ?obj0 ?obj1)
  ; Negative effects:
  ;   (not (next ?obj0 ?obj2))
  (:action clip
     :parameters (?obj0 ?obj1 ?obj2 - object)
     :precondition (and
        (hand ?obj0)
        (sneeze ?obj1)
        (texture ?obj2)
        (next ?obj1 ?obj2)
        (next ?obj0 ?obj2)
     )
     :effect (and
        (vase ?obj0 ?obj1)
        (not (next ?obj0 ?obj2))
     )
  )

  ; Action: tightfisted
  ; Signature: (?obj0 ?obj1 ?obj2 - object)
  ; Preconditions:
  ;   (hand ?obj0)
  ;   (sneeze ?obj1)
  ;   (texture ?obj2)
  ;   (next ?obj1 ?obj2)
  ;   (vase ?obj0 ?obj1)
  ; Positive effects:
  ;   (next ?obj0 ?obj2)
  ; Negative effects:
  ;   (not (vase ?obj0 ?obj1))
  (:action tightfisted
     :parameters (?obj0 ?obj1 ?obj2 - object)
     :precondition (and
        (hand ?obj0)
        (sneeze ?obj1)
        (texture ?obj2)
        (next ?obj1 ?obj2)
        (vase ?obj0 ?obj1)
     )
     :effect (and
        (next ?obj0 ?obj2)
        (not (vase ?obj0 ?obj1))
     )
  )

  ; Action: sip
  ; Signature: (?obj0 ?obj1 ?obj2 - object)
  ; Preconditions:
  ;   (hand ?obj0)
  ;   (cats ?obj1)
  ;   (texture ?obj2)
  ;   (next ?obj0 ?obj2)
  ;   (next ?obj1 ?obj2)
  ; Positive effects:
  ;   (vase ?obj0 ?obj1)
  ; Negative effects:
  ;   (not (next ?obj0 ?obj2))
  (:action sip
     :parameters (?obj0 ?obj1 ?obj2 - object)
     :precondition (and
        (hand ?obj0)
        (cats ?obj1)
        (texture ?obj2)
        (next ?obj0 ?obj2)
        (next ?obj1 ?obj2)
     )
     :effect (and
        (vase ?obj0 ?obj1)
        (not (next ?obj0 ?obj2))
     )
  )

  ; Action: wretched
  ; Signature: (?obj0 ?obj1 ?obj2 ?obj3 - object)
  ; Preconditions:
  ;   (sneeze ?obj0)
  ;   (texture ?obj1)
  ;   (texture ?obj2)
  ;   (stupendous ?obj3)
  ;   (next ?obj0 ?obj1)
  ;   (collect ?obj1 ?obj3)
  ;   (collect ?obj2 ?obj3)
  ; Positive effects:
  ;   (next ?obj0 ?obj2)
  ; Negative effects:
  ;   (not (next ?obj0 ?obj1))
  (:action wretched
     :parameters (?obj0 ?obj1 ?obj2 ?obj3 - object)
     :precondition (and
        (sneeze ?obj0)
        (texture ?obj1)
        (texture ?obj2)
        (stupendous ?obj3)
        (next ?obj0 ?obj1)
        (collect ?obj1 ?obj3)
        (collect ?obj2 ?obj3)
     )
     :effect (and
        (next ?obj0 ?obj2)
        (not (next ?obj0 ?obj1))
     )
  )

  ; Action: memory
  ; Signature: (?obj0 ?obj1 ?obj2 - object)
  ; Preconditions:
  ;   (cats ?obj0)
  ;   (spring ?obj1)
  ;   (spring ?obj2)
  ;   (next ?obj0 ?obj1)
  ; Positive effects:
  ;   (next ?obj0 ?obj2)
  ; Negative effects:
  ;   (not (next ?obj0 ?obj1))
  (:action memory
     :parameters (?obj0 ?obj1 ?obj2 - object)
     :precondition (and
        (cats ?obj0)
        (spring ?obj1)
        (spring ?obj2)
        (next ?obj0 ?obj1)
     )
     :effect (and
        (next ?obj0 ?obj2)
        (not (next ?obj0 ?obj1))
     )
  )

)