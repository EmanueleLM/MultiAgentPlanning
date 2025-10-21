(define (domain blocks-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (agent ?ag - agent)
    (vowel-agent ?ag - agent)
    (consonant-agent ?ag - agent)

    (vowel ?b - block)
    (consonant ?b - block)

    (ontable ?b - block)
    (on ?b - block ?under - block)
    (clear ?b - block)

    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)
  )

  ;; Vowel-agent actions (namespaced with "vowel-")
  (:action vowel-pick-up-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (agent ?ag)
      (vowel-agent ?ag)
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action vowel-unstack
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and
      (agent ?ag)
      (vowel-agent ?ag)
      (vowel ?b)
      (on ?b ?under)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action vowel-put-down
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (agent ?ag)
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
    :parameters (?ag - agent ?b - block ?dest - block)
    :precondition (and
      (agent ?ag)
      (vowel-agent ?ag)
      (holding ?ag ?b)
      (clear ?dest)
    )
    :effect (and
      (on ?b ?dest)
      (clear ?b)
      (not (clear ?dest))
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  ;; Consonant-agent actions (namespaced with "cons-")
  (:action cons-pick-up-from-table
    :parameters (?ag - agent ?x - block)
    :precondition (and
      (agent ?ag)
      (consonant-agent ?ag)
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (handempty ?ag)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?ag))
      (holding ?ag ?x)
    )
  )

  (:action cons-unstack
    :parameters (?ag - agent ?x - block ?from - block)
    :precondition (and
      (agent ?ag)
      (consonant-agent ?ag)
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (handempty ?ag)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (not (clear ?x))
      (not (handempty ?ag))
      (holding ?ag ?x)
    )
  )

  (:action cons-put-down
    :parameters (?ag - agent ?x - block)
    :precondition (and
      (agent ?ag)
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

  (:action cons-stack
    :parameters (?ag - agent ?x - block ?dest - block)
    :precondition (and
      (agent ?ag)
      (consonant-agent ?ag)
      (holding ?ag ?x)
      (clear ?dest)
    )
    :effect (and
      (on ?x ?dest)
      (clear ?x)
      (not (clear ?dest))
      (handempty ?ag)
      (not (holding ?ag ?x))
    )
  )
)