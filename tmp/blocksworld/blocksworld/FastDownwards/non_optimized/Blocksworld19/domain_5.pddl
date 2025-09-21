(define (domain blocks-multiagent)
  (:requirements :strips :typing)
  (:types block agent)

  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (vowel-agent ?ag - agent)
    (consonant-agent ?ag - agent)
  )

  (:action vowel-pick-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (vowel-agent ?ag)
      (handempty ?ag)
      (ontable ?b)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action vowel-pick-from-block
    :parameters (?ag - agent ?b - block ?x - block)
    :precondition (and
      (vowel-agent ?ag)
      (handempty ?ag)
      (on ?b ?x)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (not (on ?b ?x))
      (clear ?x)
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action vowel-put-on-table
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

  (:action vowel-put-on-block
    :parameters (?ag - agent ?b - block ?x - block)
    :precondition (and
      (vowel-agent ?ag)
      (holding ?ag ?b)
      (clear ?x)
    )
    :effect (and
      (on ?b ?x)
      (not (clear ?x))
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  (:action cons-pick-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (consonant-agent ?ag)
      (handempty ?ag)
      (ontable ?b)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action cons-pick-from-block
    :parameters (?ag - agent ?b - block ?x - block)
    :precondition (and
      (consonant-agent ?ag)
      (handempty ?ag)
      (on ?b ?x)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (not (on ?b ?x))
      (clear ?x)
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action cons-put-on-table
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

  (:action cons-put-on-block
    :parameters (?ag - agent ?b - block ?x - block)
    :precondition (and
      (consonant-agent ?ag)
      (holding ?ag ?b)
      (clear ?x)
    )
    :effect (and
      (on ?b ?x)
      (not (clear ?x))
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )
)