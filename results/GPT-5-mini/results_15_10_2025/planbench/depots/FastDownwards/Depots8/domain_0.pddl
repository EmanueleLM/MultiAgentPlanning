(define (domain objects-domain)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?x ?y)
    (next ?x ?y)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (collect ?x ?y)
  )

  ; paltry requires hand X cats Y texture Z vase X Y next Y Z
  ; yields next X Z true and vase X Y false
  (:action paltry
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  ; sip requires hand X cats Y texture Z next X Z next Y Z
  ; yields vase X Y true and next X Z false
  (:action sip
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ; clip requires hand X sneeze Y texture Z next Y Z next X Z
  ; yields vase X Y true and next X Z false
  (:action clip
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ; wretched requires sneeze X texture Y texture Z stupendous W next X Y collect Y W collect Z W
  ; yields next X Z true and next X Y false
  (:action wretched
    :parameters (?a ?b ?c ?d)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d) (next ?a ?b) (collect ?b ?d) (collect ?c ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  ; memory requires cats X spring Y spring Z next X Y
  ; yields next X Z true and next X Y false
  (:action memory
    :parameters (?x ?y ?z)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ; tightfisted requires hand X sneeze Y texture Z next Y Z vase X Y
  ; yields next X Z true and vase X Y false
  (:action tightfisted
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )
)