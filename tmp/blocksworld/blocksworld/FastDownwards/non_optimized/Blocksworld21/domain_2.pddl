(define (domain multi-agent-blocks)
  (:requirements :strips :equality)
  (:predicates
    (on ?b ?x)
    (ontable ?b)
    (clear ?b)
    (agent ?a)
    (vowel-agent ?a)
    (consonant-agent ?a)
    (can-move ?a ?b)
    (vowel ?b)
    (consonant ?b)
    (handempty ?a)
    (holding ?a ?b)
  )

  (:action vowel-pickup-from-table
    :parameters (?agent ?x)
    :precondition (and
      (agent ?agent)
      (vowel-agent ?agent)
      (vowel ?x)
      (can-move ?agent ?x)
      (ontable ?x)
      (clear ?x)
      (handempty ?agent)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?agent))
      (holding ?agent ?x)
    )
  )

  (:action vowel-unstack
    :parameters (?agent ?x ?y)
    :precondition (and
      (agent ?agent)
      (vowel-agent ?agent)
      (vowel ?x)
      (can-move ?agent ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty ?agent)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?agent))
      (holding ?agent ?x)
    )
  )

  (:action vowel-putdown
    :parameters (?agent ?x)
    :precondition (and
      (agent ?agent)
      (vowel-agent ?agent)
      (vowel ?x)
      (can-move ?agent ?x)
      (holding ?agent ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?agent)
      (not (holding ?agent ?x))
    )
  )

  (:action vowel-stack
    :parameters (?agent ?x ?y)
    :precondition (and
      (agent ?agent)
      (vowel-agent ?agent)
      (vowel ?x)
      (can-move ?agent ?x)
      (holding ?agent ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty ?agent)
      (not (holding ?agent ?x))
    )
  )

  (:action cons-pickup-from-table
    :parameters (?agent ?x)
    :precondition (and
      (agent ?agent)
      (consonant-agent ?agent)
      (consonant ?x)
      (can-move ?agent ?x)
      (ontable ?x)
      (clear ?x)
      (handempty ?agent)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?agent))
      (holding ?agent ?x)
    )
  )

  (:action cons-unstack
    :parameters (?agent ?x ?y)
    :precondition (and
      (agent ?agent)
      (consonant-agent ?agent)
      (consonant ?x)
      (can-move ?agent ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty ?agent)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?agent))
      (holding ?agent ?x)
    )
  )

  (:action cons-putdown
    :parameters (?agent ?x)
    :precondition (and
      (agent ?agent)
      (consonant-agent ?agent)
      (consonant ?x)
      (can-move ?agent ?x)
      (holding ?agent ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?agent)
      (not (holding ?agent ?x))
    )
  )

  (:action cons-stack
    :parameters (?agent ?x ?y)
    :precondition (and
      (agent ?agent)
      (consonant-agent ?agent)
      (consonant ?x)
      (can-move ?agent ?x)
      (holding ?agent ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty ?agent)
      (not (holding ?agent ?x))
    )
  )
)