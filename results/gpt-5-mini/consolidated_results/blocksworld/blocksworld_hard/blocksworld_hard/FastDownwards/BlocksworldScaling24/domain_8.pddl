(define (domain stacking-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent stage)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is directly on ?y (block on block)
    (ontable ?x - block)              ; ?x is directly on the table
    (clear ?x - block)                ; nothing on top of ?x and it is not held
    (holding ?a - agent ?x - block)   ; agent ?a is holding block ?x
    (handempty ?a - agent)            ; agent ?a has an empty hand
    (current ?t - stage)              ; current discrete stage/time
    (succ ?t1 - stage ?t2 - stage)    ; immediate successor relation between stages
  )

  ;; PICKUP: pick a clear block from the table into the agent's hand
  ;; Advances time from ?t to its immediate successor ?tnext.
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
      (not (current ?t))
      (current ?tnext)
    )
  )

  ;; PUTDOWN: put the held block onto the table
  ;; Advances time from ?t to its immediate successor ?tnext.
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
      (not (current ?t))
      (current ?tnext)
    )
  )

  ;; UNSTACK: remove a clear block from on top of another block into the agent's hand
  ;; Advances time from ?t to its immediate successor ?tnext.
  (:action unstack
    :parameters (?a - agent ?x - block ?y - block ?t - stage ?tnext - stage)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty ?a)
      (current ?t)
      (succ ?t ?tnext)
      (not (= ?x ?y))
    )
    :effect (and
      (holding ?a ?x)
      (not (on ?x ?y))
      (not (ontable ?x))
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?a))
      (not (current ?t))
      (current ?tnext)
    )
  )

  ;; STACK: place the held block onto a clear target block
  ;; Advances time from ?t to its immediate successor ?tnext.
  (:action stack
    :parameters (?a - agent ?x - block ?y - block ?t - stage ?tnext - stage)
    :precondition (and
      (holding ?a ?x)
      (clear ?y)
      (current ?t)
      (succ ?t ?tnext)
      (not (= ?x ?y))
    )
    :effect (and
      (on ?x ?y)
      (not (ontable ?x))
      (clear ?x)
      (handempty ?a)
      (not (clear ?y))
      (not (holding ?a ?x))
      (not (current ?t))
      (current ?tnext)
    )
  )
)