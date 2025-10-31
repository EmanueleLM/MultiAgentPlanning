(define (domain orchestrated_blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)             ; block x is on block y
    (ontable ?x - block)                   ; block x is on the table
    (clear ?x - block)                     ; nothing on top of block x and x is not held
    (handempty)                            ; global single hand is empty
    (holding ?ag - agent ?x - block)       ; agent ?ag is holding block ?x
    (vowel ?x - block)                     ; block is vowel (A,E,I)
    (consonant ?x - block)                 ; block is consonant (others)
    (is-vowel-agent ?ag - agent)           ; agent is the vowel agent
    (is-consonant-agent ?ag - agent)       ; agent is the consonant agent
  )

  ;; Unstack a block (take top block from another block) -- vowel agent
  (:action unstack-vowel
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and
      (is-vowel-agent ?ag)
      (vowel ?b)
      (on ?b ?under)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?under))
      (holding ?ag ?b)
      (not (handempty))
      (clear ?under)
      (not (clear ?b))
    )
  )

  ;; Unstack -- consonant agent
  (:action unstack-cons
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and
      (is-consonant-agent ?ag)
      (consonant ?b)
      (on ?b ?under)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?under))
      (holding ?ag ?b)
      (not (handempty))
      (clear ?under)
      (not (clear ?b))
    )
  )

  ;; Pick up a block from the table -- vowel agent
  (:action pickup-vowel
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (is-vowel-agent ?ag)
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?ag ?b)
      (not (handempty))
      (not (clear ?b))
    )
  )

  ;; Pick up a block from the table -- consonant agent
  (:action pickup-cons
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (is-consonant-agent ?ag)
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?ag ?b)
      (not (handempty))
      (not (clear ?b))
    )
  )

  ;; Put down a held block onto the table -- vowel agent
  (:action putdown-vowel
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (is-vowel-agent ?ag)
      (vowel ?b)
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?ag ?b))
    )
  )

  ;; Put down a held block onto the table -- consonant agent
  (:action putdown-cons
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (is-consonant-agent ?ag)
      (consonant ?b)
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?ag ?b))
    )
  )

  ;; Stack a held block on top of another block -- vowel agent
  (:action stack-vowel
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (is-vowel-agent ?ag)
      (vowel ?b)
      (holding ?ag ?b)
      (clear ?to)
    )
    :effect (and
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
      (handempty)
      (not (holding ?ag ?b))
    )
  )

  ;; Stack a held block on top of another block -- consonant agent
  (:action stack-cons
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (is-consonant-agent ?ag)
      (consonant ?b)
      (holding ?ag ?b)
      (clear ?to)
    )
    :effect (and
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
      (handempty)
      (not (holding ?ag ?b))
    )
  )
)