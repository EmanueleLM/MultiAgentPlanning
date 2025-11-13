(define (domain Depots3)
  (:requirements :strips)
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

  (:action paltry
    :parameters (?a ?b ?c)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c))
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b)))
  )

  (:action sip
    :parameters (?a ?b ?c)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c))
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c)))
  )

  (:action clip
    :parameters (?a ?b ?c)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c))
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c)))
  )

  (:action wretched
    :parameters (?a ?b ?c ?d)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d))
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b)))
  )

  (:action memory
    :parameters (?a ?b ?c)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b))
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b)))
  )

  (:action tightfisted
    :parameters (?a ?b ?c)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b))
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b)))
  )
)