(define (domain blocks-multiagent)
  (:requirements :strips :typing)
  (:types block agent slot)

  (:predicates
    (on ?b - block ?x - block)
    (at-table ?b - block ?s - slot)
    (clear ?b - block)
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (vowel-agent ?ag - agent)
    (consonant-agent ?ag - agent)
    (free-slot ?s - slot)
  )

  (:action vowel-pick-from-table
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (vowel-agent ?ag)
      (handempty ?ag)
      (at-table ?b ?s)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (not (at-table ?b ?s))
      (free-slot ?s)
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
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (vowel-agent ?ag)
      (holding ?ag ?b)
      (free-slot ?s)
    )
    :effect (and
      (at-table ?b ?s)
      (not (free-slot ?s))
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
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (consonant-agent ?ag)
      (handempty ?ag)
      (at-table ?b ?s)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (not (at-table ?b ?s))
      (free-slot ?s)
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
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (consonant-agent ?ag)
      (holding ?ag ?b)
      (free-slot ?s)
    )
    :effect (and
      (at-table ?b ?s)
      (not (free-slot ?s))
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