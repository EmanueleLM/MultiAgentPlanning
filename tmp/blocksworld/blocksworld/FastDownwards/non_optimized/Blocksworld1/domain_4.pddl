(define (domain multi-agent-blocks)
  (:requirements :strips :equality :negative-preconditions)
  (:predicates
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)
    (vowel ?x)
    (consonant ?x)
    (vowel-agent ?a)
    (consonant-agent ?a)
    (holding ?a ?x)
    (handempty ?a)
  )

  (:action vowel-pick-up-from-table
    :parameters (?ag ?b)
    :precondition (and (vowel-agent ?ag) (vowel ?b) (ontable ?b) (clear ?b) (handempty ?ag))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action vowel-unstack
    :parameters (?ag ?b ?c)
    :precondition (and (vowel-agent ?ag) (vowel ?b) (on ?b ?c) (clear ?b) (handempty ?ag) (not (= ?b ?c)))
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (clear ?c)
    )
  )

  (:action vowel-putdown
    :parameters (?ag ?b)
    :precondition (and (vowel-agent ?ag) (holding ?ag ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  (:action vowel-stack
    :parameters (?ag ?b ?c)
    :precondition (and (vowel-agent ?ag) (holding ?ag ?b) (clear ?c) (not (= ?b ?c)))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (clear ?c))
    )
  )

  (:action consonant-pick-up-from-table
    :parameters (?ag ?b)
    :precondition (and (consonant-agent ?ag) (consonant ?b) (ontable ?b) (clear ?b) (handempty ?ag))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action consonant-unstack
    :parameters (?ag ?b ?c)
    :precondition (and (consonant-agent ?ag) (consonant ?b) (on ?b ?c) (clear ?b) (handempty ?ag) (not (= ?b ?c)))
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (clear ?c)
    )
  )

  (:action consonant-putdown
    :parameters (?ag ?b)
    :precondition (and (consonant-agent ?ag) (holding ?ag ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  (:action consonant-stack
    :parameters (?ag ?b ?c)
    :precondition (and (consonant-agent ?ag) (holding ?ag ?b) (clear ?c) (not (= ?b ?c)))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (clear ?c))
    )
  )
)