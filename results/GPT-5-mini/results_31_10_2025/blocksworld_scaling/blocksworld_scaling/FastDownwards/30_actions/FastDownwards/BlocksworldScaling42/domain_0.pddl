(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (is-vowel ?b - block)
    (is-consonant ?b - block)
    (can-move-vowel ?a - agent)
    (can-move-consonant ?a - agent)
  )

  ;; Vowel-moving agent actions
  (:action pickup-vowel
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (is-vowel ?b)
      (can-move-vowel ?ag)
    )
    :effect (and
      (not (ontable ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (not (clear ?b))
    )
  )

  (:action unstack-vowel
    :parameters (?ag - agent ?b - block ?x - block)
    :precondition (and
      (on ?b ?x)
      (clear ?b)
      (handempty ?ag)
      (is-vowel ?b)
      (can-move-vowel ?ag)
    )
    :effect (and
      (not (on ?b ?x))
      (holding ?ag ?b)
      (not (handempty ?ag))
      (clear ?x)
      (not (clear ?b))
    )
  )

  (:action putdown-vowel
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (holding ?ag ?b)
      (is-vowel ?b)
      (can-move-vowel ?ag)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  (:action stack-vowel
    :parameters (?ag - agent ?b - block ?x - block)
    :precondition (and
      (holding ?ag ?b)
      (clear ?x)
      (is-vowel ?b)
      (can-move-vowel ?ag)
    )
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (clear ?x))
    )
  )

  ;; Consonant-moving agent actions
  (:action pickup-consonant
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (is-consonant ?b)
      (can-move-consonant ?ag)
    )
    :effect (and
      (not (ontable ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (not (clear ?b))
    )
  )

  (:action unstack-consonant
    :parameters (?ag - agent ?b - block ?x - block)
    :precondition (and
      (on ?b ?x)
      (clear ?b)
      (handempty ?ag)
      (is-consonant ?b)
      (can-move-consonant ?ag)
    )
    :effect (and
      (not (on ?b ?x))
      (holding ?ag ?b)
      (not (handempty ?ag))
      (clear ?x)
      (not (clear ?b))
    )
  )

  (:action putdown-consonant
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (holding ?ag ?b)
      (is-consonant ?b)
      (can-move-consonant ?ag)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  (:action stack-consonant
    :parameters (?ag - agent ?b - block ?x - block)
    :precondition (and
      (holding ?ag ?b)
      (clear ?x)
      (is-consonant ?b)
      (can-move-consonant ?ag)
    )
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (clear ?x))
    )
  )

)