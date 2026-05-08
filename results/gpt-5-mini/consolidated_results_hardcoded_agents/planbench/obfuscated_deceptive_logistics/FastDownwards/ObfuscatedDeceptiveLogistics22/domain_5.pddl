(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (cats ?o - object)
    (collect ?o1 - object ?o2 - object)
    (hand ?o - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
  )

  ;; paltry: requires (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t)
  ;; effects: add (next ?h ?t), del (vase ?h ?c)
  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (not (vase ?h ?c))
      (next ?h ?t)
    )
  )

  ;; sip: requires (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t)
  ;; effects: add (vase ?h ?c), del (next ?h ?t)
  (:action sip
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip: requires (hand ?h) (sneeze ?sneezeObj) (texture ?t) (next ?sneezeObj ?t) (next ?h ?t)
  ;; effects: add (vase ?h ?sneezeObj), del (next ?h ?t)
  (:action clip
    :parameters (?h - object ?sneezeObj - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?sneezeObj)
      (texture ?t)
      (next ?sneezeObj ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?sneezeObj)
      (not (next ?h ?t))
    )
  )

  ;; wretched: requires (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?stup)
  ;;           (next ?x ?y) (collect ?y ?stup) (collect ?z ?stup)
  ;; effects: add (next ?x ?z), del (next ?x ?y)
  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?stup - object)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?stup)
      (next ?x ?y)
      (collect ?y ?stup)
      (collect ?z ?stup)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?z)
    )
  )

  ;; memory: requires (cats ?a) (spring ?b) (spring ?c) (next ?a ?b)
  ;; effects: add (next ?a ?c), del (next ?a ?b)
  (:action memory
    :parameters (?a - object ?b - object ?c - object)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
    )
    :effect (and
      (not (next ?a ?b))
      (next ?a ?c)
    )
  )

  ;; tightfisted: requires (hand ?h) (sneeze ?sneezeObj) (texture ?t) (next ?sneezeObj ?t) (vase ?h ?sneezeObj)
  ;; effects: add (next ?h ?t), del (vase ?h ?sneezeObj)
  (:action tightfisted
    :parameters (?h - object ?sneezeObj - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?sneezeObj)
      (texture ?t)
      (next ?sneezeObj ?t)
      (vase ?h ?sneezeObj)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sneezeObj))
    )
  )
)