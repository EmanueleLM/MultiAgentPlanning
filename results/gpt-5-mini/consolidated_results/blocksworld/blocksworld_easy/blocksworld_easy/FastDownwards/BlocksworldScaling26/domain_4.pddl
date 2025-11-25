(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block stage)

  (:predicates
    (on ?x - block ?y - block)         ; ?x is directly on ?y
    (ontable ?x - block)               ; ?x is on the table
    (clear ?x - block)                 ; no block on ?x and ?x is not being held
    (hand-empty ?a - agent)            ; agent's hand is empty
    (holding ?a - agent ?x - block)    ; agent is holding block ?x
    (current-stage ?s - stage)         ; global stage token: current step
    (next ?s1 - stage ?s2 - stage)     ; successor relation between stages
  )

  ;; Pick up a clear block from the table. Advances the global stage token.
  ;; Preconditions ensure the block is on the table, clear, and the agent's hand is empty.
  (:action pick-up
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (hand-empty ?ag)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; block is no longer on the table and is being held
      (not (ontable ?b))
      (not (clear ?b))
      (not (hand-empty ?ag))
      (holding ?ag ?b)

      ;; advance the stage token (enforces strict global sequencing)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Unstack a clear block that is on another block. Advances the global stage token.
  ;; Requires the block to actually be on the specified supporting block and the agent's hand empty.
  (:action unstack
    :parameters (?ag - agent ?b - block ?b_from - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?b_from)
      (clear ?b)
      (hand-empty ?ag)
      (current-stage ?s)
      (next ?s ?s2)
      (not (= ?b ?b_from))
    )
    :effect (and
      ;; remove the on relation, the supporting block becomes clear,
      ;; the unstacked block is held (and therefore not clear)
      (not (on ?b ?b_from))
      (clear ?b_from)
      (not (clear ?b))
      (not (hand-empty ?ag))
      (holding ?ag ?b)
      (not (ontable ?b)) ;; ensure consistency: held block is not on the table

      ;; advance the stage token
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Put down a block being held onto the table. Advances the global stage token.
  (:action put-down
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?ag ?b)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; block is now on the table and is clear (nothing on top)
      (ontable ?b)
      (clear ?b)
      (hand-empty ?ag)
      (not (holding ?ag ?b))
      (not (on ?b ?_)) ;; no specific other on facts for ?b remain: conservative removal of being on any block is modeled only for known pairs in actions

      ;; advance the stage token
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Stack a held block onto a clear target block. Advances the global stage token.
  (:action stack
    :parameters (?ag - agent ?b - block ?b_target - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?ag ?b)
      (clear ?b_target)
      (current-stage ?s)
      (next ?s ?s2)
      (not (= ?b ?b_target))
    )
    :effect (and
      ;; place ?b on ?b_target: target no longer clear, placed block becomes clear
      (not (holding ?ag ?b))
      (not (clear ?b_target))
      (hand-empty ?ag)
      (on ?b ?b_target)
      (clear ?b)
      (not (ontable ?b))

      ;; advance the stage token
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)