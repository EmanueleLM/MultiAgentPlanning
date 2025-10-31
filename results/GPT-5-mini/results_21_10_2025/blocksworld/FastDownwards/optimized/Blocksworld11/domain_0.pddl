(define (domain multi-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)

  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)
    (can-move ?ag - agent ?b - block)
    (vowel-agent ?ag - agent)
    (consonant-agent ?ag - agent)
  )

  ;; Actions for the vowel agent (restricted to agents declared as vowel-agent)
  (:action vowel-pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (vowel-agent ?ag)
      (handempty ?ag)
      (ontable ?b)
      (clear ?b)
      (can-move ?ag ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (not (clear ?b))
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
      (not (clear ?b))
    )
  )

  (:action vowel-putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (vowel-agent ?ag)
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
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

  ;; Actions for the consonant agent (restricted to agents declared as consonant-agent)
  (:action consonant-pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (consonant-agent ?ag)
      (handempty ?ag)
      (ontable ?b)
      (clear ?b)
      (can-move ?ag ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (not (clear ?b))
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
      (not (clear ?b))
    )
  )

  (:action consonant-putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (consonant-agent ?ag)
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
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