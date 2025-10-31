(define (domain blocksworld-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block obj)
  (:predicates
    (block ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    ; ?y may be a block or the special table (an obj)
    (on ?x - block ?y - obj)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; Vowel-agent actions: can move only vowel blocks (A E I O)
  ;; These actions operate directly (no hand model), only on top (clear)
  (:action vowel-move-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ;; Consonant-agent actions: use a hand model (pick/unstack/putdown/stack)
  (:action consonant-pickup
    :parameters (?x - block)
    :precondition (and
      (consonant ?x)
      (on ?x table)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (not (on ?x table))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action consonant-unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action consonant-putdown
    :parameters (?x - block)
    :precondition (and
      (consonant ?x)
      (holding ?x)
    )
    :effect (and
      (on ?x table)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  (:action consonant-stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (consonant ?x)
      (holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
    )
  )
)