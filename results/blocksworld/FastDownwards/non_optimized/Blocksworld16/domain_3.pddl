(define (domain multi_agent_blocks)
  (:requirements :strips :equality :negative-preconditions)
  (:predicates
    (on ?b ?x)
    (ontable ?b)
    (clear ?b)
    (holding ?ag ?b)
    (handempty ?ag)
    (vowel ?b)
    (consonant ?b)
    (is-vowel-agent ?ag)
    (is-consonant-agent ?ag)
  )

  (:action vowel-pickup-from-table
    :parameters (?ag ?b)
    :precondition (and (is-vowel-agent ?ag) (ontable ?b) (clear ?b) (vowel ?b) (handempty ?ag))
    :effect (and
      (not (ontable ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (not (clear ?b))
    )
  )

  (:action vowel-pickup-from-block
    :parameters (?ag ?b ?x)
    :precondition (and (is-vowel-agent ?ag) (on ?b ?x) (clear ?b) (vowel ?b) (handempty ?ag) (not (= ?b ?x)))
    :effect (and
      (not (on ?b ?x))
      (clear ?x)
      (not (handempty ?ag))
      (holding ?ag ?b)
      (not (clear ?b))
    )
  )

  (:action vowel-put-down-to-table
    :parameters (?ag ?b)
    :precondition (and (is-vowel-agent ?ag) (holding ?ag ?b))
    :effect (and
      (ontable ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (clear ?b)
    )
  )

  (:action vowel-put-onto-block
    :parameters (?ag ?b ?x)
    :precondition (and (is-vowel-agent ?ag) (holding ?ag ?b) (clear ?x) (not (= ?b ?x)))
    :effect (and
      (on ?b ?x)
      (not (clear ?x))
      (handempty ?ag)
      (not (holding ?ag ?b))
      (clear ?b)
    )
  )

  (:action consonant-pickup-from-table
    :parameters (?ag ?b)
    :precondition (and (is-consonant-agent ?ag) (ontable ?b) (clear ?b) (consonant ?b) (handempty ?ag))
    :effect (and
      (not (ontable ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (not (clear ?b))
    )
  )

  (:action consonant-pickup-from-block
    :parameters (?ag ?b ?x)
    :precondition (and (is-consonant-agent ?ag) (on ?b ?x) (clear ?b) (consonant ?b) (handempty ?ag) (not (= ?b ?x)))
    :effect (and
      (not (on ?b ?x))
      (clear ?x)
      (not (handempty ?ag))
      (holding ?ag ?b)
      (not (clear ?b))
    )
  )

  (:action consonant-put-down-to-table
    :parameters (?ag ?b)
    :precondition (and (is-consonant-agent ?ag) (holding ?ag ?b))
    :effect (and
      (ontable ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (clear ?b)
    )
  )

  (:action consonant-put-onto-block
    :parameters (?ag ?b ?x)
    :precondition (and (is-consonant-agent ?ag) (holding ?ag ?b) (clear ?x) (not (= ?b ?x)))
    :effect (and
      (on ?b ?x)
      (not (clear ?x))
      (handempty ?ag)
      (not (holding ?ag ?b))
      (clear ?b)
    )
  )
)