(define (domain multiagent-blocks)
  (:requirements :strips)
  (:predicates
    (on ?b ?x)            ; block ?b is directly on object ?x (block or stack)
    (clear ?x)            ; object ?x (block) has nothing on top
    (stack ?s)            ; object ?s is a stack/place
    (block ?b)            ; object ?b is a block
    (consonant ?b)        ; block ?b is a consonant
    (vowel ?b)            ; block ?b is a vowel
    (movable ?b)          ; consonant ?b is allowed to be moved by the consonant agent
  )

  ; Consonant moves: four variants depending on whether source/target are block or stack
  (:action move-consonant-block-block
    :parameters (?b ?from ?to)
    :precondition (and
      (consonant ?b) (movable ?b)
      (block ?from) (block ?to)
      (on ?b ?from)
      (clear ?b) (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-consonant-block-stack
    :parameters (?b ?from ?to)
    :precondition (and
      (consonant ?b) (movable ?b)
      (block ?from) (stack ?to)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
    )
  )

  (:action move-consonant-stack-block
    :parameters (?b ?from ?to)
    :precondition (and
      (consonant ?b) (movable ?b)
      (stack ?from) (block ?to)
      (on ?b ?from)
      (clear ?b) (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action move-consonant-stack-stack
    :parameters (?b ?from ?to)
    :precondition (and
      (consonant ?b) (movable ?b)
      (stack ?from) (stack ?to)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
    )
  )

  ; Vowel moves: same four variants but restricted to vowels (vowel agent)
  (:action move-vowel-block-block
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (block ?from) (block ?to)
      (on ?b ?from)
      (clear ?b) (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-vowel-block-stack
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (block ?from) (stack ?to)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
    )
  )

  (:action move-vowel-stack-block
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (stack ?from) (block ?to)
      (on ?b ?from)
      (clear ?b) (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action move-vowel-stack-stack
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (stack ?from) (stack ?to)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
    )
  )
)