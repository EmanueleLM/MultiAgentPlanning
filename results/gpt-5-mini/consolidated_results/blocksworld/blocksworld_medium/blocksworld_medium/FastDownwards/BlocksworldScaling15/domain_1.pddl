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
  )

  ;; Actions namespaced by agent-role prefixes but sharing a single global hand.
  ;; Each action consumes one stage and advances to its successor stage (hard ordering).

  (:action pickup_block_picker
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

  (:action unstack_block_picker
    :parameters (?b - block ?c - block ?from - stage ?to - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (current ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))      ; held block not clear
      (clear ?c)            ; the support becomes clear once top removed
      (not (handempty))
      (holding ?b)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action putdown_stack_manager
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

  (:action stack_stack_manager
    :parameters (?b - block ?c - block ?from - stage ?to - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (current ?from)
      (next ?from ?to)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty)
      (not (holding ?b))
      (not (current ?from))
      (current ?to)
    )
  )
)