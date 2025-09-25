(define (domain multi_agent_blocks)
  (:requirements :strips)
  (:predicates
    ;; world predicates (shared)
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)

    ;; per-agent holding/hand state
    (holding-vowel ?x)
    (holding-consonant ?x)
    (handempty-vowel)
    (handempty-consonant)

    ;; static type predicates
    (vowel ?x)
    (consonant ?x)
  )

  ;; ===== VOWEL AGENT ACTIONS =====
  ;; These actions belong to the vowel-capable agent (moves vowels A, E, I).
  (:action vowel-pickup-from-table
    :parameters (?x)
    :precondition (and (ontable ?x) (clear ?x) (handempty-vowel) (vowel ?x))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-vowel))
      (holding-vowel ?x)
    )
  )

  (:action vowel-unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-vowel) (vowel ?x))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty-vowel))
      (holding-vowel ?x)
      (clear ?y)
    )
  )

  (:action vowel-putdown-on-table
    :parameters (?x)
    :precondition (holding-vowel ?x)
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
    )
  )

  (:action vowel-stack
    :parameters (?x ?y)
    :precondition (and (holding-vowel ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
      (not (clear ?y))
    )
  )

  ;; ===== CONSONANT AGENT ACTIONS =====
  ;; These actions belong to the consonant-capable agent (moves consonants B,C,D,F,G,H,J,K,L,M).
  (:action cons-pickup-from-table
    :parameters (?b)
    :precondition (and (ontable ?b) (clear ?b) (handempty-consonant) (consonant ?b))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-consonant))
      (holding-consonant ?b)
    )
  )

  (:action cons-pickup-from-block
    :parameters (?b ?under)
    :precondition (and (on ?b ?under) (clear ?b) (handempty-consonant) (consonant ?b))
    :effect (and
      (not (on ?b ?under))
      (not (clear ?b))
      (not (handempty-consonant))
      (clear ?under)
      (holding-consonant ?b)
    )
  )

  (:action cons-putdown-on-table
    :parameters (?b)
    :precondition (holding-consonant ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-consonant)
      (not (holding-consonant ?b))
    )
  )

  (:action cons-putdown-on-block
    :parameters (?b ?target)
    :precondition (and (holding-consonant ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (handempty-consonant)
      (not (holding-consonant ?b))
    )
  )
)