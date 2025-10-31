(define (domain blocks-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)        ; block x is on block y
    (ontable ?x - block)              ; block x is on the table
    (top ?x - block)                  ; block x is top-of-stack (no block on x)
    (holding ?ag - agent ?x - block)  ; agent is holding block x
    (handempty ?ag - agent)           ; agent's hand is empty
    (is-vowel ?b - block)             ; block is vowel-type
    (is-consonant ?b - block)         ; block is consonant-type
    (vowel-agent ?ag - agent)         ; agent is a vowel agent
    (consonant-agent ?ag - agent)     ; agent is a consonant agent
  )

  ;; Vowel-agent actions (namespaced with "vowel-")
  (:action vowel-unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (vowel-agent ?ag)
      (is-vowel ?b)
      (on ?b ?c)
      (top ?b)
      (handempty ?ag)
    )
    :effect (and
      (not (on ?b ?c))
      (holding ?ag ?b)
      (not (top ?b))
      (top ?c)
      (not (handempty ?ag))
    )
  )

  (:action vowel-pickup-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (vowel-agent ?ag)
      (is-vowel ?b)
      (ontable ?b)
      (top ?b)
      (handempty ?ag)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?ag ?b)
      (not (top ?b))
      (not (handempty ?ag))
    )
  )

  (:action vowel-stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (vowel-agent ?ag)
      (is-vowel ?b)
      (holding ?ag ?b)
      (top ?c)                         ; can only stack onto a top-of-stack block
    )
    :effect (and
      (not (holding ?ag ?b))
      (on ?b ?c)
      (top ?b)
      (not (top ?c))
      (handempty ?ag)
    )
  )

  (:action vowel-putdown-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (vowel-agent ?ag)
      (is-vowel ?b)
      (holding ?ag ?b)
    )
    :effect (and
      (not (holding ?ag ?b))
      (ontable ?b)
      (top ?b)
      (handempty ?ag)
    )
  )

  ;; Consonant-agent actions (namespaced with "consonant-")
  (:action consonant-unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (consonant-agent ?ag)
      (is-consonant ?b)
      (on ?b ?c)
      (top ?b)
      (handempty ?ag)
    )
    :effect (and
      (not (on ?b ?c))
      (holding ?ag ?b)
      (not (top ?b))
      (top ?c)
      (not (handempty ?ag))
    )
  )

  (:action consonant-pickup-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (consonant-agent ?ag)
      (is-consonant ?b)
      (ontable ?b)
      (top ?b)
      (handempty ?ag)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?ag ?b)
      (not (top ?b))
      (not (handempty ?ag))
    )
  )

  (:action consonant-stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (consonant-agent ?ag)
      (is-consonant ?b)
      (holding ?ag ?b)
      (top ?c)
    )
    :effect (and
      (not (holding ?ag ?b))
      (on ?b ?c)
      (top ?b)
      (not (top ?c))
      (handempty ?ag)
    )
  )

  (:action consonant-putdown-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (consonant-agent ?ag)
      (is-consonant ?b)
      (holding ?ag ?b)
    )
    :effect (and
      (not (holding ?ag ?b))
      (ontable ?b)
      (top ?b)
      (handempty ?ag)
    )
  )
)