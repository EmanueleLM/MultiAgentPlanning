(define (domain multi-agent-blocks-with-slots)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block slot)

  (:predicates
    (on ?b - block ?c - block)            ; block b is on block c
    (ontable ?b - block ?s - slot)       ; block b is on table slot s (bottom of a stack)
    (clear ?b - block)                   ; no block on top of b
    (holding ?ag - agent ?b - block)     ; agent ag is holding block b
    (handempty ?ag - agent)              ; agent ag's hand is empty
    (can-move ?ag - agent ?b - block)    ; agent ag is allowed to manipulate block b
    (vowel-agent ?ag - agent)            ; agent is the vowel agent
    (consonant-agent ?ag - agent)        ; agent is the consonant agent
    (slot-free ?s - slot)                ; table slot s currently free (no bottom block)
  )

  ; Vowel agent actions
  (:action vowel-pickup
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (vowel-agent ?ag)
      (handempty ?ag)
      (ontable ?b ?s)
      (clear ?b)
      (can-move ?ag ?b)
    )
    :effect (and
      (not (ontable ?b ?s))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (slot-free ?s)
    )
  )

  (:action vowel-unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (vowel-agent ?ag)
      (handempty ?ag)
      (on ?b ?c)
      (clear ?b)
      (can-move ?ag ?b)
    )
    :effect (and
      (not (on ?b ?c))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (clear ?c)
    )
  )

  (:action vowel-putdown
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (vowel-agent ?ag)
      (holding ?ag ?b)
      (slot-free ?s)
    )
    :effect (and
      (ontable ?b ?s)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (slot-free ?s))
    )
  )

  (:action vowel-stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (vowel-agent ?ag)
      (holding ?ag ?b)
      (clear ?c)
      (can-move ?ag ?b)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (clear ?c))
    )
  )

  ; Consonant agent actions
  (:action consonant-pickup
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (consonant-agent ?ag)
      (handempty ?ag)
      (ontable ?b ?s)
      (clear ?b)
      (can-move ?ag ?b)
    )
    :effect (and
      (not (ontable ?b ?s))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (slot-free ?s)
    )
  )

  (:action consonant-unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (consonant-agent ?ag)
      (handempty ?ag)
      (on ?b ?c)
      (clear ?b)
      (can-move ?ag ?b)
    )
    :effect (and
      (not (on ?b ?c))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (clear ?c)
    )
  )

  (:action consonant-putdown
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (consonant-agent ?ag)
      (holding ?ag ?b)
      (slot-free ?s)
    )
    :effect (and
      (ontable ?b ?s)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (slot-free ?s))
    )
  )

  (:action consonant-stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (consonant-agent ?ag)
      (holding ?ag ?b)
      (clear ?c)
      (can-move ?ag ?b)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (clear ?c))
    )
  )
)