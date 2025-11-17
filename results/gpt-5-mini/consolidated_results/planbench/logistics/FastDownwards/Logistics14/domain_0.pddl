(define (domain repoint-domain)
  (:requirements :strips :typing)
  (:types item)

  (:predicates
    (hand ?o - item)
    (cats ?o - item)
    (texture ?o - item)
    (vase ?a ?b - item)
    (next ?a ?b - item)
    (collect ?a ?b - item)
    (sneeze ?o - item)
    (stupendous ?o - item)
    (spring ?o - item)
  )

  ;; paltry: use a vase relation and an adjacency to create a new adjacency from the vase-holder
  (:action paltry
    :parameters (?x - item ?y - item ?z - item)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; sip: move a vase forward and rewire next accordingly
  (:action sip
    :parameters (?p - item ?q - item ?r - item)
    :precondition (and
      (vase ?p ?q)
      (next ?q ?r)
    )
    :effect (and
      (vase ?q ?r)
      (next ?p ?r)
      (not (vase ?p ?q))
      (not (next ?q ?r))
    )
  )

  ;; clip: using a hand, move a vase relation and rewire adjacency
  (:action clip
    :parameters (?a - item ?b - item ?c - item)
    :precondition (and
      (hand ?a)
      (vase ?a ?b)
      (next ?a ?c)
    )
    :effect (and
      (vase ?c ?b)
      (next ?b ?c)
      (not (vase ?a ?b))
      (not (next ?a ?c))
    )
  )

  ;; tightfisted: toggle vase/next by anchoring vase at the predecessor
  (:action tightfisted
    :parameters (?u - item ?v - item ?w - item)
    :precondition (and
      (cats ?u)
      (vase ?v ?w)
      (next ?u ?v)
    )
    :effect (and
      (vase ?u ?w)
      (next ?u ?w)
      (not (vase ?v ?w))
      (not (next ?u ?v))
    )
  )

  ;; wretched: repoint a predecessor that currently points to ?from so it points to ?to,
  ;; requires collect on the from object, a stupendous marker on a related item, a sneeze fact,
  ;; and some spring fact (bound to any existing spring object). This keeps the operator
  ;; signature flexible so concrete bindings can be chosen from the initial state.
  (:action wretched
    :parameters (?pred - item ?from - item ?to - item ?mid - item ?sneeze - item ?springobj - item)
    :precondition (and
      (collect ?from ?mid)
      (stupendous ?mid)
      (sneeze ?sneeze)
      (spring ?springobj)
      (next ?pred ?from)
    )
    :effect (and
      (next ?pred ?to)
      (not (next ?pred ?from))
    )
  )

  ;; memory: repoint a predecessor that currently points to ?from so it points to ?to,
  ;; requires a collect relation on ?from referencing ?mid, a stupendous mark on that mid,
  ;; and that ?from carries a spring property.
  (:action memory
    :parameters (?pred - item ?from - item ?to - item ?mid - item)
    :precondition (and
      (collect ?from ?mid)
      (stupendous ?mid)
      (spring ?from)
      (next ?pred ?from)
    )
    :effect (and
      (next ?pred ?to)
      (not (next ?pred ?from))
    )
  )

)