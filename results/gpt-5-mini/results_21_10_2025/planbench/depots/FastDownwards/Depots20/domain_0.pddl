(define (domain orchestrated_domain)
  (:requirements :strips)
  (:predicates
    (hand ?h)
    (cats ?c)
    (texture ?t)
    (vase ?h ?s)          ; vase(hand, sneeze)
    (next ?a ?b)
    (collect ?x ?y)
    (sneeze ?s)
    (spring ?s)
    (stupendous ?s)
  )

  ; wretched:
  ; Preconditions:
  ;   sneeze ?sneeze
  ;   texture ?t1
  ;   texture ?t2
  ;   stupendous ?stu
  ;   next ?sneeze ?t1
  ;   collect ?t1 ?stu
  ;   collect ?t2 ?stu
  ; Effects:
  ;   add next ?sneeze ?t2
  ;   remove next ?sneeze ?t1
  (:action wretched
    :parameters (?sneeze ?t1 ?t2 ?stu)
    :precondition (and
      (sneeze ?sneeze)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?stu)
      (next ?sneeze ?t1)
      (collect ?t1 ?stu)
      (collect ?t2 ?stu)
    )
    :effect (and
      (next ?sneeze ?t2)
      (not (next ?sneeze ?t1))
    )
  )

  ; memory:
  ; Preconditions:
  ;   cats ?cat
  ;   spring ?s1
  ;   spring ?s2
  ;   next ?cat ?s1
  ; Effects:
  ;   add next ?cat ?s2
  ;   remove next ?cat ?s1
  (:action memory
    :parameters (?cat ?s1 ?s2)
    :precondition (and
      (cats ?cat)
      (spring ?s1)
      (spring ?s2)
      (next ?cat ?s1)
    )
    :effect (and
      (next ?cat ?s2)
      (not (next ?cat ?s1))
    )
  )

  ; clip:
  ; Preconditions:
  ;   hand ?h
  ;   sneeze ?sneeze
  ;   texture ?t
  ;   next ?sneeze ?t
  ;   next ?h ?t
  ; Effects:
  ;   add vase ?h ?sneeze
  ;   remove next ?h ?t
  (:action clip
    :parameters (?h ?sneeze ?t)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?sneeze)
      (not (next ?h ?t))
    )
  )

  ; tightfisted:
  ; Preconditions:
  ;   hand ?h
  ;   sneeze ?sneeze
  ;   texture ?t
  ;   next ?sneeze ?t
  ;   vase ?h ?sneeze
  ; Effects:
  ;   add next ?h ?t
  ;   remove vase ?h ?sneeze
  (:action tightfisted
    :parameters (?h ?sneeze ?t)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (vase ?h ?sneeze)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sneeze))
    )
  )

)