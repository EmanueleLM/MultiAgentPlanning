(define (domain multi-agent-blocks)
  (:requirements :strips :equality)
  (:predicates
    (on ?b ?x)
    (ontable ?b)
    (clear ?b)
    (agent ?a)
    (can-move ?a ?b)
    (consonant ?b)
    (handempty ?a)
    (holding ?a ?b)
  )

  (:action vowel-move-block-block
    :parameters (?agent ?b ?from ?to)
    :precondition (and
      (agent ?agent)
      (can-move ?agent ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?b)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?agent ?b ?to)
    :precondition (and
      (agent ?agent)
      (can-move ?agent ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?agent ?b ?from)
    :precondition (and
      (agent ?agent)
      (can-move ?agent ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?b)
      (clear ?from)
    )
  )

  (:action cons-pickup
    :parameters (?agent ?x)
    :precondition (and
      (agent ?agent)
      (can-move ?agent ?x)
      (consonant ?x)
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
      (can-move ?agent ?x)
      (consonant ?x)
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
      (can-move ?agent ?x)
      (consonant ?x)
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
      (can-move ?agent ?x)
      (consonant ?x)
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