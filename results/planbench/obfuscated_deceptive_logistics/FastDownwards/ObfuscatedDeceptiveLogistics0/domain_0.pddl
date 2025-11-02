(define (domain integrated-statements)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (texture ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj)
  )

  ; Establish focus on the current successor z for x under controller y
  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (next ?x ?z))
    :effect (and
      (vase ?z))
  )

  ; Re-target the focus from y to z, constrained by spring on both
  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (vase ?y))
    :effect (and
      (not (vase ?y))
      (vase ?z))
  )

  ; Commit the focused target z as the new next for x under controller y
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (vase ?z)
      (texture ?z))
    :effect (and
      (next ?x ?z))
  )

  ; Alternative way to focus using a sneezing z already linked from x
  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (sneeze ?z)
      (next ?x ?z))
    :effect (and
      (vase ?z))
  )

  ; Focus to z if there is a collect relation z w accessible under y
  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj)
    :precondition (and
      (cats ?y)
      (collect ?z ?w))
    :effect (and
      (vase ?z))
  )

  ; Focus to z if z is stupendous under controller y
  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (cats ?y)
      (stupendous ?z))
    :effect (and
      (vase ?z))
  )
)