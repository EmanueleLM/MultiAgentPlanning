(define (domain blocksworld-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)       ; ?x is directly on ?y
    (ontable ?x - block)             ; ?x is on the table
    (clear ?x - block)               ; nothing is on top of ?x and it is not being held
    (handempty)                      ; the single hand is empty
    (holding ?x - block)             ; the single hand is holding block ?x
    (current ?s - stage)             ; the current discrete stage/time is ?s
    (next ?s1 - stage ?s2 - stage)   ; successor relation between stages
    (diff ?a - block ?b - block)     ; static relation: two blocks are distinct
  )

  ;; Actions namespaced by agent-role prefixes.
  ;; Each action requires the current stage and advances to its successor stage,
  ;; enforcing strict ordered progression (no oscillation or slack).

  (:action block_picker_pickup
    :parameters (?b - block ?from - stage ?to - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))      ; a held block is not clear
      (not (handempty))
      (holding ?b)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action block_picker_unstack
    :parameters (?b - block ?c - block ?from - stage ?to - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (current ?from)
      (next ?from ?to)
      (diff ?b ?c)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))      ; held block not clear
      (clear ?c)            ; support becomes clear once top removed
      (not (handempty))
      (holding ?b)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action stack_manager_putdown
    :parameters (?b - block ?from - stage ?to - stage)
    :precondition (and
      (holding ?b)
      (current ?from)
      (next ?from ?to)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?from))
      (current ?to)
    )
  )

  (:action stack_manager_stack
    :parameters (?b - block ?c - block ?from - stage ?to - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (current ?from)
      (next ?from ?to)
      (diff ?b ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty)
      (not (holding ?b))
      (not (ontable ?b))
      (not (current ?from))
      (current ?to)
    )
  )
)