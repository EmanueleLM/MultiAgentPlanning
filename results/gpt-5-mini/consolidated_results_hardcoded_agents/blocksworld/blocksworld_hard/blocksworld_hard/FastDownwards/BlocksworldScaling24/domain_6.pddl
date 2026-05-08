(define (domain stacking-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent stage)

  (:predicates
    ;; spatial relations
    (on ?x - block ?y - block)        ; ?x is directly on ?y (both blocks)
    (ontable ?x - block)              ; ?x is directly on the table

    ;; clearance and holding
    (clear ?x - block)                ; nothing on top of ?x and it is not held
    (holding ?a - agent ?x - block)   ; agent ?a is holding block ?x
    (handempty ?a - agent)            ; agent ?a has an empty hand

    ;; explicit discrete stage progression (ordered time steps)
    (current ?t - stage)              ; the world is at stage ?t
    (succ ?t1 - stage ?t2 - stage)    ; ?t2 is the immediate successor of ?t1
  )

  ;; Actions consume the current stage and advance to its immediate successor,
  ;; enforcing one action per stage and strict ordering.

  ;; PICKUP: pick a clear block from the table into the agent's hand
  (:action pickup
    :parameters (?a - agent ?x - block ?t - stage ?tnext - stage)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty ?a)
      (current ?t)
      (succ ?t ?tnext)
    )
    :effect (and
      (holding ?a ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?a))

      ;; advance stage
      (not (current ?t))
      (current ?tnext)
    )
  )

  ;; PUTDOWN: put the held block onto the table
  (:action putdown
    :parameters (?a - agent ?x - block ?t - stage ?tnext - stage)
    :precondition (and
      (holding ?a ?x)
      (current ?t)
      (succ ?t ?tnext)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?a)
      (not (holding ?a ?x))

      ;; advance stage
      (not (current ?t))
      (current ?tnext)
    )
  )

  ;; UNSTACK: remove a clear block from on top of another block into the agent's hand
  (:action unstack
    :parameters (?a - agent ?x - block ?y - block ?t - stage ?tnext - stage)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty ?a)
      (current ?t)
      (succ ?t ?tnext)
    )
    :effect (and
      (holding ?a ?x)
      (not (on ?x ?y))
      (not (ontable ?x))
      (clear ?y)           ; support becomes clear after removal
      (not (clear ?x))     ; held block is not clear
      (not (handempty ?a))

      ;; advance stage
      (not (current ?t))
      (current ?tnext)
    )
  )

  ;; STACK: place the held block onto a clear target block
  (:action stack
    :parameters (?a - agent ?x - block ?y - block ?t - stage ?tnext - stage)
    :precondition (and
      (holding ?a ?x)
      (clear ?y)
      (current ?t)
      (succ ?t ?tnext)
    )
    :effect (and
      (on ?x ?y)
      (not (ontable ?x))
      (clear ?x)           ; newly placed top block has nothing on top
      (handempty ?a)
      (not (clear ?y))     ; support block is no longer clear
      (not (holding ?a ?x))

      ;; advance stage
      (not (current ?t))
      (current ?tnext)
    )
  )
)