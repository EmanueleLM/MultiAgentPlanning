(define (domain multi-agent-chain)
  (:requirements :strips :typing)
  (:types agent obj)

  (:predicates
    (agent ?a - agent)
    (next ?x - obj ?y - obj)       ; x is immediately before y in the chain
    (succ-free ?x - obj)           ; x currently has no successor
    (pred-free ?x - obj)           ; x currently has no predecessor
    (remembered ?x - obj)          ; auxiliary memory predicate (used by "memory" action)
  )

  ;; Action: paltry
  ;; Link a successor-free parent to a predecessor-free child
  (:action paltry
    :parameters (?ag - agent ?parent - obj ?child - obj)
    :precondition (and (agent ?ag) (succ-free ?parent) (pred-free ?child))
    :effect (and
      (next ?parent ?child)
      (not (succ-free ?parent))
      (not (pred-free ?child))
    )
  )

  ;; Action: clip
  ;; Cut an existing link parent->child, producing free slots
  (:action clip
    :parameters (?ag - agent ?parent - obj ?child - obj)
    :precondition (and (agent ?ag) (next ?parent ?child))
    :effect (and
      (not (next ?parent ?child))
      (succ-free ?parent)
      (pred-free ?child)
    )
  )

  ;; Action: sip
  ;; Reattach a child from src-parent to target-parent in one step (requires target-parent to be succ-free)
  ;; Effect removes the old link and creates the new link, updating succ-free flags.
  (:action sip
    :parameters (?ag - agent ?src - obj ?target - obj ?child - obj)
    :precondition (and (agent ?ag) (next ?src ?child) (succ-free ?target))
    :effect (and
      (not (next ?src ?child))
      (next ?target ?child)
      (succ-free ?src)
      (not (succ-free ?target))
      ;; pred-free for child remains false (it still has a predecessor)
    )
  )

  ;; Action: wretched
  ;; Swap the successors of two parents (requires both parents to have distinct successors)
  (:action wretched
    :parameters (?ag - agent ?p1 - obj ?c1 - obj ?p2 - obj ?c2 - obj)
    :precondition (and (agent ?ag) (next ?p1 ?c1) (next ?p2 ?c2))
    :effect (and
      (not (next ?p1 ?c1))
      (not (next ?p2 ?c2))
      (next ?p1 ?c2)
      (next ?p2 ?c1)
    )
  )

  ;; Action: memory
  ;; Record a remembered flag for an object (no-op wrt chain topology; used for modeling bookkeeping constraints)
  (:action memory
    :parameters (?ag - agent ?o - obj)
    :precondition (and (agent ?ag))
    :effect (and
      (remembered ?o)
    )
  )

  ;; Action: tightfisted
  ;; Reserve a parent so it cannot receive a successor (models a hard constraint about availability).
  ;; Implemented as setting a special succ-free false by consuming succ-free if present; this action is allowed only if parent currently succ-free.
  (:action tightfisted
    :parameters (?ag - agent ?p - obj)
    :precondition (and (agent ?ag) (succ-free ?p))
    :effect (and
      ;; make parent not succ-free by consuming succ-free; no successor is added here,
      ;; so this models an unavailable slot that cannot be linked until some other action restores succ-free.
      (not (succ-free ?p))
    )
  )
)