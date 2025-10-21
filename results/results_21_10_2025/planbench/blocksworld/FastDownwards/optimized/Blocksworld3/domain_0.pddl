(define (domain multiagent_blocks)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; Shared world predicates
    (on ?x ?y)        ; block ?x is on block ?y
    (ontable ?x)      ; block ?x is on the table
    (clear ?x)        ; nothing on top of block ?x

    ;; Ownership predicates: which agent may manipulate which block
    (vowel ?x)
    (consonant ?x)

    ;; Vowel-agent specific hand state
    (vowel_holding ?x)
    (vowel_handempty)
  )

  ;; Vowel-agent actions (prefix vowel_)
  (:action vowel_pickup-from-table
    :parameters (?b)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (vowel_handempty)
    )
    :effect (and
      (vowel_holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (vowel_handempty))
    )
  )

  (:action vowel_unstack
    :parameters (?b ?under)
    :precondition (and
      (vowel ?b)
      (on ?b ?under)
      (clear ?b)
      (vowel_handempty)
    )
    :effect (and
      (vowel_holding ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (clear ?b))
      (not (vowel_handempty))
    )
  )

  (:action vowel_stack
    :parameters (?b ?target)
    :precondition (and
      (vowel ?b)
      (vowel_holding ?b)
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (vowel_handempty)
      (not (vowel_holding ?b))
    )
  )

  (:action vowel_put-down
    :parameters (?b)
    :precondition (and
      (vowel ?b)
      (vowel_holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (vowel_handempty)
      (not (vowel_holding ?b))
    )
  )

  ;; Consonant-agent actions (prefix consonant_)
  ;; Consonant agent does not use a hand predicate; it moves blocks directly.
  ;; Also the consonant actions require that the block is not currently held by the vowel agent.
  (:action consonant_move-block-to-block
    :parameters (?x ?from ?to)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (not (vowel_holding ?x))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant_move-table-to-block
    :parameters (?x ?to)
    :precondition (and
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
      (not (vowel_holding ?x))
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (clear ?x)
      (not (clear ?to))
    )
  )

  (:action consonant_move-block-to-table
    :parameters (?x ?from)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (not (vowel_holding ?x))
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?x)
      (clear ?from)
    )
  )
)