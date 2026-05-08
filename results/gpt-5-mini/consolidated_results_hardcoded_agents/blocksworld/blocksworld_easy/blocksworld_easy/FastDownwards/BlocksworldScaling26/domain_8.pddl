(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (hand-empty ?a - agent)
    (holding ?a - agent ?x - block)
    (current-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table into an agent's hand.
  ;; Requires the global stage to progress from ?s to its successor ?s2.
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
      ;; block is no longer on the table
      (not (ontable ?b))
      ;; block is not clear while being held
      (not (clear ?b))
      ;; agent now holds the block, hand no longer empty
      (not (hand-empty ?ag))
      (holding ?ag ?b)
      ;; stage progression: turn off current and enable successor
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Unstack a clear block from on top of another block into an agent's hand.
  ;; Enforces that the supporting block becomes clear after removal.
  (:action unstack
    :parameters (?ag - agent ?b - block ?b_from - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?b_from)
      (clear ?b)
      (hand-empty ?ag)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove the on relation; the supporting block becomes clear
      (not (on ?b ?b_from))
      (clear ?b_from)
      ;; the unstacked block is now held and not clear
      (not (clear ?b))
      (not (hand-empty ?ag))
      (holding ?ag ?b)
      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Put down a block being held onto the table.
  (:action put-down
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?ag ?b)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; block becomes on the table and clear (nothing on top)
      (ontable ?b)
      (clear ?b)
      ;; agent's hand becomes empty and the holding relation is removed
      (hand-empty ?ag)
      (not (holding ?ag ?b))
      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Stack a held block onto a clear target block.
  ;; The target becomes not clear; the stacked block becomes clear (top).
  (:action stack
    :parameters (?ag - agent ?b - block ?b_target - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?ag ?b)
      (clear ?b_target)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; establish on relation and ensure stacked block is not on the table
      (on ?b ?b_target)
      (not (ontable ?b))
      ;; the target is no longer clear; the new top block is clear
      (not (clear ?b_target))
      (clear ?b)
      ;; update agent hand state
      (hand-empty ?ag)
      (not (holding ?ag ?b))
      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)