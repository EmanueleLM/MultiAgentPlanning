(define (domain sequence-manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types object agent)

  ;; Predicates:
  ;; (next ?a ?b) means object ?a is immediately followed by object ?b in the linear sequence.
  (:predicates
    (next ?a - object ?b - object)
  )

  ;; Three agent-specific actions that move an object ?x to be immediately before object ?y.
  ;; Each action has identical semantics but distinct names to preserve agent-specific capabilities.
  ;; Parameters:
  ;;   ?x  - the object being moved
  ;;   ?y  - the target object before which ?x must be placed
  ;;   ?prex - the object currently immediately before ?x (predecessor of x)
  ;;   ?succx - the object currently immediately after ?x (successor of x)
  ;;   ?prey - the object currently immediately before ?y (predecessor of y)
  ;;
  ;; Preconditions require the explicit predecessor/successor facts so the action can
  ;; unlink ?x from its current place and splice it into the position immediately before ?y.
  ;; Effects remove the previous linkage and install the new adjacency preserving the chain.
  (:action move_before_agent1
    :parameters (?x - object ?y - object ?prex - object ?succx - object ?prey - object)
    :precondition (and
      (next ?prex ?x)
      (next ?x ?succx)
      (next ?prey ?y)
      (not (next ?x ?y))
    )
    :effect (and
      ;; unlink x from its previous predecessor and successor
      (not (next ?prex ?x))
      (not (next ?x ?succx))
      ;; unlink predecessor of y from y (we will place x between them)
      (not (next ?prey ?y))
      ;; relink the chain: predecessor of x -> successor of x
      (next ?prex ?succx)
      ;; predecessor of y -> x, and x -> y
      (next ?prey ?x)
      (next ?x ?y)
    )
  )

  (:action move_before_agent2
    :parameters (?x - object ?y - object ?prex - object ?succx - object ?prey - object)
    :precondition (and
      (next ?prex ?x)
      (next ?x ?succx)
      (next ?prey ?y)
      (not (next ?x ?y))
    )
    :effect (and
      (not (next ?prex ?x))
      (not (next ?x ?succx))
      (not (next ?prey ?y))
      (next ?prex ?succx)
      (next ?prey ?x)
      (next ?x ?y)
    )
  )

  (:action move_before_agent3
    :parameters (?x - object ?y - object ?prex - object ?succx - object ?prey - object)
    :precondition (and
      (next ?prex ?x)
      (next ?x ?succx)
      (next ?prey ?y)
      (not (next ?x ?y))
    )
    :effect (and
      (not (next ?prex ?x))
      (not (next ?x ?succx))
      (not (next ?prey ?y))
      (next ?prex ?succx)
      (next ?prey ?x)
      (next ?x ?y)
    )
  )
)