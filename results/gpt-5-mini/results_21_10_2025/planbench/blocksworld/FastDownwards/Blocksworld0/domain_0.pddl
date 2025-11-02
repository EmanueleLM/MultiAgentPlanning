; Domain: blocksworld-multiagent
; Assumptions:
; - The universe of objects for each problem is limited to the blocks listed in that problem.
; - clear(X) means: X has no block on top of it AND X is not currently being held.
; - There is a single hand (handempty/holding) and only one block can be held at a time.
; - putdown/put-down/putdown actions always place a block on the table and make it clear.
; - Both agents (block_player1 and block_player2) share identical primitive capabilities.
; - To keep agent-origin actions distinct, two sets of actions are provided with suffixes _p1 and _p2;
;   their preconditions and effects are semantically identical.
(define (domain blocksworld-multiagent)
  (:requirements :typing :negative-preconditions :strips)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ; ---- Actions for block_player1 ----
  (:action unstack_p1
    :parameters (?x - block ?y - block)
    :precondition (and (handempty) (on ?x ?y) (clear ?x))
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (handempty))
              (not (clear ?x))
            )
  )

  (:action putdown_p1
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (ontable ?x)
              (handempty)
              (clear ?x)
              (not (holding ?x))
            )
  )

  (:action pickup_p1
    :parameters (?x - block)
    :precondition (and (handempty) (ontable ?x) (clear ?x))
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (handempty))
              (not (clear ?x))
            )
  )

  (:action stack_p1
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (handempty)
              (clear ?x)
              (not (holding ?x))
              (not (clear ?y))
            )
  )

  ; ---- Actions for block_player2 ----
  (:action unstack_p2
    :parameters (?x - block ?y - block)
    :precondition (and (handempty) (on ?x ?y) (clear ?x))
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (handempty))
              (not (clear ?x))
            )
  )

  (:action putdown_p2
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (ontable ?x)
              (handempty)
              (clear ?x)
              (not (holding ?x))
            )
  )

  (:action pickup_p2
    :parameters (?x - block)
    :precondition (and (handempty) (ontable ?x) (clear ?x))
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (handempty))
              (not (clear ?x))
            )
  )

  (:action stack_p2
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (handempty)
              (clear ?x)
              (not (holding ?x))
              (not (clear ?y))
            )
  )
)