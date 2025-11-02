(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)        ; block ?x is on block ?y
    (ontable ?x - block)              ; block ?x is on the table
    (clear ?x - block)                ; nothing on top of ?x and not held
    (holding ?ag - agent ?x - block)  ; agent ?ag is holding block ?x
    (handempty ?ag - agent)           ; agent ?ag's hand is empty
    (vowel ?x - block)                ; block is vowel
    (consonant ?x - block)            ; block is consonant
    (vowel-agent ?ag - agent)         ; agent is vowel agent
    (consonant-agent ?ag - agent)     ; agent is consonant agent
  )

  ;; Vowel agent actions: can only manipulate vowel-labelled blocks (A E I)
  (:action vowel-pickup
    :parameters (?ag - agent ?x - block)
    :precondition (and
      (vowel-agent ?ag)
      (handempty ?ag)
      (ontable ?x)
      (clear ?x)
      (vowel ?x)
    )
    :effect (and
      (holding ?ag ?x)
      (not (ontable ?x))
      (not (clear ?x))       ; when held it is not considered clear
      (not (handempty ?ag))
    )
  )

  (:action vowel-unstack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and
      (vowel-agent ?ag)
      (on ?x ?y)
      (clear ?x)
      (handempty ?ag)
      (vowel ?x)
    )
    :effect (and
      (holding ?ag ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty ?ag))
      (not (clear ?x))
    )
  )

  (:action vowel-stack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and
      (vowel-agent ?ag)
      (holding ?ag ?x)
      (clear ?y)
      (vowel ?x)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty ?ag)
      (not (holding ?ag ?x))
      (not (clear ?y))
    )
  )

  (:action vowel-putdown
    :parameters (?ag - agent ?x - block)
    :precondition (and
      (vowel-agent ?ag)
      (holding ?ag ?x)
      (vowel ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?ag)
      (not (holding ?ag ?x))
    )
  )

  ;; Consonant agent actions: can only manipulate consonant-labelled blocks (B C D F G H J K L)
  (:action consonant-pickup
    :parameters (?ag - agent ?x - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?ag))
    )
  )

  (:action consonant-unstack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty ?ag))
    )
  )

  (:action consonant-stack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and
      (consonant-agent ?ag)
      (holding ?ag ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty ?ag)
      (not (holding ?ag ?x))
      (not (clear ?y))
    )
  )

  (:action consonant-putdown
    :parameters (?ag - agent ?x - block)
    :precondition (and
      (consonant-agent ?ag)
      (holding ?ag ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?ag)
      (not (holding ?ag ?x))
    )
  )
)