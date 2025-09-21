(define (domain multi-agent-blocks)
  (:requirements :strips :equality)
  (:predicates
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)
    (vowel ?x)
    (consonant ?x)
    (holding-vowel ?x)
    (handempty-vowel)
    (holding-consonant ?x)
    (handempty-consonant)
  )

  (:action vowel-pick-up-from-table
    :parameters (?b)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty-vowel))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-vowel))
      (holding-vowel ?b)
    )
  )

  (:action vowel-unstack
    :parameters (?b ?c)
    :precondition (and (vowel ?b) (on ?b ?c) (clear ?b) (handempty-vowel))
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty-vowel))
      (holding-vowel ?b)
      (clear ?c)
    )
  )

  (:action vowel-putdown
    :parameters (?b)
    :precondition (and (vowel ?b) (holding-vowel ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-vowel)
      (not (holding-vowel ?b))
    )
  )

  (:action vowel-stack
    :parameters (?b ?c)
    :precondition (and (vowel ?b) (holding-vowel ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty-vowel)
      (not (holding-vowel ?b))
      (not (clear ?c))
    )
  )

  (:action consonant-pick-up-from-table
    :parameters (?b)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty-consonant))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-consonant))
      (holding-consonant ?b)
    )
  )

  (:action consonant-unstack
    :parameters (?b ?c)
    :precondition (and (consonant ?b) (on ?b ?c) (clear ?b) (handempty-consonant))
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty-consonant))
      (holding-consonant ?b)
      (clear ?c)
    )
  )

  (:action consonant-putdown
    :parameters (?b)
    :precondition (and (consonant ?b) (holding-consonant ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-consonant)
      (not (holding-consonant ?b))
    )
  )

  (:action consonant-stack
    :parameters (?b ?c)
    :precondition (and (consonant ?b) (holding-consonant ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty-consonant)
      (not (holding-consonant ?b))
      (not (clear ?c))
    )
  )
)