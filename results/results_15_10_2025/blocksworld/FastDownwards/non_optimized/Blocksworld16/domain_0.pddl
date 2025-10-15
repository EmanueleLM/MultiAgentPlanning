(define (domain multi_agent_blocks)
  (:requirements :strips)
  (:predicates
    (on ?x ?y)        ;; block ?x directly on block ?y
    (ontable ?x)      ;; block ?x on the table
    (clear ?x)        ;; nothing on ?x
    (holding ?x)      ;; the vowel agent is holding ?x
    (handempty)       ;; vowel agent's hand is empty
    (vowel ?x)        ;; block ?x is manipulable by the vowel agent
    (consonant ?x)    ;; block ?x is manipulable by the consonant agent
  )

  ;; Vowel-agent actions (use a single-handed pick/place model)
  (:action vowel-pickup-from-table
    :parameters (?b)
    :precondition (and (ontable ?b) (clear ?b) (vowel ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  (:action vowel-pickup-from-block
    :parameters (?b ?x)
    :precondition (and (on ?b ?x) (clear ?b) (vowel ?b) (handempty))
    :effect (and
      (not (on ?b ?x))
      (clear ?x)
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  (:action vowel-put-down-to-table
    :parameters (?b)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  (:action vowel-put-onto-block
    :parameters (?b ?x)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (handempty)
      (not (clear ?x))
      (not (holding ?b))
    )
  )

  ;; Consonant-agent actions (direct moves without holding; labeled clearly)
  (:action consonant-move-block-to-block
    :parameters (?x ?from ?to)
    :precondition (and (consonant ?x) (clear ?x) (clear ?to) (on ?x ?from))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?x ?to)
    :precondition (and (consonant ?x) (clear ?x) (clear ?to) (ontable ?x))
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?x ?from)
    :precondition (and (consonant ?x) (clear ?x) (on ?x ?from))
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
  )
)