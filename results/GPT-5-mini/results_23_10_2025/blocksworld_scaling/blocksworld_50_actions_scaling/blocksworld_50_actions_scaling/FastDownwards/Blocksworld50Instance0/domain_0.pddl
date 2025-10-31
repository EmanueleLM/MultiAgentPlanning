(define (domain multi-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block robot)

  ;; Predicates
  (:predicates
    (on ?x - block ?y - block)        ; ?x is immediately on ?y
    (ontable ?x - block)              ; ?x is on the table
    (clear ?x - block)                ; nothing on ?x
    (holding ?r - robot ?x - block)   ; robot r holds block x
    (handempty ?r - robot)            ; robot r holds nothing
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Action schemas parameterized by robot so logs / responsibility can be
  ;; expressed: actions require the acting robot to be handempty when picking,
  ;; and holding when putting/stacking. The domain supports two robots:
  ;; robot1 and robot2. (Planner will schedule one action at a time.)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; pickup from table
  (:action pickup
    :parameters (?r - robot ?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty ?r))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))          ; block being held is no longer clear
      (not (handempty ?r))
      (holding ?r ?x)
    )
  )

  ;; unstack a block from another block
  (:action unstack
    :parameters (?r - robot ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty ?r))
    :effect (and
      (not (on ?x ?y))
      (clear ?y)                ; the block under becomes clear
      (not (clear ?x))
      (not (handempty ?r))
      (holding ?r ?x)
    )
  )

  ;; putdown the held block to the table
  (:action putdown
    :parameters (?r - robot ?x - block)
    :precondition (and (holding ?r ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?r)
      (not (holding ?r ?x))
    )
  )

  ;; stack the held block onto another clear block
  (:action stack
    :parameters (?r - robot ?x - block ?y - block)
    :precondition (and (holding ?r ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty ?r)
      (not (holding ?r ?x))
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; NOTES / LOG ANNOTATIONS (comments):
  ;; - The recorded verified logs involved two robots (robot1 and robot2).
  ;; - The domain actions above are parameterized by robot so the planner can
  ;;   generate actions like (unstack robot1 I C) or (putdown robot2 I).
  ;; - The integrated execution used to derive the goal arrangement treated
  ;;   the verified per-robot steps as globally-applied actions (one robot at a
  ;;   time), resolving the agents' local-view discrepancies by accepting the
  ;;   observed effects that were reported as legal.
  ;;
  ;; Example observed actions (for traceability -- not part of domain semantics):
  ;; ; robot_1: (unstack robot1 I C)   -- legal in its log (it held I)
  ;; ; robot_2: (putdown robot2 I)     -- sequence of putdown/stack actions
  ;; ; robot_2 executed the main sequence that yields the final arrangement.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

)