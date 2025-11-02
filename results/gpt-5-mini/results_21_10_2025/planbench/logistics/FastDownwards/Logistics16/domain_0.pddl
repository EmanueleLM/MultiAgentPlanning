(define (domain relink-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  ;; Predicates
  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (collect ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  ;; Paltry(x,y,z):
  ;; - expects a hand x currently linked to y, with y textured
  ;; - reattaches x to z, removes old next and records a vase relation y->z
  (:action Paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (next ?x ?y)
      (texture ?y)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?z)
      (vase ?y ?z)
    )
  )

  ;; Sip(x,y,z):
  ;; - expects a hand x linked to y (textured) and a stupendous z as destination
  ;; - reattaches x to z (replace old next)
  (:action Sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (next ?x ?y)
      (texture ?y)
      (stupendous ?z)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?z)
    )
  )

  ;; Clip(x,y,z):
  ;; - expects a hand x linked to y and y is collect-related to z
  ;; - reattaches x to z and establishes a vase relation y->z
  (:action Clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (next ?x ?y)
      (collect ?y ?z)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?z)
      (vase ?y ?z)
    )
  )

  ;; Tightfisted(x,y,z):
  ;; - expects a hand x linked to y; target z must be springy
  ;; - reattaches x to z
  (:action Tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (next ?x ?y)
      (spring ?z)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?z)
    )
  )

  ;; Memory(x,y,z):
  ;; - expects a hand x linked to y, and y is collect-related to z where z is stupendous
  ;; - reattaches x to z
  (:action Memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (next ?x ?y)
      (collect ?y ?z)
      (stupendous ?z)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?z)
    )
  )

  ;; Wretched(x,y,z,w):
  ;; - 4-arg action: expects a hand x linked to y, y is collect-related to z and y is springy, and w is stupendous
  ;; - reattaches x to w, moves vase linkage from y->z to w->z (if any)
  (:action Wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj)
    :precondition (and
      (hand ?x)
      (next ?x ?y)
      (collect ?y ?z)
      (spring ?y)
      (stupendous ?w)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?w)
      ;; adjust vase relations: remove vase y->z if present, add vase w->z
      (not (vase ?y ?z))
      (vase ?w ?z)
    )
  )

)