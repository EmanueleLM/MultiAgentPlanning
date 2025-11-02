(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel_block consonant_block - block
          agent)

  (:predicates
    (ontable ?b - block)
    (on ?b - block ?x - block)
    (clear ?b - block)
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)
    (vowel-agent ?ag - agent)
    (consonant-agent ?ag - agent)
  )

  ;; Vowel-agent actions: can manipulate only vowel_block objects.
  (:action vowel_pickup
    :parameters (?ag - agent ?b - vowel_block)
    :precondition (and (vowel-agent ?ag) (clear ?b) (ontable ?b) (handempty ?ag))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
            )
  )

  (:action vowel_putdown
    :parameters (?ag - agent ?b - vowel_block)
    :precondition (and (vowel-agent ?ag) (holding ?ag ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
            )
  )

  (:action vowel_stack
    :parameters (?ag - agent ?b - vowel_block ?c - block)
    :precondition (and (vowel-agent ?ag) (holding ?ag ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
              (not (clear ?c))
            )
  )

  (:action vowel_unstack
    :parameters (?ag - agent ?b - vowel_block ?c - block)
    :precondition (and (vowel-agent ?ag) (on ?b ?c) (clear ?b) (handempty ?ag))
    :effect (and
              (holding ?ag ?b)
              (not (on ?b ?c))
              (clear ?c)
              (not (clear ?b))
              (not (handempty ?ag))
            )
  )

  ;; Consonant-agent actions: can manipulate only consonant_block objects.
  (:action consonant_pickup
    :parameters (?ag - agent ?b - consonant_block)
    :precondition (and (consonant-agent ?ag) (clear ?b) (ontable ?b) (handempty ?ag))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
            )
  )

  (:action consonant_putdown
    :parameters (?ag - agent ?b - consonant_block)
    :precondition (and (consonant-agent ?ag) (holding ?ag ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
            )
  )

  (:action consonant_stack
    :parameters (?ag - agent ?b - consonant_block ?c - block)
    :precondition (and (consonant-agent ?ag) (holding ?ag ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
              (not (clear ?c))
            )
  )

  (:action consonant_unstack
    :parameters (?ag - agent ?b - consonant_block ?c - block)
    :precondition (and (consonant-agent ?ag) (on ?b ?c) (clear ?b) (handempty ?ag))
    :effect (and
              (holding ?ag ?b)
              (not (on ?b ?c))
              (clear ?c)
              (not (clear ?b))
              (not (handempty ?ag))
            )
  )
)