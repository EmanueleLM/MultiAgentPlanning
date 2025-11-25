(define (domain stacking-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent stage)

  (:predicates
    ;; relations among blocks
    (on ?x - block ?y - block)        ; ?x is directly on ?y (block on block)
    (ontable ?x - block)              ; ?x is directly on the table
    (clear ?x - block)                ; nothing on top of ?x and it is not held
    ;; agent hand state
    (holding ?a - agent ?x - block)   ; agent ?a is holding block ?x
    (handempty ?a - agent)            ; agent ?a has an empty hand
    ;; discrete time / stage bookkeeping
    (current ?t - stage)              ; the world is currently at stage ?t
    (succ ?t1 - stage ?t2 - stage)    ; immediate successor relation between stages
  )

  ;;; Notes (comments only): 
  ;;; - All actions advance the single global current stage to its immediate successor.
  ;;;   This enforces contiguous stage occupancy: every action consumes the current
  ;;;   stage and produces its successor as current.
  ;;; - Single-handedness is enforced by the handempty/holding pair per agent:
  ;;;   an agent may perform pickup/unstack only when its handempty predicate holds,
  ;;;   and actions set/unset holding and handempty so no agent can hold >1 block.
  ;;; - "clear" is used as an explicit fluent and is maintained by action effects:
  ;;;   a block is made not clear when it is held or when a block is stacked on it,
  ;;;   and is made clear when that top block is removed or when a held block is put on the table.
  ;;; - There are no bookkeeping tokens or quotas beyond the explicit stage progression
  ;;;   and hand predicates above.

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
      (clear ?y)            ; removing ?x makes ?y clear
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