(define (domain multi_agent_blocks)
  (:requirements :strips)
  (:predicates
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)
    (holding-vowel ?x)
    (handempty-vowel)
    (holding-cons ?x)
    (handempty-cons)
    (vowel ?x)
    (consonant ?x)
  )

  (:action vowel-pickup-from-table
    :parameters (?b)
    :precondition (and (ontable ?b) (clear ?b) (vowel ?b) (handempty-vowel))
    :effect (and
      (not (ontable ?b))
      (not (handempty-vowel))
      (holding-vowel ?b)
    )
  )

  (:action vowel-pickup-from-block
    :parameters (?b ?x)
    :precondition (and (on ?b ?x) (clear ?b) (vowel ?b) (handempty-vowel))
    :effect (and
      (not (on ?b ?x))
      (clear ?x)
      (not (handempty-vowel))
      (holding-vowel ?b)
    )
  )

  (:action vowel-put-down-to-table
    :parameters (?b)
    :precondition (and (holding-vowel ?b))
    :effect (and
      (ontable ?b)
      (handempty-vowel)
      (not (holding-vowel ?b))
      (clear ?b)
    )
  )

  (:action vowel-put-onto-block
    :parameters (?b ?x)
    :precondition (and (holding-vowel ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (not (clear ?x))
      (handempty-vowel)
      (not (holding-vowel ?b))
      (clear ?b)
    )
  )

  (:action consonant-pickup-from-table
    :parameters (?b)
    :precondition (and (ontable ?b) (clear ?b) (consonant ?b) (handempty-cons))
    :effect (and
      (not (ontable ?b))
      (not (handempty-cons))
      (holding-cons ?b)
    )
  )

  (:action consonant-pickup-from-block
    :parameters (?b ?x)
    :precondition (and (on ?b ?x) (clear ?b) (consonant ?b) (handempty-cons))
    :effect (and
      (not (on ?b ?x))
      (clear ?x)
      (not (handempty-cons))
      (holding-cons ?b)
    )
  )

  (:action consonant-put-down-to-table
    :parameters (?b)
    :precondition (and (holding-cons ?b))
    :effect (and
      (ontable ?b)
      (handempty-cons)
      (not (holding-cons ?b))
      (clear ?b)
    )
  )

  (:action consonant-put-onto-block
    :parameters (?b ?x)
    :precondition (and (holding-cons ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (not (clear ?x))
      (handempty-cons)
      (not (holding-cons ?b))
      (clear ?b)
    )
  )
)