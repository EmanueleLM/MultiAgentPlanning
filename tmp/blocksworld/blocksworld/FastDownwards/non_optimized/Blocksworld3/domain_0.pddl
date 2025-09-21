(define (domain multi_agent_blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)

    ;; Vowel agent private state (agent-specific predicates to avoid name collisions)
    (holding-vowel ?x - block)
    (handempty-vowel)
  )

  ;; Vowel-agent actions (explicitly namespaced)
  (:action vowel-pickup-from-table
    :parameters (?x - block)
    :precondition (and (vowel ?x) (ontable ?x) (clear ?x) (handempty-vowel))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-vowel))
      (holding-vowel ?x)
    )
  )

  (:action vowel-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x) (handempty-vowel))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty-vowel))
      (holding-vowel ?x)
      (clear ?y)
    )
  )

  (:action vowel-putdown-to-table
    :parameters (?x - block)
    :precondition (and (holding-vowel ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
    )
  )

  (:action vowel-stack-onto
    :parameters (?x - block ?y - block)
    :precondition (and (holding-vowel ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
      (not (clear ?y))
    )
  )

  ;; Consonant-agent actions (explicitly namespaced)
  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (consonant ?from)
      (consonant ?to)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (not (clear ?to))
      (on ?b ?to)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (consonant ?to)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?to))
      (on ?b ?to)
      (clear ?b)
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (consonant ?from)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )
)