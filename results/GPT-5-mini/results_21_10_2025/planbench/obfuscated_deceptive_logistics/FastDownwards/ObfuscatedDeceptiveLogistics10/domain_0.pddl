(define (domain duo-collect)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent object texturetype)
  (:predicates
    ;; agent holds an object
    (hand ?a - agent ?o - object)
    ;; object is a cat
    (cats ?o - object)
    ;; object has a texture type
    (texture ?o - object ?t - texturetype)
    ;; object is a vase
    (vase ?o - object)
    ;; adjacency / ordering relation (modeled but unused in this problem)
    (next ?x - object ?y - object)
    ;; agent has sneezed
    (sneeze ?a - agent)
    ;; object has its spring property active
    (spring ?o - object)
    ;; object is stupendous (required to collect)
    (stupendous ?o - object)
    ;; agent has collected the object (goal predicate)
    (collect ?a - agent ?o - object)
  )

  ;; ---------- Actions for player1 (namespaced p1-) ----------
  ;; p1 can grab an object that is a vase if neither player1 nor player2 currently holds it
  (:action p1-grab
    :parameters (?o - object)
    :precondition (and
      (vase ?o)
      (not (hand p1 ?o))
      (not (hand p2 ?o))
    )
    :effect (and
      (hand p1 ?o)
    )
  )

  ;; p1 can sneeze while holding an object; sneezing marks the agent as having sneezed
  ;; and makes the held object stupendous (so it can be collected)
  (:action p1-sneeze
    :parameters (?o - object)
    :precondition (and
      (hand p1 ?o)
      (not (sneeze p1))
    )
    :effect (and
      (sneeze p1)
      (stupendous ?o)
    )
  )

  ;; p1 can collect a held, stupendous object; collecting removes it from the hand
  (:action p1-collect
    :parameters (?o - object)
    :precondition (and
      (hand p1 ?o)
      (stupendous ?o)
      (not (collect p1 ?o))
    )
    :effect (and
      (collect p1 ?o)
      (not (hand p1 ?o))
    )
  )

  ;; ---------- Actions for player2 (namespaced p2-) ----------
  ;; p2 can grab an object that is a cat if neither player2 nor player1 currently holds it
  (:action p2-grab
    :parameters (?o - object)
    :precondition (and
      (cats ?o)
      (not (hand p2 ?o))
      (not (hand p1 ?o))
    )
    :effect (and
      (hand p2 ?o)
    )
  )

  ;; p2 can activate a spring on an object it holds if the object's texture matches a required texture.
  ;; Activating the spring marks the object as spring-active and makes it stupendous (so it can be collected).
  (:action p2-activate-spring
    :parameters (?o - object ?t - texturetype)
    :precondition (and
      (hand p2 ?o)
      (texture ?o ?t)
      (not (spring ?o))
    )
    :effect (and
      (spring ?o)
      (stupendous ?o)
    )
  )

  ;; p2 can collect a held, stupendous object; collecting removes it from the hand
  (:action p2-collect
    :parameters (?o - object)
    :precondition (and
      (hand p2 ?o)
      (stupendous ?o)
      (not (collect p2 ?o))
    )
    :effect (and
      (collect p2 ?o)
      (not (hand p2 ?o))
    )
  )
)